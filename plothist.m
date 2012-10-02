N = 100000;
X = randi(785,N,1);
Y = randi(20,N,1);
R = zeros(N,1);

for i=1:N
    if Y(i)*0.01 < 1/5*abs(sin(X(i)*0.01))
        R(i) = X(i)*0.01;
    end;
end;

R = R(R~=0);
hist(R,100)