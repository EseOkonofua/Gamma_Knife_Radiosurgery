function Test_Compute_Depth_Dose()
%TEST_COMPUTE_DEPTH_DOSE Tests Compute Depth Dose.
    fprintf('Test Compute Depth Dose\n');
    fprintf('Displaying Depth Dose Function\n');
    
    maxDepth = 200;
    initialDepth = 0;
    resolution = 1;
    
    LUT = Compute_Depth_Dose(maxDepth, initialDepth, resolution);
    
    space = initialDepth:resolution:maxDepth;
    
    p1 = Compute_Depth_Dose(0, 0, 0);
    
    p2 = Compute_Depth_Dose(20, 0, 0);
    
    p3 = Compute_Depth_Dose(120, 0, 0);
    
    fprintf('Expects X = 0 to return 0\n');
    fprintf('Compute_Depth_Dose(0): %.2f\n\n', p1);
    
    fprintf('Expects X = 20 to return 1\n');
    fprintf('Compute_Depth_Dose(20): %.2f\n\n', p2);
    
    fprintf('Expects X = 120 to return 0.5\n');
    fprintf('Compute_Depth_Dose(120): %.2f\n\n', p3);
    
    figure
    plot(space, LUT, 'LineWidth', 3)
    title('Depth Dose Function')
    xlabel('Depth (mm)')
    ylabel('Dose')
    grid on    
end

