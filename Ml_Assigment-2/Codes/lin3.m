data = load('dataset2.txt');
% Define x and y
x = data(:,2);
y = data(:,1);
% Create a function to plot the data
function plotData(x,y)
plot(x,y,'rx','MarkerSize',8); % Plot the data
end
% Plot the data
plotData(x,y);
xlabel('Rate of Cricket Chirping'); % Set the x-axis label
ylabel('Temperature in Degrees Fahrenheit'); % Set the y-axis label
fprintf('Program paused. Press enter to continue.\n');
pause;
% Count how many data points we have
m = length(x);
% Add a column of all ones (intercept term) to x
X = [ones(m, 1) x];
% Calculate theta
theta = (pinv(X'*X))*X'*y;
disp("Fitted Equation is :")
printf("%f x + %f\n", theta(2,:),theta(1,:));
% Plot the fitted equation we got from the regression
hold on; % this keeps our previous plot of the training data visible
plot(X(:,2), X*theta, '-')
%Prediction
x1=15;
y1=theta(2,:)*x1+theta(1,:);
plot(x1,y1,"or")
x1=16.5;
y1=theta(2,:)*x1+theta(1,:);
plot(x1,y1,"or")
x1=17.3;
y1=theta(2,:)*x1+theta(1,:);
plot(x1,y1,"or")
x1=18.3;
y1=theta(2,:)*x1+theta(1,:);
plot(x1,y1,"or")
x1=18.7;
y1=theta(2,:)*x1+theta(1,:);
plot(x1,y1,"or")
x1=19.2;
y1=theta(2,:)*x1+theta(1,:);
plot(x1,y1,"or")
hold
legend('Training data', 'Linear regression','Prediction')

hold off % Don't put any more plots on this figure