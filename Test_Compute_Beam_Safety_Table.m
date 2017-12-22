function Test_Compute_Beam_Safety_Table()
%TEST_COMPUTE_BEAM_SAFETY_TABLE Tests Compute Beam Safety Table
    fprintf('Test Compute Beam Safety Table\n');
    fprintf('Beam Safety Table - Row Format: [Long Lat isSafe]\n\n')
    OAR_Centre = [0; 30; 45];
    OAR_Radius = 15;
    PTV_Centre = [30; 0; 15];
    Isocentre = PTV_Centre;
    Beam_Radius = 15;
    
    Beam_Safety_Table = Compute_Beam_Safety_Table(Beam_Radius, Isocentre, OAR_Centre, OAR_Radius);

    disp(Beam_Safety_Table);
end

