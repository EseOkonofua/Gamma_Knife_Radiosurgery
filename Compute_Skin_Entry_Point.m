function Skin_Entry_Point = Compute_Skin_Entry_Point(Head_Centre, Head_Axes, Beam_Longitude, Beam_Latitude, Isocentre)
%COMPUTE_SKIN_ENTRY_POINT A function to compute the skin entry point
%of a pencil beam.

    %Get the direction of the beam
    beamVector = Compute_Beam_Direction_Vector(Beam_Longitude, Beam_Latitude);
    
    %Get another point to represent line to isocentre
    Line_Point2 = Isocentre + beamVector;
    
    %Find intersection of line and ellipsoid
    [numIntersections, point1, point2] = Intersect_Line_and_Ellipsoid(Isocentre, Line_Point2, Head_Centre, Head_Axes(1), Head_Axes(2), Head_Axes(3));
    
    %PICK SKIN ENTRY AT TOP OF HEAD
    if numIntersections == 1
        Skin_Entry_Point = point1;
    elseif numIntersections == 2
        if point1(3) > point2(3)
            Skin_Entry_Point = point1;
        else
            Skin_Entry_Point = point2;
        end
    end
        
end

