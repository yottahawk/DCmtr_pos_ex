% First run the top script to set up the ss model.
top;

%%
% We will now close the loop around the system, and use a PI controller
% with our velocity feedback to choose a setpoint.
% This model will use SIMULINK to create the feedback system.