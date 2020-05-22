% piston cylinder code for ENME401 LCV assignment
% leo lloyd 21/05/20

clear all, close all, clc

syms pistHeight(L,a,theta)
pistHeight(L,a,theta) = a*cos(theta) + sqrt(L^2-a^2*sin(theta)^2); % height of piston, i.e. the furthest point from origin

% time vs height graph

syms t0 t
rpmConv = 2*pi/60;
angVel = 35*rpmConv; %constant velocity of 30 rpm
angPos(t) = int(angVel,t0,0,t);

L = 150;
a = 63.5;

H(t) = pistHeight(L,a,angPos);
% 
% fplot(H(t),[0 10])
% xlabel('Time (sec)')
% ylabel('Height (mm)')

count = 1;

for i = 0:0.01:2
    x(count) = i;
    y(count) = H(i);
    count = count + 1;
end

plot(x, y)
    

sympref('FloatingPointOutput',true);
inhaleStart = H(4.806)
inhaleEnd = max(y)

inhaleEnd-inhaleStart


% animation:

% figure;
% plot([-43 -43],[50 210],'k','LineWidth',3)
% hold on;
% plot([43 43],[50 210],'k','LineWidth',3)
% plot([-43 43],[210 210],'k','LineWidth',3)
% axis equal;
% 
% fanimator(@rectangle,'Position',[-43 H(t) 86 10],'FaceColor',[0.8 0.8 0.8])
% 
% fanimator(@(t) plot([0 50*sin(angPos(t))],[H(t) 50*cos(angPos(t))],'r-','LineWidth',3))
% fanimator(@(t) plot([0 50*sin(angPos(t))],[0 50*cos(angPos(t))],'g-','LineWidth',3))
% fanimator(@(t) text(-25,225,"Timer: "+num2str(t,2)));
% hold off;
% 
% playAnimation;
