function Compute_Dose_Volume_Histogram(Head_Centre, Head_Axes, Helmet, PTV_Centre, PTV_Radius, OAR_Centre, OAR_Radius, Isocentre)
%COMPUTE_DOSE_VOLUME_HISTOGRAM a function to compute the dose inside the 
% dose_box with a given dose voxel size and save the dose values in a 3D dose matrix.
    voxelSize = 10; %1mm
    
    %GET THE DOSE BOX SURROUNDING THE PTV AND OAR
    Dose_Box = Compute_Dose_Box(PTV_Centre, PTV_Radius, OAR_Centre, OAR_Radius);
    
    corner1 = Dose_Box(:, 1);
    corner2 = Dose_Box(:, 2);
    
    diff = corner1 - corner2;
    
    PTV_Doses = [];
    OAR_Doses = [];
    
    %Voxel step through
    for x = 0:voxelSize:diff(1)
        for y = 0:voxelSize:diff(2)
            for z = 0:voxelSize:diff(3)
                location = corner2 + [x; y; z];
                
                %Check to see if location in OAR
                insideOAR = is_Point_In_Sphere(OAR_Centre, OAR_Radius, location);
                
                %Check to see if location in PTV
                insidePTV = is_Point_In_Sphere(PTV_Centre, PTV_Radius, location);
                
                if insideOAR || insidePTV
                    location_Dose = Compute_Point_Dose(Head_Centre, Head_Axes, Helmet, OAR_Centre, OAR_Radius, Isocentre, location);
                    
                    if insidePTV
                        PTV_Doses = [PTV_Doses; location_Dose];
                    end
                    
                    if insideOAR
                        OAR_Doses = [OAR_Doses; location_Dose];
                    end
                end
            end
        end
    end
    
    %NUMBER OF BINS
    Beam_Separation_Angle = Helmet(1);
    
    latVals = (90/Beam_Separation_Angle) + 1;
    longVals = (360/Beam_Separation_Angle) + 1;
    
    range = latVals * longVals;
    numBins = longVals;
    
    spacing = floor(linspace(0, range, numBins));
    
    %PLOT PTV HISTOGRAM
    figure
    title('Dose Volume Histograms for PTV & OAR')
    subplot(1, 2, 1)
    histogram(PTV_Doses, spacing)
    title('PTV DOSES')
    xlabel('Dose Units')
    ylabel('Amounts')
    grid on
    
    %PLOT OAR HISTOGRAM
    subplot(1, 2, 2)    
    histogram(OAR_Doses, spacing, 'FaceColor', 'r')
    title('OAR DOSES')
    xlabel('Dose Units')
    ylabel('Amounts')
    grid on
end


%Helper Function to determine if a point is in PTV or OAR
function isInside =  is_Point_In_Sphere(Centre, Radius, Point)
    vector = Centre - Point;
    
    lenVector = norm(vector);
    
    isInside = lenVector < Radius;
end