function Test_Compute_Beam_Direction_Vector()
%TEST_COMPUTE_BEAM_DIRECTION_VECTOR Tests Compute Beam Direction Vector
    fprintf('Test Compute Beam Direction Vector\n')
    fprintf("BEAM DIRECTION TABLE - Row Format: [Long Lat X Y Z]\n");
    longStep = 90;
    latStep = 90;

    longSize = (270/90) + 1;
    latSize = (90/90) + 1;

    %Format is [Long, Lat, X, Y, Z]
    Beam_Direction_Table = zeros(longSize*latSize, 5);
    
    index = 1;
    for longitude = 0:longStep:270
        for latitude = 0:latStep:90
            vector = Compute_Beam_Direction_Vector(longitude, latitude);

            Beam_Direction_Table(index, 1) = longitude;
            Beam_Direction_Table(index, 2) = latitude;
            Beam_Direction_Table(index, 3:5) = vector';

            index = index + 1;
        end
    end
    
    disp(Beam_Direction_Table);
end

