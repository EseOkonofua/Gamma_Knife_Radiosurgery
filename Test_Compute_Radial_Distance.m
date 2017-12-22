function Test_Compute_Radial_Distance()
%TEST_COMPUTE_RADIAL_DISTANCE Tests Compute Radial Distance
    fprintf('Test Compute Radial Distance\n');
    %GT 1 
    Point = [0; 1; 0];
    Line_Point = [0; 0; 3];
    Line_Direction = [0; 0; -1]; %Expected distance = 1

    fprintf('Ground Truth 1\n');
    fprintf('Line_Point: %s, Line_Direction: %s, Point: %s\n', mat2str(Line_Point'),...
        mat2str(Line_Direction'), mat2str(Point'));
    fprintf('We expect Distance_1 = 1\n');
   
    Distance_1 = Compute_Radial_Distance(Point, Line_Point, Line_Direction);
    fprintf('Distance_1: %.2f\n\n', Distance_1);

    %GT 2
    Line_Point = [3; 0; 0];
    Line_Direction = [-1; 0; 0]; %Expected distance = 1
    
    fprintf('Ground Truth 2\n');
    fprintf('Line_Point: %s, Line_Direction: %s, Point: %s\n', mat2str(Line_Point'),...
        mat2str(Line_Direction'), mat2str(Point'));
    fprintf('We expect Distance_2 = 1\n');
   
    Distance_2 = Compute_Radial_Distance(Point, Line_Point, Line_Direction);
    
    fprintf('Distance_2: %.2f\n\n', Distance_2);
end

