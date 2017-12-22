function isSafe = Compute_Beam_Safety(Beam_Radius, Beam_Longitude, Beam_Latitude, Isocentre, OAR_Centre, OAR_Radius)
%COMPUTE_BEAM_SAFETY A function to compute if a pencil beam is safe. The 
% beam is unsafe when the beam intersects with the OAR.
    
    %In order to compute the beam safety of pencil beam we first need to
    %get the beam centre line of the beam using the isocentre and the
    %latitude & longitude
    directionVector = Compute_Beam_Direction_Vector(Beam_Longitude, Beam_Latitude);
    
    %After we find the centre line of the pencil beam, we must find the
    %distance of the centre of the OAR to this line.
    distance = Compute_Radial_Distance(OAR_Centre, Isocentre, directionVector);
    
    %A pencil beam will be considered safe if the radial distance of the centre of
    %the OAR is greater than the Beam Radius + OAR_Radius.
    isSafe = distance > (Beam_Radius + OAR_Radius);    
end

