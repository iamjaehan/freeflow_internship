%% Parameter setting
ws = 0.5;
wf = 1-ws;
n = 10;

%% Internal parameters setting
% This part generates urgency factor (ks) and 
ks = ones(n,1);
M = tril(rand(n)*50+25,-1);
Ds = M + M'; % D values 

%% Solve
[A,b,x_sol] = computeX(ws,wf,ks,Ds);
disp(x_sol)

%% Evaluate
% [ss,fs]=compute_satisfaction(ws,wf,ks,Ds,x_sol);
% 
% ss(:,1)
% fs(:,1)