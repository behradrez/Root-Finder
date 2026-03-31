fofx = "(2 / 3) * x + exp(40*x) - 5 / 3";
dfdx = "2/3 + 40 * exp(40*x)";
x_ini = 0.1;
err = 1e-6;

x_root = NewtonSolve(fofx, dfdx, x_ini, err);


fprintf("Testing example functions\n");
funcs = ["x-cos(x)", "x^6-x-1", "x+10"];
derivatives = ["1+sin(x)", "6*x^5-1", '1'];
tol = 1e-8;
for i=1:length(funcs)
    x = NewtonSolve(funcs(i), derivatives(i), 0, 1e-8);
    assert(abs(eval(funcs(i))) <= tol, "Root value at " + string(x) + " not less than error");
end


fprintf("Tests passed!\n");