
function[mx,rx]=aameanautocensemble(M,N)
%function[mx,rx]=aameanautocensemble(M,N);
%we create an MxN matrix;M=number of realizations;
%N=number of time slots;easily modified for other types 
%of pdf's;
x=randn(M,N);%randn=gives Gaussian distributed white noise
mx=sum(x,1)/M;%with zero mean;sum(x,1)=sums all the rows;
for i=1:N     %sum(x,2)=sums all the columns;
    rx(i)=sum(x(:,1).*x(:,i))/M;
end;