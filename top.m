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

%%
% We can start by analysing the system matrix A. The eigenvalues of A are
% equivalent to the poles of the transfer function.
poles = eig(A); % Calculate the eigenvales (poles of the system)

% We can plot the step response of the system to a unit step
step_simtime = 0.2; % seconds

[y_step, t_step]  = step(mtr_ss,[0:1e-6:step_simtime]);
hold on;
subplot(3,1,1)
plot(t_step,y_step(:,1));
ylabel('Position, $\theta$','interpreter','latex');
xlabel('Time (s)');
subplot(3,1,2)
plot(t_step,y_step(:,2));
ylabel('Velocity, $\dot{\theta}$','interpreter','latex');
xlabel('Time (s)');
subplot(3,1,3)
plot(t_step,y_step(:,3));
ylabel('Current, $i$','interpreter','latex');
xlabel('Time (s)');
hold off;
