function rasterPlot(x,y,clases,model,xVal,rate,dt,T)

colorC={'r.','g.','b.','k.'};

[xrows,xcols,samples]=size(x);
cont=ones(1,clases);
for i=1:xrows
    [nspikes,response,t]=SNNActivation(model,squeeze(x(i,:,:)),xVal,dt,T);
    [m prediction(i)]=min(abs(rate-nspikes));
    temp(y(i)).response(cont(y(i)),:) = response;
    tempNSpikes(y(i)).nspikes(cont(y(i))) = nspikes;
    cont(y(i))=cont(y(i))+1;
    
end

for z=1:clases
    temp(z).response=(temp(z).response==85);
    [r,c]=size(temp(z).response);
    figure('Name',['Raster Class ',num2str(z)])
    title(['Raster Class ',num2str(z) ,' NSpikes: ',num2str(min(tempNSpikes(z).nspikes)),' - ',num2str(max(tempNSpikes(z).nspikes))])
    hold on;
    for i=1:r
        for j=1:c
            if temp(z).response(i,j)==1
%                 plot(j,i,colorC{z})
                plot(j,i,'b.')
            end
        end
    end
    grid; grid minor;
end

