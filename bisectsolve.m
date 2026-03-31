function [x] = bisectsolve(fofx, xmin, xmax, error)
    % Initialize parameters
    a = xmin;
    b = xmax;
    c = (xmin + xmax) / 2;
    
    % Outputs of function at given b,c values get stored here
    c_out = evaluate_func(c, fofx);
    b_out = evaluate_func(b, fofx);
    a_out = evaluate_func(a, fofx);

    assert(a_out * b_out < 0);
    
    % Exit condition: requires c's output being far enough from b's output, 
    % and for it to also be within tolerance to 0
    while abs(c_out - b_out) > error || abs(c_out) > error
        if c_out * b_out > 0
            % If c_out is same sign as b_out, shift b to c
            b = c;
            b_out = c_out;
        else
            % c_out opposite sign of b_out -> same sign as a_out -> shift 
            % a to c
            a = c;
        end
        % Get new midpoint and its output after having shifted either A/B
        c = (a + b)/2;
        c_out = evaluate_func(c, fofx);
    end

    % Store output
    x = c;
end

% Helper function to evaluate a function with a given X variable
function [y] = evaluate_func(x, func)
    y = eval(func);
end