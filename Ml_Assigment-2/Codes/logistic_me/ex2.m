clear ; close all; clc
data = load('ex2data1.txt');
X = data(:,[1,2]); 
y = data(:,3);

%% ==================== Part 1: Plotting ====================
fprintf(['Plotting data with + indicating (y = 1) examples and o ' ...
         'indicating (y = 0) examples.\n']);

%plotData(X,y);
figure; hold on;
pos=find(y==1);
neg=find(y==0);

plot(X(pos,1),X(pos,2),'k+','LineWidth', 2, 'MarkerSize', 7);
plot(X(neg,1),X(neg,2),'ko','MarkerFaceColor', 'y', 'MarkerSize', 7);
hold on;
xlabel('Exam 1 score')
ylabel('Exam 2 score')
legend('Admitted', 'Not admitted')
hold off;
fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% ============ Part 2: Compute Cost and Gradient ============
[m, n] = size(X);
X = [ones(m, 1) X];
initial_theta = zeros(n + 1, 1);
[cost, grad] = costFunction(initial_theta, X, y);

fprintf('Cost at initial theta (zeros): %f\n', cost);
fprintf('Expected cost (approx): 0.693\n');
fprintf('Gradient at initial theta (zeros): \n');
fprintf(' %f \n', grad);
fprintf('Expected gradients (approx):\n -0.1000\n -12.0092\n -11.2628\n');
fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% ============= Part 3: Optimizing using fminunc  =============
options = optimset('GradObj', 'on', 'MaxIter', 400);
[theta, cost] = ...
	fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);

% Print theta to screen
fprintf('Cost at theta found by fminunc: %f\n', cost);
fprintf('Expected cost (approx): 0.203\n');
fprintf('theta: \n');
fprintf(' %f \n', theta);
fprintf('Expected theta (approx):\n');
fprintf(' -25.161\n 0.206\n 0.201\n');
% Plot Boundary
plotDecisionBoundary(theta, X, y);
hold on;
xlabel('Exam 1 score')
ylabel('Exam 2 score')
legend('Admitted', 'Not admitted','Decision Boundary')
hold off;
fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% ============== Part 4: Predict and Accuracies ==============
%  Predict probability for a student with score 45 on exam 1 and score 85 on exam 2 
prob = sigmoid([1 45 85] * theta);
fprintf(['For a student with scores 45 and 85, we predict an admission ' ...
         'probability of %f\n'], prob);
if(prob>=0.5)
disp('a student with score 45 on exam 1 and score 85 on exam 2 is ADMITTED');
else
disp('a student with score 45 on exam 1 and score 85 on exam 2 is NOT ADMITTED!!');
endif

% Compute accuracy on our training set
p = predict(theta, X);
fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);
fprintf('\n');


