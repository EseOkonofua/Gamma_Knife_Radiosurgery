function Point_Dose_Value = Compute_Point_Dose(Head_Centre, Head_Axes, Helmet, OAR_Centre, OAR_Radius, Isocentre, POI)
%COMPUTE_POINT_DOSE A function to compute the dose in a given point of 
% interest from all beams. 
    Beam_Radius = Helmet(2);
    Beam_Separation_Angle = Helmet(1);
    
    %Initialize Point Dose Value
    Point_Dose_Value = 0;
    
    %Increment point dose value for each beam.
    for longitude = 0:Beam_Separation_Angle:360
        for latitude = 0:Beam_Separation_Angle:90
            
            %DO NOT ADD A BEAM IF IT IS UNSAFE
            isSafe = Compute_Beam_Safety(Beam_Radius, longitude, latitude, Isocentre, OAR_Centre, OAR_Radius);
            
            if isSafe
                Point_Dose_Value = Point_Dose_Value + ...
                    Compute_Point_Dose_From_Beam(Head_Centre, Head_Axes, ...
                    Beam_Radius, longitude, latitude, Isocentre, POI);
            end
        end
    end
end

