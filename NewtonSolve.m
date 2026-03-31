function [x] = NewtonSolve(fofx, dfdx, xguess, error)
    % Parameter initialization
    x_root = xguess;
    delta_x = Inf; % Unused value, only for entering the loop
    
    % Exit condition: iterative change in X is less than error tolerance,
    % indicates acceptable convergece
    while abs(delta_x) > error
        % Linearly approximate change in X
        delta_x = -1 * evaluate_func(x_root, fofx) / evaluate_func(x_root, dfdx);
        x_root = x_root + delta_x;
    end
    
    % Store output
    x = x_root;
end

% Helper function to evaluate a function with a given X variable
function [y] = evaluate_func(x, func)
    y = eval(func);
end


