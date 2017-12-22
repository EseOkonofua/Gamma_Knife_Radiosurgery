function Test_Compute_Linear_Function()
%TEST_COMPUTE_LINEAR_FUNCTION Tests Compute_Linear_Function
    fprintf('Test Compute Linear Function\n');
    fprintf('We expect X = Y\n');
    fprintf('Row Format: [X Y] \n');
    
    %GT VARIABLES
    p1 = [1; 1];
    p2 = [5; 5];

    results = zeros(7, 2);
    
    index = 1;
    for x = 0:6
        y = Compute_Linear_Function(p1, p2, x);
        results(index, 1) = x;
        results(index, 2) = y;
        index = index + 1;
    end
    
    disp(results);
end

