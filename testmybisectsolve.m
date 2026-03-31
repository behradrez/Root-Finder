% Parameters for the example functions to test
fprintf("Testing example functions...");
funcs = ["x-cos(x)", "x-cos(x)", "x^3-3*x^2+3*x-1", "x^3 - 3*x^2+3*x-1"];
xmins = [0, 0.5, 0, 0.75];
xmaxes = [1, 0.9, 1.5, 1.6];

tol = 1e-8;
for i=1:length(funcs)
    x = bisectsolve(funcs(i), xmins(i), xmaxes(i), 1e-8);
    % Function output at 'x' should be 0 +/- tol
    assert(abs(eval(funcs(i))) <= tol, "Root value at " + string(x) + " not less than error");
end

% Same sign xmin & xmax should error
try
    bisectsolve('x+10', 100, 200, 1e-8);
    assert(false, "Error was not thrown");
catch
    fprintf("Assertion Passed\n");
end
fprintf("All Tests passed!\n");
