%script file: ASP_hands_on_lab

%
% Hands on ASP Lab
% May 14 2012
% 
% Alex Moriarty
%
% Task:
% Reproduce Fig 2.2.1 & 2.2.2 from 
% Adaptive Filtering Primer with Matlab
% Alexander D. Poularikas & Zayed M. Ramadan
%
% 

% this will be figure 2.2.1
fig1 = figure('Name', 'Figure 2.2.1', 'NumberTitle', 'off'); 
w = -pi:.1:pi;
A_w = 1./sqrt((1-0.9*cos(w)).^2+(0.9*sin(w)).^2);
Phi_w = -atan(0.9*sin(w)./(1-0.9*cos(w)));
subplot(211); % for plot a of figure 2.2.1
plot(w,A_w);
subplot(212); % for plot b of figure 2.2.1
plot(w,Phi_w);

% this will be figure 2.2.2
fig2 = figure('Name', 'Figure 2.2.2', 'NumberTitle','off'); 
t = 0:1:4;
x = exp(-t);
dftx1 = fft(x,32);
w = 0:2*pi/32:2*pi-(2*pi/32);
subplot(211); % for plot a from figure 2.2.2
stem(w,abs(dftx1));
FT1=1./sqrt(1+w.^2); 
hold on; 
stem(w, abs(FT1),'filled');
xlabel('\omega'); ylabel('Magnitudes of FT and DFT');
title('(a)'); axis([0 2*pi 0 2]); legend('DFT','FT','Location','Best');

subplot(212); % for plot b from figure 2.2.2
nt = 0:0.5:4;
x = exp(-nt);
dftx2 = 0.5*fft(x,32);
w = 0:4*pi/32:4*pi-(4*pi/32);
stem(w,abs(dftx2));
FT2 = 1./sqrt(1+w.^2);
hold on;
stem(w, abs(FT2),'filled');
xlabel('\omega'); ylabel('Magnitudes of FT and DFT');
title('(a)'); axis([0 4*pi 0 1.5]); legend('DFT','FT','Location','Best');

%this will be figure 3.1.1
fig3 = figure('Name', 'Figure 3.1.1', 'NumberTitle', 'off');
clear('x');
for n = 1:4;
    x(n,:) = rand(1,50)-0.5;
end;
m = 0:49;
for i = 1:4;
    subplot(4,1,i);
    
    stem(m,x(i,:),'k');
    ylabel('x(n)');
    if i == 1;
        title('Four realizations');
    elseif i == 4;
        xlabel('n');
    end;
    set(gca,'XTick',0:5:50);

end;

% this will be figure 3.2.1
fig4 = figure('Name', 'Figure 3.2.1', 'NumberTitle', 'off');
clear('x');
[mx, rx] = aameanautocensemble(10,50);
subplot(221); % mean of 10 realizations
stem(m, mx);
xlabel('mean of 10 realizations');
subplot(223); % autoc of 10 realizations
stem(m, rx);
xlabel('Autoc. for 10 realizations');

[mx, rx] = aameanautocensemble(400,50);
subplot(222); % mean of 400 realizations
stem(m, mx);
xlabel('mean of 400 realizations');
subplot(224); % autoc of 400 realizations
stem(m, mx);
xlabel('Autoc for 400 realizations');
axis([0 60 -0.5 1.5]);


% this will be figure 3.3.1
fig5 = figure('Name', 'Figure 3.3.1', 'NumberTitle', 'off');
clear('x', 'm');
x = randn(1,40);
n = 0:39;
ru=aasampleunbiasedautoc(x,20);
rb=aasamplebiasedautoc(x,20);
subplot(311); % x(n)
stem(n,x);
xlabel('n');
ylabel('x(n)');
subplot(312);
m = 0:19;
stem(m,ru);
xlabel('m');
ylabel('r(unbiased)');
subplot(313);
stem(m,rb);
xlabel('m');
ylabel('r(biased)');


%Display figures in inverse order: showing fig1 first)
figure(fig5);
figure(fig4);
figure(fig3);
figure(fig2);
figure(fig1);