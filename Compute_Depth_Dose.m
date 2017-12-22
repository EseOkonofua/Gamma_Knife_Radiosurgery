function Depth_Dose_LUT = Compute_Depth_Dose(Max_Depth, Initial_Depth, Resolution)
%COMPUTE_DEPTH_DOSE Write a function to compute depth dose value according
% to the Depth Dose Function graph. Write the results into a global 
% look up table (LUT) with appropriate resolution.
   
    %Initial Look up table
    Depth_Dose_LUT = [];
    
    %NO Step
    if Resolution == 0
        Depth_Dose_LUT = Depth_Dose_Function(Max_Depth);    
    %With Steps
    else
        for x = Initial_Depth:Resolution:Max_Depth
            Depth_Dose_LUT = [Depth_Dose_LUT; Depth_Dose_Function(x)];
        end      
    end
end

%Depth dose function
function dose = Depth_Dose_Function(x)
    if x <= 20
        dose = Compute_Linear_Function([0; 0], [20; 1], x);
    else
        dose = Compute_Linear_Function([20; 1], [120; 0.5], x);
    end
end
