function Compute_Surface_Dose(Head_Centre, Head_Axes, Helmet, Isocentre, PTV_Centre, PTV_Radius, OAR_Centre, OAR_Radius)
%COMPUTE_SURFACE_DOSE A function to compute the dose on the surfaces of the 
% PTV and OAR. 
    [x, y, z] = sphere;
    
    [m, n] = size(x);
    
    %OAR SPHERE VALUES
    oarX = x*OAR_Radius + OAR_Centre(1);
    oarY = y*OAR_Radius + OAR_Centre(2);
    oarZ = z*OAR_Radius + OAR_Centre(3);
    
    %PTV SPHERE VALUES
    ptvX = x*PTV_Radius + PTV_Centre(1);
    ptvY = y*PTV_Radius + PTV_Centre(2);
    ptvZ = z*PTV_Radius + PTV_Centre(3);
    
    %PTV & OAR SURFACE DOSES
    ptvSurfaceDoses = zeros(m, n);
    oarSurfaceDoses = zeros(m, n);
    
    hottestOAR = -inf;
    coldestOAR = inf;
    %hottest and coldest oar points
    h_OAR_Point = [];
    c_OAR_Point = [];
    
    hottestPTV = -inf;
    coldestPTV = inf;
    %hottest and coldest ptv points
    h_PTV_Point = [];
    c_PTV_Point = [];
    
    for i = 1:m
       for j = 1:n  
       %Get surface dose for each point, record the value.
       oar = [oarX(i, j); oarY(i, j); oarZ(i, j)];
       oarDose = Compute_Point_Dose(Head_Centre, Head_Axes, Helmet, OAR_Centre, OAR_Radius, Isocentre, oar);
       oarSurfaceDoses(i, j) = oarDose;
       
       if oarDose > hottestOAR
           hottestOAR = oarDose;
           h_OAR_Point = oar;
       end
       if oarDose < coldestOAR
           coldestOAR = oarDose;
           c_OAR_Point = oar;
       end
       
       ptv = [ptvX(i, j); ptvY(i, j); ptvZ(i, j)];
       ptvDose = Compute_Point_Dose(Head_Centre, Head_Axes, Helmet, OAR_Centre, OAR_Radius, Isocentre, ptv);
       ptvSurfaceDoses(i, j) = ptvDose;
       
       if ptvDose > hottestPTV
           hottestPTV = ptvDose;
           h_PTV_Point = ptv;
       end
       if ptvDose < coldestPTV
           coldestPTV = ptvDose;
           c_PTV_Point = ptv;
       end
       end
    end

    %Plot surfaces
    figure
    hold on
    
    %Plot OAR SURFACE
    oarsurf = surf(oarX, oarY, oarZ, oarSurfaceDoses);
    set(oarsurf, 'FaceAlpha', 0.7)
    
    %Plot PTV SURFACE
    ptvsurf = surf(ptvX, ptvY, ptvZ, ptvSurfaceDoses);
    set(ptvsurf, 'FaceAlpha', 0.7)
    colorbar
    
    %Plot hottest and coldest oar points
    plot3(h_OAR_Point(1), h_OAR_Point(2), h_OAR_Point(3), 'r.','MarkerSize', 50)
    plot3(c_OAR_Point(1), c_OAR_Point(2), c_OAR_Point(3), 'b.','MarkerSize', 50)
    
    %Plot hottest and coldest ptv points
    plot3(h_PTV_Point(1), h_PTV_Point(2), h_PTV_Point(3), 'r.','MarkerSize', 50)
    plot3(c_PTV_Point(1), c_PTV_Point(2), c_PTV_Point(3), 'b.','MarkerSize', 50)
    
    title('Surface Doses')
    xlabel('X-Axis')
    ylabel('Y-Axis')
    zlabel('Z-Axis')
    legend('OAR Surface', 'PTV Surface', 'Hottest Points', 'Coldest Points')
    
    fprintf('Hottest Point on PTV: %s\n', mat2str(h_PTV_Point'));
    fprintf('Coldest Point on PTV: %s\n\n', mat2str(c_PTV_Point'));
    
    fprintf('Hottest Point on OAR: %s\n', mat2str(h_OAR_Point'));
    fprintf('Coldest Point on OAR: %s\n', mat2str(c_OAR_Point'));
    hold off
end



