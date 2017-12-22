function Skin_Entry_Table = Compute_Skin_Entry_Point_Table(Head_Centre, Head_Axes, Isocentre)
%COMPUTE_SKIN_ENTRY_POINT_TABLE a function to compute the skin entry point 
% for each beam and write the result into a global table.

    longStep = 10;
    latStep = 10;
    
    sizeLong = (360/longStep) + 1;
    sizeLat = (90/latStep) + 1;

    % Entry table will have each row [Long, Lat, X, Y, Z]
    Skin_Entry_Table = zeros(sizeLong*sizeLat, 5);
    
    index = 1;
    %Simulate top half of sphere
    for longitude = 0:longStep:360
        for latitude = 0:latStep:90        
            entry = Compute_Skin_Entry_Point(Head_Centre, Head_Axes, longitude, latitude, Isocentre);
            
            Skin_Entry_Table(index, 1) = longitude;
            Skin_Entry_Table(index, 2) = latitude;
            Skin_Entry_Table(index, 3:5) = entry';
            
            index = index + 1;
        end
    end
end

