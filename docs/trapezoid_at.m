function [pos,vel] = trapezoid_at(trapezoid,t)

% fields
% trapezoid.t
% trapezoid.ta
% trapezoid.tb
% trapezoid.tc
% trapezoid.a1
% trapezoid.a2
% trapezoid.pi
% trapezoid.vi

if(t <= trapezoid.ta)
    pos = trapezoid.pi + trapezoid.vi*t + 0.5*trapezoid.a1*t*t;
    vel = trapezoid.vi + t*trapezoid.a1;
elseif(t <= trapezoid.ta + trapezoid.tb)
%     Get Position , Velocity at ta
    [pos, vel] = trapezoid_at(trapezoid, trapezoid.ta);
    pos = pos + vel*(t - trapezoid.ta);
elseif(t <= trapezoid.t)
    % Get position ,Velocity at ta + tb
    [pos, vel] = trapezoid_at(trapezoid, trapezoid.ta + trapezoid.tb);
    pos = pos + vel*(t - trapezoid.ta - trapezoid.tb) + 0.5*trapezoid.a2*(t - trapezoid.ta - trapezoid.tb)*(t - trapezoid.ta - trapezoid.tb);
    vel = vel + (t - trapezoid.ta - trapezoid.tb)*trapezoid.a2;
else
    % Get position ,Velocity at ta + tb + tc
    [pos, vel] = trapezoid_at(trapezoid, trapezoid.t);
    pos = pos + vel*(t - trapezoid.t);
end
end