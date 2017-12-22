function Test_Compute_Dose_Box()
%TEST_COMPUTE_DOSE_BOX Test function
    PTV_Centre = [30; 0; 15];
    PTV_Radius = 15;
    OAR_Centre = [0; 30; 45];
    OAR_Radius = 15;

    %CALCULATED GROUND TRUTH
    GT = [45 -15;45 -15; 60 0];
    
    Dose_Box = Compute_Dose_Box(PTV_Centre, PTV_Radius, OAR_Centre, OAR_Radius);
    fprintf('Test Dose Box\n');
    fprintf('Expected Dose Box: %s\n', mat2str(GT));
    disp(Dose_Box);
end

