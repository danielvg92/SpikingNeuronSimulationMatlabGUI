function [accuracy,predictionLabels,mconfu]=Performance(classes,DataTestSpikes,DataTestLabels,rate)

countTR=0;
mconfu=zeros(classes,classes);

for i=1:length(DataTestLabels)
    [m prediction(i)]=min(abs(rate-DataTestSpikes(i)));    
    
    if prediction(i)==DataTestLabels(i)
        countTR=countTR+1;
    end
    mconfu(DataTestLabels(i),prediction(i))=mconfu(DataTestLabels(i),prediction(i))+1;
end
accuracy=countTR/length(DataTestLabels);
predictionLabels=prediction;