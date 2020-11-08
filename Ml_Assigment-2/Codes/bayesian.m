function bayesian
  load Yale_64x64.mat;
  size(fea);
  img=fea';
  size(img);
  %imshow(uint8(reshape(img(:,),64,64)))
  c1=img(1:50,1:10);
  c2=img(1:50,12:21);
   
  c1t=transpose(c1);
  mut1=mean(c1t);
  mu1=mut1';
  
  c2t=transpose(c2);
  mut2=mean(c2t);
  mu2=mut2';
 
  for i=1:size(c1,2)
  mu1exp(:,i)=mu1;
  endfor
  Sigma1=(c1-mu1exp)*(c1-mu1exp)';
  
  for i=1:size(c2,2)
  mu2exp(:,i)=mu2;
  endfor
  Sigma2=(c2-mu2exp)*(c2-mu2exp)';
  
  sample1=img(1:50,11);
  tmp1=transpose(sample1-mu1)*inv(Sigma1)*(sample1-mu1);
  tmp2=transpose(sample1-mu2)*inv(Sigma2)*(sample1-mu2);
  %assume same prior=1/2
  %assume same covariance matrices hence same denominator
  if(tmp1>tmp2) % e^(-tmp)
  disp('Sample image belongs to class 2')
  else
  disp('Sample image belongs to class 1')
  endif 
  
endfunction
