function Draw_3D_Scene(Head_Centre, Head_Axes, PTV_Centre, PTV_Radius, OAR_Centre, OAR_Radius, Dose_Box, Isocentre)
%DRAW_3D_SCENE Summary of this function goes here
%   Detailed explanation goes here
    
    figure
    title('3D Scene')
    xlabel('X - Axis')
    ylabel('Y - Axis')
    zlabel('Z - Axis')
    hold on
    
    %Draw Head
    [x, y, z] = sphere;
    head = surf(x*Head_Axes(1) + Head_Centre(1), y*Head_Axes(2) + Head_Centre(2), z*Head_Axes(3) + Head_Centre(3));
    set(head, 'FaceAlpha', 0.2)

    %Draw PTV
    ptv = surf(x*PTV_Radius + PTV_Centre(1), y*PTV_Radius + PTV_Centre(2), z*PTV_Radius + PTV_Centre(3));
    set(ptv, 'FaceAlpha', 0.5)
    
    %Draw OAR
    surf(x*OAR_Radius + OAR_Centre(1), y*OAR_Radius + OAR_Centre(2), z*OAR_Radius + OAR_Centre(3))

    %Draw Dose Box
    face1P1 = Dose_Box(:, 1);
    face2P1 = Dose_Box(:, 2);
    
    widthX = abs(face1P1(1) - face2P1(1));
    widthY = abs(face1P1(2) - face2P1(2));
    widthZ = abs(face1P1(3) - face2P1(3));
    
    face1P2 = face1P1 - [0; 0; widthZ];
    face1P3 = face1P2 - [0; widthY; 0];
    face1P4 = face1P1 - [0; widthY; 0];
    
    face2P2 = face2P1 + [0; 0; widthZ];
    face2P3 = face2P2 + [0; widthY; 0];
    face2P4 = face2P1 + [0; widthY; 0];
    
    %FACES OF DOSE BOX
    FACE1 = [face1P1, face1P2, face1P3, face1P4];
    FACE2 = [face2P1, face2P2, face2P3, face2P4];
    FACE3 = [face1P1, face1P4, face2P2, face2P3];
    FACE4 = [face1P2, face1P3, face2P1, face2P4];
    FACE5 = [face1P3, face1P4, face2P2, face2P1];
    FACE6 = [face1P1, face1P2, face2P4, face2P3];
    
    %PLOT FACES
    fill3(FACE1(1, :), FACE1(2, :), FACE1(3, :), 'y')
    fill3(FACE2(1, :), FACE2(2, :), FACE2(3, :), 'y')
    fill3(FACE3(1, :), FACE3(2, :), FACE3(3, :), 'y')
    fill3(FACE4(1, :), FACE4(2, :), FACE4(3, :), 'y')
    fill3(FACE5(1, :), FACE5(2, :), FACE5(3, :), 'y')
    fill3(FACE6(1, :), FACE6(2, :), FACE6(3, :), 'y')
    alpha(0.3)
    plot3(Isocentre(1), Isocentre(2), Isocentre(3),'r.','MarkerSize', 40);
    
    legend('Head', 'PTV', 'OAR', 'DoseBox')
    hold off
end

