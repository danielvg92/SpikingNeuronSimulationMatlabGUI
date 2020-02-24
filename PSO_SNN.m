% A basic PSO Algorithms
%
% Arguments     :
%                   f2eval     : Objective function to evaluate
%                   ErrGoal    : Error to reach
%                   Dim        : Dimension of each particle
%                   lb         : lower boundary of search space
%                   ub         : upper boundary of search space
%                   SwarmSize  : Number of particles in the swarm
%                   Iterations : number of generations
%                   Data       : Patterns to be classified
%                   Classes    : Number of classes
%                   w_start    : initial inertia value
%                   w_end      : end inertia value
%                   Vmin       : minimum velocity
%                   Vmax       : maximum velocity
%                   c1, c2     : crazyness factor
%                   Chi        : Chi factor
%                   refresh    :
% Return Values :
%                   xmin       : Particle that optimize the objetive function
%                   fxmin      : Best evaluation value
%                   fevals     : Number of evaluated functions
%                   history    : evolution of the function
%                   iter       : number of iteration to optimize the function
%

function [xmin,fxmin,xVAL, fevals, history,iter] = PSO_SNN(PSO_Conf,model,dt,T,Data,DataLabels,DataTest,DataTestLabels,Classes)

ErrGoal=PSO_Conf.ErrGoal;
lb=PSO_Conf.lb;
ub=PSO_Conf.ub;
SwarmSize=PSO_Conf.SwarmSize;
Iterations=PSO_Conf.Iterations;
w_start=PSO_Conf.w_start;
w_end=PSO_Conf.w_end;
Vmin=PSO_Conf.Vmin;
Vmax=PSO_Conf.Vmax;
c1=PSO_Conf.c1;
c2=PSO_Conf.c2;
Chi=PSO_Conf.Chi;
refresh=PSO_Conf.refresh;

nlayer=length(model);
Dim=0;
for ilayer=2:nlayer
    nneurons=model(ilayer);
    ninputsFL=model(ilayer-1);
    Dim=Dim+ninputsFL*nneurons;
end
Dim = Dim + sum(model(2:end));
GM = 0; % Global minimum used in the stopping criterion

% Initializing variables
success = 0; % Success Flag
iter = 0;   % Iterations' counter
fevals = 0; % Function evaluations' counter

%Weight change step. Defines total number of iterations for which weight is changed.
w_varyfor = floor(1*Iterations);
w_now = w_start;
%Inertia weight's change per iteration
inertdec = (w_start-w_end)/w_varyfor;

% Initialize Swarm and Velocity
Swarm = rand(SwarmSize, Dim)*(ub-lb) + lb;
VStep = rand(SwarmSize, Dim);

%Find initial function values.
for k=1:SwarmSize
    [fSwarm(k), rate, mconfu]=EvalSNN(Classes,Data,DataLabels,model,squeeze(Swarm(k,:)),dt,T);
end
fevals = fevals + SwarmSize;

% Initializing the Best positions matrix and the corresponding function values
PBest = Swarm;
fPBest = fSwarm;

% Finding best particle in initial population
[fGBest, g] = min(fSwarm);
lastbpf = fGBest;
Best = Swarm(g,:);
fBest = fGBest;
% history = [0, fGBest];
fGBestValDef=100;

