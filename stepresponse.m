% First run the top script to set up the ss model.
top;

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