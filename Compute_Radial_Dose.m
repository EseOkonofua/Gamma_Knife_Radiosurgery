function Radial_Dose_LUT = Compute_Radial_Dose(Max_Radial_Distance, Beam_Radius, Resolution)
%COMPUTE_RADIAL_DOSE A function to compute radial dose value according to
% the Radial Dose Function graph. Write the results into a global look up table 
% (LUT) with appropriate resolution.

    %Initial Radial Dose array
    Radial_Dose_LUT = [];
    
    %NO STEP
    if Resolution <= 0
        x = Max_Radial_Distance;
        
        Radial_Dose_LUT = Radial_Dose_Function(Beam_Radius, x);
    
    %WITH RESOLUTION STEPS
    else
        for i = 0:Resolution:Max_Radial_Distance
            Radial_Dose_LUT = [Radial_Dose_LUT; Radial_Dose_Function(Beam_Radius, i)];
        end  
    end         
end

%RADIAL DOSE FUNCTION
function dose = Radial_Dose_Function(Beam_Radius, x)
    if x > Beam_Radius
        x = x - Beam_Radius;
    else
        x = 0;
    end

    if x >= 0 && x <= 7.5
        dose = 1;
    elseif x > 7.5 && x < 22.5
        dose = Compute_Linear_Function([7.5; 1], [22.5; 0], x);
    else
        dose =  0;
    end
end
