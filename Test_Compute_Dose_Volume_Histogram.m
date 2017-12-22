function Test_Compute_Dose_Volume_Histogram()
%TEST_COMPUTE_DOSE_VOLUME_HISTOGRAM Tests Compute Dose Volume Histogram
    fprintf('Test Compute Dose Volume Histogram\n');
    fprintf('Displaying Dose Volume Histograms for PTV & OAR\n');
    
    PTV_Centre = [30; 0; 15];
    PTV_Radius = 15;
    OAR_Centre = [0; 30; 45];
    OAR_Radius = 15;
    Beam_Radius = 15;
    Beam_Separation_Angle = 10;

    Head_Centre = [0; 0; 0];
    Head_Axes = [80; 100; 80];

    Helmet = [Beam_Separation_Angle; Beam_Radius];

    Isocentre = PTV_Centre;

    tic
    Compute_Dose_Volume_Histogram(Head_Centre, Head_Axes, Helmet, PTV_Centre, PTV_Radius, OAR_Centre, OAR_Radius, Isocentre);
    toc
    fprintf('\n');
end

