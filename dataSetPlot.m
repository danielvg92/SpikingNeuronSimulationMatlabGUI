function dataSetPlot(x,y)
[xrows,xcols,samples]=size(x);

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
    hold on
end
grid on;
xlim([-0.5,10.5])
ylim([-0.5,10.5])