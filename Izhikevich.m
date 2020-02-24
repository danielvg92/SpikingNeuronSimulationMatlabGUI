function [spikes, response,t] = Izhikevich(I,dt,T,a,b,c,d,vPeak,vOffset)
t=0:dt:T-dt; %Time Array ms
% a=0.02; b=0.2; c=-65; d=8; % neocortical pyramidal neurons
% vPeak=35; % spike cutoff
% vOffset=50;
spikes=0;

V(1)=-60; % Initial Membrane voltage
u(1)=0*V(1);
for i=1:length(t)-1
    u(i+1)=u(i)+dt*(a*(b*V(i)-u(i)));
    if length(I)==1
        V(i+1)=V(i)+dt*((0.04*V(i)^2)+5*V(i)+140+I(1));
    else
        V(i+1)=V(i)+dt*((0.04*V(i)^2)+5*V(i)+140+I(i));
    end
    if V(i+1)>= vPeak % a spike is fired!
        V(i) = vPeak; % padding the spike amplitude
        V(i+1) = c; % membrane voltage reset
        u(i+1) = u(i+1) + d; % recovery variable update
        spikes=spikes+1;
    end
end
V=V+vOffset;
response=V;
