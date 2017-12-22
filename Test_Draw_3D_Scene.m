function Test_Draw_3D_Scene()
%TEST_DRAW_3D_SCENE Tests Draw 3d Scene
    PTV_Centre = [30; 0; 15];
    PTV_Radius = 15;
    OAR_Centre = [0; 30; 45];
    OAR_Radius = 15;
    Isocentre = PTV_Centre;

    Head_Centre = [0; 0; 0];
    Head_Axes = [80; 100; 80];
    
    Dose_Box = Compute_Dose_Box(PTV_Centre, PTV_Radius, OAR_Centre, OAR_Radius);

    fprintf('Test Draw 3D Scene\n');
    fprintf('Displaying 3D Scene\n\n');
    Draw_3D_Scene(Head_Centre, Head_Axes, PTV_Centre, PTV_Radius, OAR_Centre, OAR_Radius, Dose_Box, Isocentre);
end

