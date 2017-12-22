function Test_Compute_Radial_Dose()
%TEST_COMPUTE_RADIAL_DOSE Tests Compute Radial Dose
    fprintf('Test Compute Radial Dose\n');
    fprintf('Displaying Radial Dose Function\n\n');

    maxRadialDistance = 25;
    beamRadius = 0;
    resolution = 0.5;

    LUT = Compute_Radial_Dose(maxRadialDistance, beamRadius, resolution);

    space = 0:resolution:maxRadialDistance;
    
    p1 = Compute_Radial_Dose(7.5, beamRadius, 0);
    
    p2 = Compute_Radial_Dose(22.5, beamRadius, 0);
    
    fprintf('Expects X = 7.5 to return 1\n');
    fprintf('Compute_Radial_Dose(7.5): %.2f\n\n', p1);
    
    fprintf('Expects X = 22.5 to return 0\n');
    fprintf('Compute_Radial_Dose(22.5): %.2f\n\n', p2);
    
    figure
    plot(space, LUT, 'LineWidth', 3)
    title('Radial Dose Function')
    xlabel('Radial Distance (mm)')
    ylabel('Dose')
    grid on    
end

