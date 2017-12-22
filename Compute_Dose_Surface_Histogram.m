function Compute_Dose_Surface_Histogram(Head_Centre, Head_Axes, Helmet, Isocentre, PTV_Centre, PTV_Radius, OAR_Centre, OAR_Radius)
%COMPUTE_DOSE_SURFACE_HISTOGRAM A function to compute the dose surface 
% histogram (DSH) for the PTV. 
    [x, y, z] = sphere;
    
    %PTV SPHERE VALUES
    ptvX = x*PTV_Radius + PTV_Centre(1);
    ptvY = y*PTV_Radius + PTV_Centre(2);
    ptvZ = z*PTV_Radius + PTV_Centre(3);
    
    [f, v, ~] = surf2patch(ptvX, ptvY, ptvZ);
    
    numVertices = size(v, 1);
    numPatches = size(f, 1);    
    
    %Get all PTV Doses for each vertex
    ptvDoses = zeros(numVertices, 1);
    for i = 1:numVertices
        pointDose = Compute_Point_Dose(Head_Centre, Head_Axes, Helmet, OAR_Centre, OAR_Radius, Isocentre, v(i, :)');
        
        ptvDoses(i) = pointDose;
    end
 
    %Compute average dose belonging to each patch & Surface Areas
    avgPatchDoses = zeros(numPatches, 1);
    patchSurfaceAreas = zeros(numPatches, 1);
    for i = 1:numPatches
        faces = f(i, :);
        %GET AVERAGE DOSE
        avg = mean(ptvDoses(faces));
        avgPatchDoses(i) = avg;
        
        vertices = v(faces, :);
        %GET SURFACE AREA OF PATCH
        patchSurfaceAreas(i) = Compute_Patch_Area(vertices(1, :), vertices(2, :), vertices(3, :), vertices(4, :));
    end
    
    %average doses
    patchDoses = avgPatchDoses.*patchSurfaceAreas;
    
    %hottest patch 
    [h_Patch_Value, h_Patch_Index] = max(patchDoses);
    
    %coldest patch 
    [c_Patch_Value, c_Patch_Index] = min(patchDoses);
    
    spacing = floor(linspace(c_Patch_Value, h_Patch_Value, 20));
    
    figure
    histogram(patchDoses, spacing, 'FaceColor', 'r')
    title('Dose Surface Histogram for PTV')
    xlabel('Dose Units')
    ylabel('Patch Amounts')
    grid on
end

