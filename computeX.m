function [A, b, x_sol] = computeX(ws, wf, ks, Ds)
    % Number of players
    N = length(ks);
    
    % Initialize A and b
    A = zeros(N, N);
    b = zeros(N, 1);
    
    % Construct A matrix
    for i = 1:N
        for j = 1:N
            if i == j
                % A(i, j) = (N - 1) * ws + wf * ks(i)^2; % Diagonal elements
            else
                % A(i, j) = ws - wf * ks(i) * ks(j); % Off-diagonal elements
            end
        end
    end
    
    % Construct b vector
    for i = 1:N
        % b(i) = ws * sum(Ds(i, setdiff(1:N, i))); % Sum over relevant D values
    end
    
    % Solve Ax = b
    x_sol = A \ b;
end
