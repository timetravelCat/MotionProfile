function trapezoid = trapezoid_generate(pi,pf,vi,vf,vmax,vmin,amax,amin)
trapezoid.pi = pi;
trapezoid.pf = pf;
trapezoid.vi = vi;
trapezoid.vf = vf;
trapezoid.vmax = vmax;
trapezoid.vmin = vmin;
trapezoid.amax = amax;
trapezoid.amin = amin; 

% fields
% trapezoid.t
% trapezoid.ta
% trapezoid.tb
% trapezoid.tc
% trapezoid.a1
% trapezoid.a2

dp = pf - pi;

switch vi
    % Global Case 1 : vi == vmax
%     case vmax
%         t0 = (vf-vi)/amin;
%         t1 = (vmin-vi)/amin;
%         t2 = (vf-vmin)/amax;
%         Astar = vi*t0 + 0.5*amin*t0*t0;
%         % Bstar = Astar;
%         Cstar = vi*t1 + 0.5*amin*t1*t1 + vmin*t2 + 0.5*amax*t2*t2;
%         if(dp >= Astar) 
%             trapezoid.type = '*-\';
%             trapezoid.ta = 0;
%             trapezoid.tb = (dp - Astar)/vi;
%             trapezoid.tc = t0;
%             trapezoid.a1 = 0;
%             trapezoid.a2 = amin;
%         elseif(dp >= Cstar)
%             trapezoid.type = '\*/';
%             % Or +sqrt? find solution for vmin < vstar < vf 
%             vstar = -sqrt((2.0*amax*amin*(dp-Astar)+amax*vf*vf-amin*vf*vf)/(amax-amin));
%             trapezoid.ta = (vstar-vi)/amin;
%             trapezoid.tb = 0;
%             trapezoid.tc = (vf-vstar)/amax;
%             trapezoid.a1 = amin;
%             trapezoid.a2 = amax;
%         else % (dp < Cstar)
%             trapezoid.type = '\-/';
%             trapezoid.ta = t1;
%             trapezoid.tb = (dp-Cstar)/vmin;
%             trapezoid.tc = t2;
%             trapezoid.a1 = amin;
%             trapezoid.a2 = amax;
%         end
%     
%     % Global Case 2 : vi == vmin
%     case vmin
%         t0 = (vf-vi)/amax;
%         t1 = (vf-vmax)/amin;
%         t2 = (vmax-vi)/amax;
%         % Bstar = Cstar;
%         Cstar = vi*t0+0.5*amax*t0*t0;
%         Astar = vi*t2+0.5*amax*t2*t2 + vmax*t1+0.5*amin*t1*t1;
%         if(dp >= Astar)
%             trapezoid.type = '/-\';
%             trapezoid.ta = t2;
%             trapezoid.tb = (dp-Astar)/vmax;
%             trapezoid.tc = t1;
%             trapezoid.a1 = amax;
%             trapezoid.a2 = amin;
%         elseif(dp >= Cstar)
%             trapezoid.type = '/*\';
%             % Or +sqrt? find solution for vf < vstar < vmax
%             vstar = sqrt((2.0*amax*amin*(Cstar-dp)+amax*vf*vf-amin*vf*vf)/(amax-amin));
%             trapezoid.ta = (vstar - vi)/amax;
%             trapezoid.tb = 0;
%             trapezoid.tc = (vf-vstar)/amin;
%             trapezoid.a1 = amax;
%             trapezoid.a2 = amin;
%         else
%             trapezoid.type = '*_/';
%             trapezoid.ta = 0;
%             trapezoid.tb = (dp-Cstar)/vmin;
%             trapezoid.tc = (vf-vmin)/amax;
%             trapezoid.a1 = 0.0;
%             trapezoid.a2 = amax;
%         end

    % Global Case 3 : vmin < vi < vmax
    otherwise
        t0 = (vmax-vi)/amax;
        t1 = (vf-vmax)/amin;
        t2 = (vmin-vi)/amin;
        t3 = (vf-vmin)/amax;
        Astar = vi*t0+0.5*amax*t0*t0 + vmax*t1 + 0.5*amin*t1*t1;
        Cstar = vi*t2+0.5*amin*t2*t2 + vmin*t3 + 0.5*amax*t3*t3;

        if (dp >= Astar)
            trapezoid.type = '/-\';
            trapezoid.ta = t0;
            trapezoid.tb = (dp-Astar)/vmax;
            trapezoid.tc = t1;
            trapezoid.a1 = amax;
            trapezoid.a2 = amin;
        elseif(Cstar >= dp)
            trapezoid.type = '\-/';
            trapezoid.ta = t2;
            trapezoid.tb = (dp-Cstar)/vmin;
            trapezoid.tc = t3;
            trapezoid.a1 = amin;
            trapezoid.a2 = amax;
        else
            trapezoid.tb = 0;

            if(vf >= vi)
                t = (vf-vi)/amax;
                Bstar = vi*t+0.5*amax*t*t;
                    
                if(dp >= Bstar)
                    trapezoid.type = '/*\';
                    % vstar >= vf
                    vstar = sqrt((2.0*amax*amin*(Bstar-dp)+amax*vf*vf-amin*vf*vf)/(amax-amin));
                    trapezoid.ta = (vstar - vi)/amax;
                    trapezoid.tc = (vf - vstar)/amin;
                    trapezoid.a1 = amax;
                    trapezoid.a2 = amin;

                else
                    trapezoid.type = '\*/';
                    % vstar < vf
                    vstar = -sqrt((2.0*amax*amin*(dp-Bstar)+amax*vi*vi-amin*vi*vi)/(amax-amin));

                    trapezoid.ta = (vstar - vi)/amin;
                    trapezoid.tc = (vf - vstar)/amax;
                    trapezoid.a1 = amin;
                    trapezoid.a2 = amax;
                end

            elseif(vf < vi)
                t = (vf-vi)/amin;
                Bstar = vi*t+0.5*amin*t*t;

                if(dp >= Bstar)
                    trapezoid.type = '/*\';
                    % vstar >= vf
                    vstar = sqrt((2.0*amax*amin*(Bstar-dp)+amax*vi*vi-amin*vi*vi)/(amax-amin));
                    trapezoid.ta = (vstar - vi)/amax;
                    trapezoid.tc = (vf - vstar)/amin;
                    trapezoid.a1 = amax;
                    trapezoid.a2 = amin;

                else
                    trapezoid.type = '\*/';
                    % vstar < vf
                    vstar = -sqrt((2.0*amax*amin*(dp-Bstar)+amax*vf*vf-amin*vf*vf)/(amax-amin));                    
                    trapezoid.ta = (vstar - vi)/amin;
                    trapezoid.tc = (vf - vstar)/amax;
                    trapezoid.a1 = amin;
                    trapezoid.a2 = amax;
                end
            end
        end
end
        
trapezoid.t = trapezoid.ta + trapezoid.tb + trapezoid.tc;
end