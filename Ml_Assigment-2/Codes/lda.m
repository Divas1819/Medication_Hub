function lda
  load Yale_64x64.mat;
  size(fea);
  img=fea';
  size(img);
  %imshow(uint8(reshape(img(:,),64,64)))
  c1=img(:,1:11);
  c2=img(:,12:22);
  
  %calculate Sb
  c1t=transpose(c1);
  mut1=mean(c1t);
  mu1=mut1';
  
  c2t=transpose(c2);
  mut2=mean(c2t);
  mu2=mut2';
   
  Sb=(mu1-mu2)*transpose(mu1-mu2);
  disp('size of Sb')
  size(Sb)
  
  %calculate Sw
  for i=1:size(c1,2)
  mu1exp(:,i)=mu1;
  endfor

for i=1:size(c2,2)
  mu2exp(:,i)=mu2;
endfor

Sigma1=(c1-mu1exp)*(c1-mu1exp)';
Sigma2=(c2-mu2exp)*(c2-mu2exp)';
Sw=Sigma1+Sigma2;
disp('size of Sw')
size(Sw)

%[w,d]=eig(inv(Sw)*Sb);
[V,d]=eig(Sw\Sb);
[d,i]=sort(diag(d),'descend');
V=V(:,i);
w=V(:,1);
disp('size of linear discriminant w is')
size(w)


disp('Projecting Class-0 data for first set of faces');
for i=1:10
  transpose(w)*c1(:,i)
endfor

disp('Projecting Class-1 data for second set of faces');
for i=1:10
  transpose(w)*c2(:,i)
endfor
disp('For out of sample data');
%classify out of sample data
disp('Class 0 out of sample projection');
transpose(w)*img(:,11)
disp('Class 1 out of sample projection');
transpose(w)*img(:,22)
endfunction