while( (success == 0) && (iter <= Iterations) )
    tic
    iter = iter+1;
    
    % Update the value of the inertia weight w
    if (iter<=w_varyfor) && (iter > 1)
        w_now = w_now - inertdec;
    end
    
    
    % Set GBest
    A = repmat(Swarm(g,:), SwarmSize, 1);
    
    % Generate Random Numbers
    R1 = rand(SwarmSize, Dim);
    R2 = rand(SwarmSize, Dim);
    
    % Calculate Velocity
    VStep = w_now*VStep + c1*R1.*(PBest-Swarm) + c2*R2.*(A-Swarm);
    
    % Apply Vmax Operator for v > Vmax
    changeRows = VStep > Vmax;
    VStep(find(changeRows)) = Vmax;
    
    % Apply Vmax Operator for v < -Vmax
    changeRows = VStep < Vmin;
    VStep(find(changeRows)) = Vmin;
    
    %UPDATE POSITIONS OF PARTICLES
    Swarm = Swarm + Chi * VStep;
    
    % Apply ub Operator for x > ub
    changeRows = Swarm > ub;
    Swarm(find(changeRows)) = ub;
    % Apply lb Operator for x < lb
    changeRows = Swarm < lb;
    Swarm(find(changeRows)) = lb;
    
    %Evaluate swarm
    
    for k=1:SwarmSize
        [fSwarm(k), rate,mconfu]=EvalSNN(Classes,Data,DataLabels,model,squeeze(Swarm(k,:)),dt,T);
    end
    fevals = fevals + SwarmSize;
    
    % Update the best position for each particle
    changeRows = fSwarm < fPBest;
    fPBest(find(changeRows)) = fSwarm(find(changeRows));
    PBest(find(changeRows), :) = Swarm(find(changeRows), :);
    lastbpart = PBest(g, :);
    
    % Updating index g
    [fGBest, g] = min(fPBest);
    
    %Update Best. Only if fitness has improved.
    if fGBest < lastbpf
        [fGBest, b] = min(fPBest);
        Best = PBest(b,:);
        
    end
    fGBestVal=fGBest;
    
%     [fSwarm(k), rate,mconfu]=EvalSNN(Classes,Data,DataLabels,model,Best,dt,T);
%     
%     [pattern,feature,sample]=size(DataTest);
%     for i=1:pattern
%         [nspikes,response,t]=SNNActivation(model,squeeze(DataTest(i,:,:)),Best,dt,T);
%         predictionsSpikes(i)=nspikes;
%     end
%     [acc,predictions,mconfu]=Performance(Classes,predictionsSpikes,DataTestLabels,rate);
    
%     fGBestVal=1-acc;
    
    
    %%OUTPUT%%
    history(iter,:)=[fGBest,fGBestVal];
    if (refresh > 0)
        if (rem(iter,refresh) == 0)
            
            fprintf(1,'Iteration: %d, BestIndex: %d, BestError: %f, BestValError: %f, w: %f, Wmin: %f, Wmax: %f, Time: %f\n',iter,g,fGBest,fGBestVal,w_now,min(Best),max(Best),toc);
        end
    end
    
    if fGBestVal<=fGBestValDef
        xVAL=Best;
        fGBestValDef=fGBestVal;
    end
    
    
    
    %%TERMINATION%%
    if abs(fGBest-GM) <= ErrGoal     %GBest
        success = 1;
    elseif abs(fBest-GM)<=ErrGoal    %Best
        success = 1;
    else
        lastbpf = fGBest; %To be used to find Best
    end
    
    
    if mod(iter,10)==0
        [fGBest, g] = min(fPBest);
        [fGBest2, indBest] = sort(fPBest);
        indReset=indBest(round(SwarmSize/2):end);
        for ll=1:length(indReset)
            Swarm(indReset(ll),:) = squeeze(rand(1,Dim))*(ub-lb) + lb;
            VStep(indReset(ll),:) = squeeze(rand(1,Dim));
            %             Swarm(indReset(ll),:) = -Swarm(indReset(ll),:);
            %             VStep(indReset(ll),:) = -VStep(indReset(ll),:);
        end
        %         Swarm(indReset(1),:) = squeeze(rand(1,Dim))*(ub-lb) + lb;
        %         VStep(indReset(1),:) = squeeze(rand(1,Dim));
        for k=1:SwarmSize
            [fSwarm(k), rate,mconfu]=EvalSNN(Classes,Data,DataLabels,model,squeeze(Swarm(k,:)),dt,T);
        end
        fevals = fevals + SwarmSize;
        % Update the best position for each particle
        fPBest= fSwarm;
        PBest= Swarm;
        
        % Updating index g
        [fGBest, g] = min(fPBest);
        Best = PBest(g,:);
        
    end
    
end

[fxmin, b] = min(fPBest);
xmin = PBest(b, :);

