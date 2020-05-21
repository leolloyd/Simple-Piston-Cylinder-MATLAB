% piston cylinder code for ENME401 LCV assignment
% leo lloyd 21/05/20

s = 0.1;
B = 0.05;
L = 0.15;
a = 0.05;
theta = 30;

syms pistHeight(L,a,theta)
pistHeight(L,a,theta) = a*cos(theta) + sqrt(L^2-a^2*sin(theta)^2); % height of piston, i.e. the furthest point from origin

% time vs height graph

syms t0 t
rpmConv = 2*pi/60;
angVel(t0) = 30*rpmConv; %constant velocity of 30 rpm
angPos(t) = int(angVel,t0,0,t);

H(t) = pistHeight(150,50,angPos)

fplot(H(t),[0 10])
xlabel('Time (sec)')
ylabel('Height (mm)')

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