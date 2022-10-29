clear all
close all
clc

%% cosa fanno 8 cani in mare?Un canotto, e cosa fanno tani galli sottoterra?

a = 15000;
e = 0.1;
i = 15*pi/180;
OM = 45*pi/180;
om = 30*pi/180;
th = 180*pi/180;
mu =  398600.433;

kep = [a e i OM om];

% Call the Terra_3D Function
Terra3d;
% Call the plotOrbit function
[X,Y,Z] = plotOrbit(kep,mu,2*pi,deg2rad(0.1));
% Plot the 3D satellite orbit
plot3(X,Y,Z);
% Define an indefinite plot
h = plot3(nan,nan,nan,'or');
% Define the step animation
step_animation = 10;
% Define the moving point
for i = 1:step_animation:length(X)
set(h,'XData',X(i),'YData',Y(i),'ZData',Z(i));
drawnow
end
