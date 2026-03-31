function [x] = NewtonSolve(fofx, dfdx, xguess, error)
    
    x_root = xguess;
    delta_x = Inf;

    while abs(delta_x) > error
        delta_x = -1 * evaluate_func(x_root, fofx) / evaluate_func(x_root, dfdx);
        x_root = x_root + delta_x;
    end
    
    x = x_root;
end


function [y] = evaluate_func(x, func)
    y = eval(func);
end


