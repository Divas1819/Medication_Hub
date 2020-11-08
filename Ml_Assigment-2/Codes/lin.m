function lin
F=2;%Enter no. of observed features
R=7;  %Enter number of observations
%X=[X y] features augmented wit output
X=[0.18 0.89 109.85;
   1.0 0.26 155.72;
   0.92 0.11 137.66;
   0.07 0.37 76.17;
   0.85 0.16 139.75;
   0.99 0.41 162.6;
   0.87 0.47 151.77];

  Y = X(:,F+1);               % Y is the last column
  X = [ones(R,1), X(:,[1:F])]; % First column of X is all 1's

T = pinv(X'*X)*X'*Y;        % Normal Equation to calculate Theta
q=4;
Qtmp=[0.49 0.18;
   0.57 0.83;
   0.56 0.64;
   0.76 0.18 ];         
Q = [ones(q,1),Qtmp];
disp('The housing prices per square foot depending on the feature vectors are:')
disp(Q*T)
endfunction
