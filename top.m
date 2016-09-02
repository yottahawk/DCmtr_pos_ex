%%
% This example uses a state-space model from the following website.
% http://ctms.engin.umich.edu/CTMS/index.php?example=MotorPosition&section=SystemModeling
%
% The system will model a DC motor.
%%

%% Motor Constants
J = 3.2284e-6;  % rotational inertia
b = 3.5077e-6;  % viscous friction constant
Kb = 0.0274;    % Electromotive force constant
Kt = 0.0274;    % Motor Torque Constant
R = 4;          % Armature Winding Resistance
L = 2.75e-6;    % Armature Winding Inductance
%%
% Define our state-space matricies
% Our state variables vector is.....
% [   pos   ]
% [   vel   ]
% [ current ]
%
% Our input vector is the one element, V.

A = [0      1       0
     0     -b/J     Kt/J
     0     -Kb/L   -R/L];
B = [0;     0;      1/L];
C = [1      0       0;
     0      1       0;
     0      0       1];    % Output all state variables for clarity.
D = 0;

mtr_ss = ss(A,B,C,D);





