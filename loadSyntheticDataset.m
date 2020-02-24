function [x,y,clases]=loadSyntheticDataset(datasetName,N)

switch datasetName
    case 'AND'
        nvalues=N/4;
        x(1,:)=[0 0];
        x(2,:)=[0 1];
        x(3,:)=[1 0];
        x(4,:)=[1 1];
        %         x=(x+1)*10;
        clases=2;
        data=repmat(x,nvalues,1);
        y=[1,
            1,
            1,
            2];
        y=repmat(y,nvalues,1);
        
        data = awgn(data,30,'measured');
        
        x=[];
        for i=1:length(y)
            x(i,:,:) = [data(i,:);data(i,:)]';
        end
        xmin=min(min(min(x)));
        xmax=max(max(max(x)));
        x=(10-1)*(x-xmin)/(xmax-xmin)+1;
        
    case 'OR'
        nvalues=N/4;
        x(1,:)=[0 0];
        x(2,:)=[0 1];
        x(3,:)=[1 0];
        x(4,:)=[1 1];
        %         x=(x+1)*10;
        clases=2;
        data=repmat(x,nvalues,1);
        y=[1,
            2,
            2,
            2];
        y=repmat(y,nvalues,1);
        
        data = awgn(data,30,'measured');
        
        x=[];
        for i=1:length(y)
            x(i,:,:) = [data(i,:);data(i,:)]';
        end
        xmin=min(min(min(x)));
        xmax=max(max(max(x)));
        x=(10-1)*(x-xmin)/(xmax-xmin)+1;
        
    case 'XOR'
        nvalues=N/4;
        x(1,:)=[0 0];
        x(2,:)=[0 1];
        x(3,:)=[1 0];
        x(4,:)=[1 1];
        %         x=(x+1)*10;
        clases=2;
        data=repmat(x,nvalues,1);
        y=[1,
            2,
            2,
            1];
        y=repmat(y,nvalues,1);
        
        data = awgn(data,15,'measured');
        
        x=[];
        for i=1:length(y)
            x(i,:,:) = [data(i,:);data(i,:)]';
        end
        xmin=min(min(min(x)));
        xmax=max(max(max(x)));
        x=(10-1)*(x-xmin)/(xmax-xmin)+1;
        
    case 'Spirals'
        clases=2;
        degrees = 570;
        start = 90;
        noise = 0.2;
        deg2rad = (2*pi)/360;
        start = start * deg2rad;
        N1 = floor(N/2);
        N2 = N-N1;
        n = start + sqrt(rand(N1,1)) * degrees * deg2rad;
        d1 = [-cos(n).*n + rand(N1,1)*noise sin(n).*n+rand(N1,1)*noise zeros(N1,1)];
        n = start + sqrt(rand(N1,1)) * degrees * deg2rad;
        d2 = [cos(n).*n+rand(N2,1)*noise -sin(n).*n+rand(N2,1)*noise ones(N2,1)];
        data = [d1;d2];
        y=data(:,3)+1;
        for i=1:length(y)
            x(i,:,:) = [data(i,1),data(i,1);data(i,2),data(i,2)];
        end
        xmin=min(min(min(x)));
        xmax=max(max(max(x)));
        x=(10-1)*(x-xmin)/(xmax-xmin)+1;
        
    case 'ClusterInCluster'
        clases=2;
        r1 = 1;
        r2 = 5*r1;
        w1 = 0.8;
        w2 = 1/3;
        arms = 64;
        data = [];
        N1 = floor(N/2);
        N2 = N-N1;
        phi1 = rand(N1,1) * 2 * pi;
        dist1 = r1 + randi(3,[N1,1])/3 * r1 * w1;
        d1 = [dist1 .* cos(phi1) dist1 .* sin(phi1) zeros(N1,1)];
        perarm = round(N2/arms);
        N2 = perarm * arms;
        radperarm = (2*pi)/arms;
        phi2 = ((1:N2) - mod(1:N2, perarm))/perarm * (radperarm);
        phi2 = phi2';
        dist2 = r2 * (1 - w2/2) + r2 * w2 * mod(1:N2, perarm)'/perarm;
        d2 = [dist2 .* cos(phi2) dist2 .* sin(phi2) ones(N2,1)];
        data = [d1;d2];
        y=data(:,3)+1;
        for i=1:length(y)
            x(i,:,:) = [data(i,1),data(i,1);data(i,2),data(i,2)];
        end
        xmin=min(min(min(x)));
        xmax=max(max(max(x)));
        x=(10-1)*(x-xmin)/(xmax-xmin)+1;
        
    case 'Corners'
        clases=4;
        if mod(N,8) ~= 0
            N = round(N/8) * 8;
        end
        scale = 10;
        gapwidth = 2;
        cornerwidth = 2;
        perCorner = N/4;
        xplusmin = [ones(perCorner,1); -1*ones(perCorner,1); ones(perCorner,1); -1*ones(perCorner,1)];
        yplusmin = [ones(perCorner,1); -1*ones(2*perCorner,1); ones(perCorner,1)];
        
        horizontal = [xplusmin(1:2:end) * gapwidth + xplusmin(1:2:end) * scale .* rand(N/2,1), ...
            yplusmin(1:2:end) * gapwidth + cornerwidth * yplusmin(1:2:end) .* rand(N/2,1), ...
            floor((0:N/2-1)'/(perCorner*.5))];
        
        vertical = [xplusmin(2:2:end) * gapwidth + cornerwidth * xplusmin(2:2:end) .* rand(N/2,1), ...
            yplusmin(2:2:end) * gapwidth + yplusmin(2:2:end) * scale .* rand(N/2,1), ...
            floor((0:N/2-1)'/(perCorner*.5))];
        
        data=  [horizontal; vertical];
        y=data(:,3)+1;
        for i=1:length(y)
            x(i,:,:) = [data(i,1),data(i,1);data(i,2),data(i,2)];
        end
        xmin=min(min(min(x)));
        xmax=max(max(max(x)));
        x=(10-1)*(x-xmin)/(xmax-xmin)+1;
        
    case 'Outlier'
        clases=4;
        r = 20;
        dist = 30;
        outliers = 0.04;
        noise = 5;
        N1 = round(N * (.5-outliers));
        N2 = N1;
        N3 = round(N * outliers);
        N4 = N-N1-N2-N3;
        phi1 = rand(N1,1) * pi;
        r1 = sqrt(rand(N1,1))*r;
        P1 = [-dist + r1.*sin(phi1) r1.*cos(phi1) zeros(N1,1)];
        phi2 = rand(N2,1) * pi;
        r2 = sqrt(rand(N2,1))*r;
        P2 = [dist - r2.*sin(phi2) r2.*cos(phi2) 3*ones(N2,1)];
        P3 = [rand(N3,1)*noise dist+rand(N3,1)*noise 2*ones(N3,1)];
        P4 = [rand(N4,1)*noise -dist+rand(N4,1)*noise ones(N4,1)];
        data = [P1; P2; P3; P4];
        y=data(:,3)+1;
        for i=1:length(y)
            x(i,:,:) = [data(i,1),data(i,1);data(i,2),data(i,2)];
        end
        xmin=min(min(min(x)));
        xmax=max(max(max(x)));
        x=(10-1)*(x-xmin)/(xmax-xmin)+1;
        
    case 'CrescentFullMoon'
        clases=2;
        if mod(N,4) ~= 0
            N = round(N/4) * 4;
        end
        r1 = 5;
        r2 = 10;
        r3 = 15;
        N1 = N/4;
        N2 = N-N1;
        phi1 = rand(N1,1) * 2 * pi;
        R1 = sqrt(rand(N1, 1));
        moon = [cos(phi1) .* R1 * r1 sin(phi1) .* R1 * r1 zeros(N1,1)];
        d = r3 - r2;
        phi2 = pi + rand(N2,1) * pi;
        R2 = sqrt(rand(N2,1));
        crescent = [cos(phi2) .* (r2 + R2 * d) sin(phi2) .* (r2 + R2 * d) ones(N2,1)];
        data = [moon; crescent];
        y=data(:,3)+1;
        for i=1:length(y)
            x(i,:,:) = [data(i,1),data(i,1);data(i,2),data(i,2)];
        end
        xmin=min(min(min(x)));
        xmax=max(max(max(x)));
        x=(10-1)*(x-xmin)/(xmax-xmin)+1;
        
    case 'HalfKernel'
        clases=2;
        if mod(N,2) ~= 0
            N = N + 1;
        end
        minx = -20;
        r1 = 20;
        r2 = 35;
        noise = 4;
        ratio = 0.6;
        phi1 = rand(N/2,1) * pi;
        inner = [minx + r1 * sin(phi1) - .5 * noise  + noise * rand(N/2,1) r1 * ratio * cos(phi1) - .5 * noise + noise * rand(N/2,1) ones(N/2,1)];
        
        phi2 = rand(N/2,1) * pi;
        outer = [minx + r2 * sin(phi2) - .5 * noise  + noise * rand(N/2,1) r2 * ratio * cos(phi2) - .5 * noise  + noise * rand(N/2,1) zeros(N/2,1)];
        data = [inner; outer];
        y=data(:,3)+1;
        for i=1:length(y)
            x(i,:,:) = [data(i,1),data(i,1);data(i,2),data(i,2)];
        end
        xmin=min(min(min(x)));
        xmax=max(max(max(x)));
        x=(10-1)*(x-xmin)/(xmax-xmin)+1;
        
end







