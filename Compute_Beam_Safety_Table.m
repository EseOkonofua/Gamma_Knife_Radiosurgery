function Beam_Safety_Table = Compute_Beam_Safety_Table(Beam_Radius, Isocentre, OAR_Centre, OAR_Radius)
%COMPUTE_BEAM_SAFETY_TABLE Write a function to compute beam safety for each
% beam and write the result into a global table.
    longStep = 10;
    latStep = 10;
    
    sizeLong = (360/longStep) + 1;
    sizeLat = (90/latStep) + 1;

    % Entry table will have each row [Long, Lat, isSafe]
    Beam_Safety_Table = zeros(sizeLong*sizeLat, 3);

    index = 1;
    %Simulate top half of sphere
    for longitude = 0:longStep:360
        for latitude = 0:latStep:90        
            isSafe = Compute_Beam_Safety(Beam_Radius, longitude, latitude, Isocentre, OAR_Centre, OAR_Radius);
            
            Beam_Safety_Table(index, 1) = longitude;
            Beam_Safety_Table(index, 2) = latitude;
            Beam_Safety_Table(index, 3) = isSafe;
            
            index = index + 1;
        end
    end
end

