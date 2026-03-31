function [x] = bisectsolve(fofx, xmin, xmax, error)
    a = xmin
    b = xmax
    
    c = (xmin + xmax) / 2
    
    c_out = evaluate_func(c, fofx);
    b_out = evaluate_func(b, fofx);
    a_out = evaluate_func(a, fofx);
    while abs(c_out - b_out) > error || abs(c_out) > error
        if c_out * b_out > 0
            b = c;
            b_out = c_out;
        else
            a = c;
            a_out = c_out;
        end
        c = (a + b)/2;
        c_out = evaluate_func(c, fofx);
        
    end

    x = c;
end


function [y] = evaluate_func(x, func)
    y = eval(func);
end