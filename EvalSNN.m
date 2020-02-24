function [error,rate,mconfu]=EvalSNN(classes,x,y,model,w,dt,T)
[pattern,feature,sample]=size(x);
ratePrediction=zeros(1,classes);
contRatePrediction=zeros(1,classes);
for i=1:pattern
    [nspikes,response,t]=SNNActivation(model,squeeze(x(i,:,:)),w,dt,T);
    predictionsSpikes(i)=nspikes;
    predictionsResponse(i,:)=response;
    ratePrediction(y(i))=ratePrediction(y(i))+nspikes;
    contRatePrediction(y(i))=contRatePrediction(y(i))+1;
end
rate=ratePrediction./contRatePrediction;
[acc,predictions,mconfu]=Performance(classes,predictionsSpikes,y,rate);
error=1-acc;

