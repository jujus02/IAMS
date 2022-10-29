function [X Y Z] = plotOrbit(kepEl, mu, deltaTh, stepTh)

% plotOrbit.m - Plot the arc length deltaTh of the orbit described by
% kepEl.
%
% PROTOTYPE:
% plotOrbit(kepEl, mu, deltaTh, stepTh)
%
% DESCRIPTION:
% Plot the arc length of the orbit described by a set of orbital
% elements for a specific arc length.
%
% INPUT:
% kepEl [1x6] orbital elements [km,rad]
% mu [1x1] gravitational parameter [km^3/s^2]
% deltaTh [1x1] arc length [rad]
% stepTh [1x1] arc length step [rad]
%
% OUTPUT:
% X [1xn] X position [km]
% Y [1xn] Y position [km]
% Z [1xn] Z position [km]
%kepEl = [a,e,i,OM,om]


teta = 0:stepTh:deltaTh;
X = [];
Y = [];
Z = [];

for i = teta
    [r,v] = kep2car(kepEl(1), kepEl(2), kepEl(3), kepEl(4), kepEl(5), i, mu);
    X = [X r(1)];
    Y = [Y r(2)];
    Z = [Z r(3)];
end









