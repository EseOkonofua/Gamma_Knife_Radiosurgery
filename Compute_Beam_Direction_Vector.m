function Beam_Direction_Vector = Compute_Beam_Direction_Vector(Beam_Longitude, Beam_Latitude)
%COMPUTER_BEAM_DIRECTION_VECTOR A function to compute the unit direction 
% vector for the pencil beam?s centerline from beam longitude and beam 
% latitude, in Cartesian coordinates.

    %Using Spherical coordinates formula
    Beam_Direction_Vector = [cosd(Beam_Longitude)*sin(Beam_Latitude);...
        sind(Beam_Longitude)*sin(Beam_Latitude);...
        cosd(Beam_Latitude)];
    
    %Normalize
    Beam_Direction_Vector = Beam_Direction_Vector/norm(Beam_Direction_Vector); 
end

