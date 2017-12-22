function Dose_Box = Compute_Dose_Box(PTV_Centre, PTV_Radius, OAR_Centre, OAR_Radius)
%COMPUTE_DOSE_BOX Computes the Dose Box around the PTV and OAR.
%   The PTV represents the Prescribe Target Volume; A spherical reconstruction of the contour around the
%   tumor image. 
%   The OAR represents the Organ At Risk; A spherical reconstruction of the contour around the tumor image.

% The Dose_Box is a rectangular prism tightly wrapped around the PTV and
% OAR without Margin.
    maxX = max([PTV_Centre(1) + PTV_Radius, OAR_Centre(1) + OAR_Radius]);
    minX = min([PTV_Centre(1) - PTV_Radius, OAR_Centre(1) - OAR_Radius]);
    
    maxY = max([PTV_Centre(2) + PTV_Radius, OAR_Centre(2) + OAR_Radius]);
    minY = min([PTV_Centre(2) - PTV_Radius, OAR_Centre(2) - OAR_Radius]);
    
    maxZ = max([PTV_Centre(3) + PTV_Radius, OAR_Centre(3) + OAR_Radius]);
    minZ = min([PTV_Centre(3) - PTV_Radius, OAR_Centre(3) - OAR_Radius]);
    
    Dose_Box = zeros(3, 2);
    Dose_Box(:, 1) = [maxX; maxY; maxZ];
    Dose_Box(:, 2) = [minX; minY; minZ];
end

