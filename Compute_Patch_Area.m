function area = Compute_Patch_Area(p1, p2, p3, p4)
%COMPUTE_PATCH_AREA Finds the surface area of a given patch of 4 points
    a = p2 - p1;
    b = p3 - p1;
    c = p4 - p1;
    
    area = 1/2*(norm(cross(a, c)) + norm(cross(b, c)));    
end

