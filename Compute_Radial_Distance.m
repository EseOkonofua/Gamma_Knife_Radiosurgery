function Distance = Compute_Radial_Distance(Point, Line_Point, Line_Direction)
%COMPUTE_RADIAL_DISTANCE A function to compute the radial distance between the center line 
% of a beam and an arbitrary point in space.
 
    %Get a second line from the direction and initial point.
    Line_Point2 = Line_Point + Line_Direction;
    
    %Compute distance
    [Distance, ~] = Distance_of_Line_and_Point(Line_Point, Line_Point2, Point);
end

