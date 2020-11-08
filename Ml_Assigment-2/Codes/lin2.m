data = load("dataset.txt");
x=data(:,1);
y = data(:,2);
plot (x, y, "or")
m=length(y); %size of our training set.
X=[ones(m,1),data(:,1)];
alpha=0.01;
weights=[0;0]; %you can also write zeros(2,1)

num_iter=2000;


for i=1:num_iter
    h_x=X*weights;
    weights-=alpha/m  * (X'*(h_x-y));
end
 hold
 % predicting out of space samples
 x1=6.4;
 y1=weights(2,:)*x1+weights(1,:);
 x2=15.64;
 y2=weights(2,:)*x2+weights(1,:);
 x3=19.06;
 y3=weights(2,:)*x3+weights(1,:);
 plot([x1 x2 x3],[y1 y2 y3],"+")
 
 x = 5:25
 y = weights(2,:)*x+weights(1,:)
 plot(x,y)
disp('Slope:')
weights(2,:)
disp('y-intercept:')
weights(1,:)