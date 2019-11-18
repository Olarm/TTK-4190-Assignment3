function [T, K] = nomoto1()
    %% Simulation settings
    tstart=0;           % Sim start time
    tstop=10000;         % Sim stop time
    tsamp=1;            % Sampling time for how often states are stored. (NOT ODE solver time step)

    p0=zeros(2,1);      % Initial position (NED)
    v0=[6.63 0]';       % Initial velocity (body)
    psi0=0;             % Inital yaw angle
    r0=0;               % Inital yaw rate
    c=0;                % Current on (1)/off (0)    

    delta_c = 10*pi/180;
    n_c = 7.3;

    sim Nomoto_params
    
    ts_data = iddata(r, delta_c*ones(size(r)), tsamp);
    sys = tfest(ts_data, 1);
    
    d = sys.Denominator;
    n = sys.Numerator;
    
    T = 1/d(2);
    K = n/d(2);

end