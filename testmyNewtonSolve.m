% Parameters of example functions (from assignment, lecture, and self)
fprintf("Testing example functions\n");
funcs = ["x-cos(x)", "x^6-x-1", "x+10", "(2 / 3) * x + exp(40*x) - 5 / 3"];
derivatives = ["1+sin(x)", "6*x^5-1", '1', "2/3 + 40 * exp(40*x)"];
results = zeros(length(funcs));
tol = 1e-8;

for i=1:length(funcs)
    x = NewtonSolve(funcs(i), derivatives(i), 0, 1e-8);
    results(i) = x;

    % Function output at 'x' should be 0 +/- tol
    assert(abs(eval(funcs(i))) <= tol, "Root value at " + string(x) + " not less than error");
end

% Test case from lecture
assert(results(end) - 0.012644 < tol);

fprintf("Tests passed!\n");