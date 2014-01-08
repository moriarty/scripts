function [X] = chi_squared(x,k)
n = k/2;
X = 1/(2^(n)*gamma(n))*x.^(n-1).*exp(-x/2);
