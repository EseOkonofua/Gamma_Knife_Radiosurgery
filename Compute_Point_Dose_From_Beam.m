function Point_Dose_Value = Compute_Point_Dose_From_Beam(Head_Centre, Head_Axes, Beam_Radius, Beam_Longitude, Beam_Latitude, Isocentre, POI)
%COMPUTE_POINT_DOSE_FROM_BEAM A function to compute the dose at a point of
%interest from a beam.    
    
    Skin_Entry_Point = Compute_Skin_Entry_Point(Head_Centre, Head_Axes, Beam_Longitude, Beam_Latitude, Isocentre);
    
    %Point of interest radial distance from beam 
    Beam_Direction_Vector = Compute_Beam_Direction_Vector(Beam_Longitude, Beam_Latitude);
    Radial_Distance = Compute_Radial_Distance(POI, Isocentre, Beam_Direction_Vector);
    
    %Generate radial dose look up table.
    Radial_Dose_LUT = Compute_Radial_Dose(Radial_Distance, Beam_Radius, 0);
    
    %Get Point on Beam closest to the POI
    [~, PointOnBeam] = Distance_of_Line_and_Point(Skin_Entry_Point, Isocentre, POI);
    
    %find how deep the closest point is
    depth = norm(PointOnBeam - Skin_Entry_Point);
    
    %Use depth to generate look up taple
    Depth_Dose_LUT = Compute_Depth_Dose(depth, 0, 0);
    
    %Calculate point dose value from radial dose and depth dose
    Point_Dose_Value = Radial_Dose_LUT(end) * Depth_Dose_LUT(end);
end

