function Test_Compute_Skin_Entry_Point_Table()
%TEST_COMPUTE_SKIN_ENTRY_POINT_TABLE Tests Compute Skin Entry Point Table
    fprintf('Test Compute Skin Entry Point Table\n');
    fprintf('Displaying Skin Entry Points 3D Scene\n\n');
    Head_Centre = [0; 0; 0];
    Head_Axes = [80; 100; 80];
    
    PTV_Centre = [30; 0; 15];
    Isocentre = PTV_Centre;

    Skin_Entry_Point_Table = Compute_Skin_Entry_Point_Table(Head_Centre, Head_Axes, Isocentre);

    figure
    title('Pencil Beam Skin Entry Points')
    xlabel('X - Axis')
    ylabel('Y - Axis')
    zlabel('Z - Axis')

    hold on
    %Draw Head
    [x, y, z] = sphere;
    head = surf(x*Head_Axes(1) + Head_Centre(1), y*Head_Axes(2) + Head_Centre(2), z*Head_Axes(3) + Head_Centre(3));
    set(head, 'FaceAlpha', 0.3)

    %Plot intersect points
    plot3(Skin_Entry_Point_Table(:, 3), Skin_Entry_Point_Table(:, 4), Skin_Entry_Point_Table(:, 5), '.', 'MarkerSize', 22)

    %Plot isocentrepoint
    plot3(Isocentre(1), Isocentre(2), Isocentre(3), 'd', 'MarkerSize', 18, 'MarkerFaceColor', 'r')

    %Plot Lines
    for i = 1:size(Skin_Entry_Point_Table, 1)
        intersect = Skin_Entry_Point_Table(i, 3:5)';

        dVector = intersect - Isocentre;
        dVector = dVector/norm(dVector);

        %Extrapolate line
        newPoint = intersect + 20*dVector;

        linePlot = [Isocentre newPoint];
        plot3(linePlot(1, :),linePlot(2, :),linePlot(3, :), 'r')
    end
    
    legend('Head', 'Intersection Points', 'Isocentre', 'Beam Lines')
    hold off
end

