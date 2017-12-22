function Test_Compute_Point_Dose_From_Beam()
%TEST_COMPUTE_POINT_DOSE_FROM_BEAM Tests Compute Point Dose From Beam
    Beam_Radius = 15;

    Head_Centre = [0; 0; 0];
    Head_Axes = [80; 100; 80];

    fprintf('Test Compute Point Dose From Beam\n');
    fprintf('Point Dose Table - Row Format: [Long Lat Dose]\n');

    %Table of format [Long, Lat, Dose]
    Point_Dose_Table = zeros(4, 3);
    index = 1;
    for longitude = 0:90:90
        for latitude = 0:90:90
            Point_Dose = Compute_Point_Dose_From_Beam(Head_Centre, Head_Axes, Beam_Radius, longitude, latitude, Head_Centre, Head_Centre);

            Point_Dose_Table(index, 1) = longitude;
            Point_Dose_Table(index, 2) = latitude;
            Point_Dose_Table(index, 3) = Point_Dose;

            index = index + 1;
        end
    end

    disp(Point_Dose_Table);
end

