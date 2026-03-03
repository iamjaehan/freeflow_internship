function [safety_matrix, fairness_matrix] = compute_satisfaction(ws, wf, ks, Ds, x_sol)
    % Number of players
    N = length(ks);
    
    % Initialize satisfaction matrices
    safety_matrix = zeros(N, N);
    fairness_matrix = zeros(N, N);
    
    % Compute safety satisfaction matrix
    for i = 1:N
        for j = 1:N
            if i ~= j
                safety_matrix(i, j) = x_sol(i) + x_sol(j) - Ds(i, j);
            end
        end
    end
    
    % Compute fairness satisfaction matrix
    for i = 1:N
        for j = 1:N
            if i ~= j
                fairness_matrix(i, j) = ks(i) * x_sol(i) - ks(j) * x_sol(j);
            end
        end
    end
end