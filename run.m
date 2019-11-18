%% Information 
% This file is only an example of how you can start the simulation. The
% sampling time decides how often you store states. The execution  time
% will increase if you reduce the sampling time.

% Please note that the file "pathplotter.m" (only used in the second part
% of the assignment) shows the ship path during the path following and
% target tracking part of the assignment. It can be clever to adjust the sampling
% time when you use that file because it draws a sketch of the ship in the
% North-East plane at each time instant. Having a small sampling time will
% lead to multiple ship drawings on top of each other. 

% You should base all of your simulink models on the MSFartoystyring model
% and extend that as you solve the assignment. For your own sake, it is
% wise to create a new model and run file for each task.

% The msfartoystyring.m file includes the ship model. You are not allowed
% to change anything within that file. You need to include that file in
% every folder where you have a simulink model based on
% "MSFartoystyring.slx". 

% WP.mat is a set of six waypoints that you need to use in the second part of
% the assignment. The north position is given in the first row and the east
% position in the second row. 


%% Simulation settings
tstart=0;           % Sim start time
tstop=10000;         % Sim stop time
tsamp=1;            % Sampling time for how often states are stored. (NOT ODE solver time step)

p0=zeros(2,1);      % Initial position (NED)
v0=[0.01 0]';       % Initial velocity (body)
psi0=0;             % Inital yaw angle
r0=0;               % Inital yaw rate
c=0;                % Current on (1)/off (0)

%%%% Input functions
delta_c = 10*pi/180;
n_c = 7.3;

%%%% 1. order Nomoto parameters
% [T, K] = nomoto1();
K = -0.0334;% -0.001404 / 0.0008942;
T = 53.1191; %1 / 0.0008942;

%%%% surge controller parameters
% d1 = -0.0634;
% d2 = 1.0463;
% d3 = 6000;
d1 = 10000;
d2 = 70;

%%%% heading PID parameters
Kp = 2.5446;
Kd = 127.2314;
%Ki = 0.0102;   %Beregnet Ki
Ki = 0.022;     % manuell tuning

%%%% Surge PI parameters
k_p_s = 290.0490;
k_i_s = 31.5469;

sim MSFartoystyring1 % The measurements from the simulink model are automatically written to the workspace.

xs = [6.5257    0.0133];

x0 = [8, 0.001];
u0 = v0(1);
F = @(x, t) u0 + (x(1) - u0)*(1 - exp(-x(2)*t));
x = lsqcurvefit(F, x0, t, v(:,1));

plot(t, v(:,1), "blue", t, F(x, t));
