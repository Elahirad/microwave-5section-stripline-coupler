clear all; clc;
syms theta; 

% Sections
N = input("Please enter the sections of the coupler: ");

% Coupling param
Coupling_db = input("Please enter the coupling of the coupler (dB): ");
Coupling = 10^(-Coupling_db/20);

Z_0 = 50;

C = cell(1, (N+1)/2);

for i=1:(N+1)/2-1
    C{i} = 2*sin(theta)*cos((N-1-2*(i-1))*theta);
end

C{(N+1)/2} = sin(theta);

c = 0;
coeffs = cell(1, (N+1)/2);

while c ~= (N+1)/2
    c_values = zeros(1, (N+1)/2);
    for i=1:length(C)
        c_values(i) = subs(C{i}, theta, pi/2);
    end
    if (~all(c_values == 0))
        c = c + 1;
        coeffs{c} = c_values;
    end
    for i=1:length(C)
        C{i} = diff(C{i}, theta, 1);
    end
    
end

A = zeros((N+1)/2, (N+1)/2);

for i=1:length(coeffs)
    A(i, :) = coeffs{i};
end

B = zeros((N+1)/2, 1); B(1) = Coupling;

X = linsolve(A, B);

fprintf("Coupling parameters:\n");
for i=1:length(X)
    fprintf("C_%d=%f\n", i, X(i))
end

fprintf("Even and Odd Impedances:\n")
for i=1:length(X)
    fprintf("Z_%d(even)=%f\n", i, Z_0*sqrt((1 + X(i))/(1 - X(i))));
    fprintf("Z_%d(odd)=%f\n", i, Z_0*sqrt((1 - X(i))/(1 + X(i))));
end