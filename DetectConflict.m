function [conflictFlag, Rmin] = DetectConflict(pos1, vel1, pos2, vel2, MSD)
    % pos1, pos2: [x, y] position vectors
    % vel1, vel2: [vx, vy] velocity vectors
    % MSD: minimum separation distance
    % Returns:
    %   conflictFlag: true if conflict detected
    %   deltaThetaTot: required total heading change in radians

    % Relative position and velocity
    relPos = pos2 - pos1;
    relVel = vel2 - vel1;
    
    x = relPos(1);
    y = relPos(2);
    
    v = norm(relVel);
    if v == 0
        conflictFlag = false;
        deltaThetaTot = 0;
        return;
    end

    theta = atan2(relVel(2), relVel(1));  % angle of relative velocity

    % Estimated Time of Arrival (ETA)
    ETA = -(x * cos(theta) + y * sin(theta)) / v;

    % Projected minimum distance (Rmin)
    x_min = x + v * ETA * cos(theta);
    y_min = y + v * ETA * sin(theta);
    Rmin = sqrt(x_min^2 + y_min^2);

    % Conflict detection
    conflictFlag = (ETA > 0) && (Rmin < MSD);

    % Required total heading angle deviation
    if conflictFlag
        Dij = MSD - Rmin;
        deltaThetaTot = Dij / (ETA * v);  % in radians
    else
        deltaThetaTot = 0;
    end


end