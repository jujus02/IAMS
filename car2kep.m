function [a ,e_mod ,i ,OM , om, th] = car2kep(r ,v , mu)

% car2kep.m - Conversion from Cartesian coordinates to Keplerian elements
%
% PROTOTYPE:
% [a, e, i, OM, om, th] = car2kep(r, v, mu)
%
% DESCRIPTION:
% Conversion from Cartesian coordinates to Keplerian elements. Angles in
% radians.
%
% INPUT:
% r [3x1] Position vector [km]
% v [3x1] Velocity vector [km/s]
% mu [1x1] Gravitational parameter [km^3/s^2]
%
% OUTPUT:
% a [1x1] Semi-major axis [km]
% e [1x1] Eccentricity [-]
% i [1x1] Inclination [rad]
% OM [1x1] RAAN [rad]
% om [1x1] Pericentre anomaly [rad]
% th [1x1] True anomaly [rad]

%% 1 calcolo moduli

r_mod = norm(r);
v_mod = norm(v);

%% 2 calcolo h 
h = cross(r,v);
h_mod = norm(h);

%% 3 calcolo inclinazione

i = acos(h(3)/h_mod);

%% 4 calcolo eccentricità

e = 1/mu*((v_mod^2-mu/r_mod) * r -dot(r,v)*v);
e_mod = norm(e);



%% 5 calcolo semilato maggiore

eps = 1/2 * v_mod^2 - mu/r_mod;
a = -mu/(2*eps);

%% 6 vettore dei nodi

k = [0 0 1];
n = cross(k,h);
n_mod = norm(n);

%% 7 calcolo  Ascensione Retta del Nodo Ascendente

if (n(2)>= 0)
    OM = acos(n(1)/n_mod);
else
    OM = 2*pi - acos(n(1)/n_mod);
end

%% 8 calcolo anomalia di pericentro 

if (e(end)>=0)
    om = acos(dot(n,e)/(e_mod * r_mod));
else
    om = 2*pi - acos(dot(n,e)/(e_mod*r_mod));
end


%% 9

vr = dot(r,v)/r_mod;

%% 10 calcolo anomalia vera

if (vr>0)
    th = acos(dot(e,r)/(e_mod*r_mod));
else
    th = 2*pi -acos(dot(e,r)/(e_mod * r_mod));
end



   







