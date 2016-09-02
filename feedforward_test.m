% First run the top script to set up the ss model.
top;

%%
% Feedforward control test

% We want to control the velocity, so we insert a prescaling to the input.
% The gain is equal to the reciprocal of the DC system gain from input to
% position output. 

pre_gain = 1 / dcgain(mtr_ss(2)); % (2) is the velocity state variable
% We can now use the same step response plot, but multiply the SS model by
% the pre-gain.

[y_step, t_step]  = step(pre_gain*mtr_ss,[0:1e-6:step_simtime]);
hold on;
plot(t_step,y_step(:,2));
ylabel('Velocity, $\dot{\theta}$','interpreter','latex');
xlabel('Time (s)');
hold off;