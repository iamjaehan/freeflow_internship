%% Vehicle Simulation Practice Code

%--------------------------
% Parameter Settings
%--------------------------

% Simulation parameters
t0 = 0;          % Start time
tf = 100;        % End time
dt = 1;          % Time step

% Vehicle parameters
x0 = [0, 0];     % Initial position [x, y]
xf = [50, 50];   % Destination (not used in control yet)
h0 = 0;          % Initial heading [rad]
v = 1;           % Constant speed

%--------------------------
% Initialization
%--------------------------
timeSteps = t0:dt:tf;
simLength = length(timeSteps);

x = x0;          % Current position
h = h0;          % Current heading

position = zeros(simLength, 2);   % To record position over time
heading = zeros(simLength, 1);    % To record heading over time

%--------------------------
% Simulation Loop
%--------------------------

for step = 1:simLength
    %--------------------------
    % CONTROL COMMAND
    %--------------------------
    % Heading rate command (change in heading angle per second)
    % We will later replace this with smarter logic later (e.g., based on NE)
    u = 0.01;  % Try with constant value first, e.g., 0.01 rad/s

    %--------------------------
    % TODO: STATE UPDATE --- Refer to "Euler Method" for further detail.
    %--------------------------
    % Update position based on current heading and speed
    x_next = x + ? * [?, ?] * dt;

    % Update heading based on control input
    h_next = h + ? * dt;

    %--------------------------
    % LOGGING
    %--------------------------
    position(step, :) = x_next;
    heading(step) = h_next;

    % Update state for next iteration
    x = x_next;
    h = h_next;
end

%--------------------------
% Plot Results
%--------------------------
figure(1); clf;
plot(position(:,1), position(:,2), 'b:.')
hold on
plot(x0(1), x0(2), 'ro', 'MarkerSize', 8, 'DisplayName', 'Start')
plot(xf(1), xf(2), 'rx', 'MarkerSize', 8, 'DisplayName', 'Destination')
legend({"trajectory","Initial position","Destination"})
xlabel('X Position')
ylabel('Y Position')
title('Vehicle Trajectory')
axis equal
grid on

% --------------------------
% CHALLENGE
% --------------------------
% 1. Can you design a heading control law that guides the vehicle toward the destination (xf)?
%    Hint: Try computing the angle between the current position and the destination,
%          then adjust the heading to reduce that angle over time.

% 2. Real vehicles can't turn instantly. To make the simulation more realistic,
%    add a constraint on the vehicle's turning rate.
%    For example, limit the heading change rate per step (e.g., |u| <= max_turn_rate).
%    Try implementing a saturation function so that u stays within this range.