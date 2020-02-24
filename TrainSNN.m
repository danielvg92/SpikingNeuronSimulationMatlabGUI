function rate = TrainSNN(dataSetName,NeuralModel,flag)
%clear;close all;clc;
%Patrones de entrada acotados entre 1-10
%Pesos acotados entre 0-10
%dt = 0.01
if flag == 0
    [x,y,clases] = loadSyntheticDataset(dataSetName,100);
    dataSetPlot(x,y)
    rate = 0;
end

if flag == 1
    T=15;
    dt=0.1;
    
    PSO_Conf.Iterations = 20; %maximum number of iterations (generations)
    PSO_Conf.SwarmSize = 100; %number of population members
    PSO_Conf.ErrGoal = 0.00; %stop when ofunc < VTR
    PSO_Conf.lb = -10;
    PSO_Conf.ub = 10;
    PSO_Conf.w_start = 0.95;
    PSO_Conf.w_end = 0.4;
    PSO_Conf.Vmin = -5;
    PSO_Conf.Vmax = 5;
    PSO_Conf.c1 = 2; %% Local
    PSO_Conf.c2 = 2; %% Global
    PSO_Conf.Chi = 0.75;
    PSO_Conf.refresh = 1;
    
    [x,y,clases] = loadSyntheticDataset(dataSetName,100);
    xtest = x;
    ytest = y;
    % [x,y,xtest,ytest,clases] = loadTemporalDataset('EEG_MotionIntention1_PSD',1000);
    %[x,y,xtest,ytest,clases] = loadTemporalDataset('HeartSounds_Chroma',1000);
    % figure()
    % hist(y,1:1:clases);
    
    [xrows,xcols,samples]=size(x);
    model=[xcols,NeuralModel];
    % w=rand(1,2)*10;
    
    % [error, rate]=EvalSNN(classes,x,y,model,w,dt,T);
    
    [xx,f,xVal,nf,history,itera] = PSO_SNN(PSO_Conf,model,dt,T,x,y,xtest,ytest,clases);
    [errorTrain, rate, mconfu]=EvalSNN(clases,x,y,model,xVal,dt,T);
    % [errorTest, rate, mconfu]=EvalSNN(clases,xtest,ytest,model,xVal,dt,T);
    
    [pattern,feature,sample]=size(xtest);
    for i=1:pattern
        [nspikes,response,t]=SNNActivation(model,squeeze(xtest(i,:,:)),xVal,dt,T);
        predictionsSpikes(i)=nspikes;
    end
    [acc,predictions,mconfu]=Performance(clases,predictionsSpikes,ytest,rate);
    errorTest=1-acc;
    
    %rasterPlot(x,y,clases,model,xVal,rate,dt,T)
%     clf;
    boundaryDecisionPlot(model,clases,x,y,xVal,errorTest,rate,dt,T,100)
end




