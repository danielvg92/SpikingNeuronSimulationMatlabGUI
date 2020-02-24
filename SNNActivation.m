function [spikes, response,t] = SNNActivation(model,x,w,dt,T) %% x >> [ninputs,nsamples]
[ninputs,NT] = size(x);
nlayers=length(model);
newinputs=zeros(1,NT);
wrest=w;
p=wrest(end-sum(model(2:end))+1:end);
p=abs(p)*3/10;
wrest=wrest(1:end-sum(model(2:end)));
% p=1.5;
t=0:dt:T-dt; %Time Array ms
contNN=1;
for i=2:nlayers
    nneurons=model(i);
    ninputsFL=model(i-1);
    xinput=x;
    if i>2
        xinput=newinputs;
    end
    newinputs=[];
    nnspikes=[];
    for j=1:nneurons
        wtemp=squeeze(wrest(1:ninputsFL));
        wrest=squeeze(wrest(ninputsFL+1:end));
        pp=p(contNN);
        contNN=contNN+1;
        [row,cols]=size(xinput);
        I=abs((((xinput'*wtemp')')+1).^pp);
        % I=exp(-p.*((sum(xinput-wtemp')).^2));
        if length(I)<length(t) && cols>1
            xii=linspace(0,1,length(I));
            x2=linspace(0,1,length(t));
            I = interp1(xii,I,x2,'spline');
        end
        vOffset=50;
        a=0.02; b=0.2; c=-65; d=8; vPeak=35; % neocortical pyramidal neurons
        [nspikes, response,t] = Izhikevich(I,dt,T,a,b,c,d,vPeak,vOffset);

%         I = (I - min(I)) / ( max(I) - min(I) );
%         I = I/max(I);
%         [nspikes, response,t] = HodgkinHuxley(I,dt,T,vOffset);
        
        
        nnspikes=horzcat(nnspikes,nspikes);
        newinputs=vertcat(newinputs,response);
    end
end
spikes=nnspikes;
response=newinputs;