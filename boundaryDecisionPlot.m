function boundaryDecisionPlot(model,clases,x,y,xVal,error,rate,dt,T,nsamples)
[xrows,xcols,samples]=size(x);
%figure('Name','Boundary Decision ')
xx=linspace(-0.5,10.5,nsamples);

for i=1:nsamples
    for j=1:nsamples
        DataTemp=[xx(i), xx(i);xx(j), xx(j)];
        [nspikes,response,t]=SNNActivation(model,DataTemp,xVal,dt,T);
        [m boundaries(i,j)]=min(abs(rate-nspikes));
    end
end
imagesc(xx,xx,boundaries');
hold on;
set(gca,'ydir','normal');

% colormap for the classes:
% class 1 = light red, 2 = light green, 3 = light blue
switch clases
    case 2
        cmap = [1 0.8 0.8; 0.8 1 0.8];
    case 3
        cmap = [1 0.8 0.8; 0.8 1 0.8; 0.9 0.9 1];
    case 4
        cmap = [1 0.8 0.8; 0.8 1 0.8; 0.9 0.9 1; 0.86 0.86 0.86];
end

colormap(cmap);

for i=1:xrows
    switch y(i)
        case 1
            colorC='r';
            
        case 2
            colorC='g';
            
        case 3
            colorC='b';
            
        case 4
            colorC='k';
    end
    scatter(x(i,1,1),x(i,2,1),colorC,'filled')
end
grid on;
xlim([-0.5,10.5])
ylim([-0.5,10.5])
title(['Error = ',num2str(error)])