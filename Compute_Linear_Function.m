function y = Compute_Linear_Function(p1 ,p2, x)
%COMPUTE_LINEAR_FUNCTION A function to compute the value of y=mx +b linear function, 
% given by P1=(x1, y1) and P2=(x2,y2) points of the line, for a value of x.
    %direction vector
    delta = p2 - p1;
    
    %slope
    m = delta(2)/delta(1);
    
    %phase shift
    b = p1(2) - (m*p1(1));
    
    %Linear equation
    y = (m*x) + b;
end

