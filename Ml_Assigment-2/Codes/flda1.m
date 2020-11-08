function flda1
  X = [2 3;
       3 4;
       4 5;
       5 6;
       5 7;
       2 1;
       3 2;
       4 2;
       4 3;
       6 4;
       7 6];
  c = [1;  1;  1;  1;  1;  2;  2;  2;  2;  2;  2]; 
  
  c1 = X(find(c==1),:);
  c2 = X(find(c==2),:);
  figure;

p1 = plot(c1(:,1), c1(:,2), "ro", "markersize",10, "linewidth", 3); hold on;
p2 = plot(c2(:,1), c2(:,2), "go", "markersize",10, "linewidth", 3);

xlim([0 8])
ylim([0 8])
classes=max(c);
mu_total=mean(X);
mu=[mean(c1);mean(c2)];
Sw = (X - mu(c,:))'*(X - mu(c,:));
Sb=(ones(classes,1)* mu_total - mu)' * (ones(classes,1) * mu_total - mu);
[V, D] = eig(Sw\Sb);
[D, i] = sort(diag(D), 'descend');
V = V(:,i)
scale = 5;
pc1 = line([mu_total(1) - scale * V(1,1) mu_total(1) + scale * V(1,1)], [mu_total(2) - scale * V(2,1) mu_total(2) + scale * V(2,1)]);
set(pc1, 'color', [1 0 0], "linestyle", "--")
Xm = bsxfun(@minus, X, mu_total);
disp('Linear discriminant is:')
disp(V(:,1))
%projection
z = Xm*V(:,1);
%reconstruction
p = z*V(:,1)';
p = bsxfun(@plus, p, mu_total);
delete(p1);
delete(p2);

y1 = p(find(c==1),:)
y2 = p(find(c==2),:)

q1 = plot(y1(:,1),y1(:,2),"ro", "markersize", 10, "linewidth", 3);
q2 = plot(y2(:,1), y2(:,2),"go", "markersize", 10, "linewidth", 3);
endfunction
