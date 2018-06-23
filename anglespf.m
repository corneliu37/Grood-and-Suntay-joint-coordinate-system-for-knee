

%Written by Dr Corneliu T.C. Arsene
%Date 12.08.2009


function [alphapf,gammapf,productq4] = anglespf(str1)

%this is everything the same as the angles.m file except that it does for
%the patella-femoral contact

[pKx,pKy,pKz,pJx,pJy,pJz,pIx,pIy,pIz,pcx,pcy,pcz,fcgx,fcgy,fcgz,fcgIx,fcgIy,fcgIz,fcgJx,fcgJy,fcgJz,fcgKx,fcgKy,fcgKz,tcgx,tcgy,tcgz,tcgix,tcgiy,tcgiz,tcgkx,tcgky,tcgkz] = readinput(str1);

%readinput;

fcgx = fcgx - 29.1706 ;
fcgy = fcgy - 84.099 ;
fcgz = fcgz - 388.828 ;

fcgIx = fcgIx - 29.1706 ;
fcgIy = fcgIy - 85.099 ;
fcgIz = fcgIz - 388.828 ;

fcgJx = fcgJx - 19.1706 ;
fcgJy = fcgJy - 84.099 ;
fcgJz = fcgJz - 388.828 ;

fcgKx = fcgKx - 29.1706 ;
fcgKy = fcgKy - 84.099 ;
fcgKz = fcgKz - 387.828 ;

tcgx = tcgx - 29.1706 ;
tcgy = tcgy - 84.099 ;
tcgz = tcgz - 409.606 ;

tcgix = tcgix - 29.1706 ;
tcgiy = tcgiy - 85.099 ;
tcgiz = tcgiz - 409.606 ;

tcgkx = tcgkx - 29.1706 ;
tcgky = tcgky - 84.099 ;
tcgkz = tcgkz - 408.606 ;

pcx = pcx + 3.3;
pcy = pcy - 89.8;
pcz = pcz - 362;

pIx = pIx + 3.3;
pIy = pIy -90.8;
pIz = pIz -362;

pJx = pJx +4.3;
pJy = pJy -89.8;
pJz = pJz -362;

pKx = pKx + 3.3;
pKy = pKy -89.8;
pKz = pKz - 361;


%Adduction-Abduction angle for the tibial-component

vector1x =  (fcgIx-fcgx);
vector1y =  (fcgIy-fcgy);
vector1z =  (fcgIz-fcgz);

vector2x =  (tcgkx-tcgx);
vector2y =  (tcgky-tcgy);
vector2z =  (tcgkz-tcgz);

magnitude1 =sqrt(vector1x.^2 + vector1y.^2 + vector1z.^2);
magnitude2 =sqrt(vector2x.^2 + vector2y.^2 + vector2z.^2);

product1 = vector1x.*vector2x + vector1y.*vector2y + vector1z.*vector2z;
beta = acos(product1./(magnitude1.*magnitude2));%angle between k and I


%Adduction-Abduction angle for the patella

vector5x =  (fcgIx-fcgx);
vector5y =  (fcgIy-fcgy);
vector5z =  (fcgIz-fcgz);

vector6x =  (pKx-pcx);
vector6y =  (pKy-pcy);
vector6z =  (pKz-pcz);


magnitude5 =sqrt(vector5x.^2 + vector5y.^2 + vector5z.^2);
magnitude6 =sqrt(vector6x.^2 + vector6y.^2 + vector6z.^2);

product5 = vector5x.*vector6x + vector5y.*vector6y + vector5z.*vector6z;
betapf = acos(product5./(magnitude5.*magnitude6));%angle between k and I
                                                  % Abduction - adduction
                                                  % angle  

% Kk/sin(beta)
%correct version 10 March 2008

%Flexion angle for the patella

vector1x =  (fcgKx-fcgx);
vector1y =  (fcgKy-fcgy);
vector1z =  (fcgKz-fcgz);

vector2x =  (tcgkx-tcgx);
vector2y =  (tcgky-tcgy);
vector2z =  (tcgkz-tcgz);


vector5x =  (fcgKx-fcgx);
vector5y =  (fcgKy-fcgy);
vector5z =  (fcgKz-fcgz);

vector6x =  (pKx-pcx);
vector6y =  (pKy-pcy);
vector6z =  (pKz-pcz);


product1 = vector1x.*vector2x + vector1y.*vector2y + vector1z.*vector2z;

product5 = vector5x.*vector6x + vector5y.*vector6y + vector5z.*vector6z;

talpha = product1./sin(beta);
%alpha =real(acos(talpha))*57.3;

%for t =1:size(talpha,1)
% if (talpha(t,1) <= 1) & (talpha(t,1) >= -1)    
%  alpha(t,1) = (acos(talpha(t,1)))*57.3;
% elseif (talpha(t,1) > 1)
%  alpha(t,1) = -acos(ceil(talpha(t,1)) - talpha(t,1))*57.3;
% elseif (talpha(t,1) < -1)
%  alpha(t,1) = 180 + acos(talpha(t,1) - ceil(talpha(t,1))  )*57.3;     
% end
%end 

for t =1:size(talpha,1)
 if vector1x(t,1) > 0
    if (talpha(t,1) <= 1) & (talpha(t,1) >= -1)  
       alpha(t,1) = -(acos(talpha(t,1)))*57.3; 
    elseif (talpha(t,1) > 1)       
       alpha(t,1) = (-acos(ceil(talpha(t,1)) - talpha(t,1))*57.3);        
    elseif (talpha(t,1) < -1)
       alpha(t,1) = 180 + acos(talpha(t,1) - ceil(talpha(t,1))  )*57.3;     
    end
       
 else
   if (talpha(t,1) <= 1) & (talpha(t,1) >= -1)    
     alpha(t,1) = (acos(talpha(t,1)))*57.3;
   elseif (talpha(t,1) > 1)
     alpha(t,1) = (-acos(ceil(talpha(t,1)) - talpha(t,1))*57.3);
  
   elseif (talpha(t,1) < -1)
     alpha(t,1) = 180 + acos(talpha(t,1) - ceil(talpha(t,1))  )*57.3;     
   end

     %alpha(t,1) = (acos(tb(t,1)))*57.3;
     
 end
end


talphapf = product5./sin(betapf);
%alphapf =real(acos(talphapf))*57.3;

for t =1:size(talphapf,1)
 if (talphapf(t,1) <= 1) & (talphapf(t,1) >= -1)    
  alphapf(t,1) = (acos(talphapf(t,1)))*57.3;
 elseif (talphapf(t,1) > 1)
  alphapf(t,1) = -acos(ceil(talphapf(t,1)) - talphapf(t,1))*57.3;
 elseif (talphapf(t,1) < -1)
  alphapf(t,1) = 180 + acos(talphapf(t,1) - ceil(talphapf(t,1))  )*57.3;     
 end
end 

%figure;plot(alphapf,alphapf);colour;
%figure;plot(alpha,alphapf);colour;
%xlabel('Patella-femoral flexion angle');
%ylabel('Patella-femoral flexion angle [Degrees]');
%title('Patella-femoral flexion angle');

%figure;plot(alphapf,betapf*57.3-90);colour;
%figure;plot(alpha,betapf*57.3-90);colour;
%xlabel('Patella-femoral flexion angle');
%ylabel('Adduction-Abduction angle');
%title('Adduction-Abduction angle');


%Medial-Lateral tilt for the patella

vector1x =  (fcgIx-fcgx);
vector1y =  (fcgIy-fcgy);
vector1z =  (fcgIz-fcgz);

vector2x =  (tcgix-tcgx);
vector2y =  (tcgiy-tcgy);
vector2z =  (tcgiz-tcgz);


vector5x =  (fcgIx-fcgx);
vector5y =  (fcgIy-fcgy);
vector5z =  (fcgIz-fcgz);

vector6x =  (pIx-pcx);
vector6y =  (pIy-pcy);
vector6z =  (pIz-pcz);

magnitude1 =sqrt(vector1x.^2 + vector1y.^2 + vector1z.^2);
magnitude2 =sqrt(vector2x.^2 + vector2y.^2 + vector2z.^2);%sqrt(e2x^2 + e2y^2 + e2z^2);

product1 = vector1x.*vector2x + vector1y.*vector2y + vector1z.*vector2z;


magnitude5 =sqrt(vector5x.^2 + vector5y.^2 + vector5z.^2);
magnitude6 =sqrt(vector6x.^2 + vector6y.^2 + vector6z.^2);%sqrt(e2x^2 + e2y^2 + e2z^2);

product5 = vector5x.*vector6x + vector5y.*vector6y + vector5z.*vector6z;

%gamma = acos(product1./sin(beta));%or also clinical gamma
%figure;plot(alpha,real(gamma)*57.3);
%gamma = real(gamma)*57.3;
ga = product1./sin(beta);
for t =1:size(ga,1)
 if (ga(t,1) <= 1) & (ga(t,1) >= -1)    
  gamma(t,1) = (acos(ga(t,1)))*57.3;
 elseif (ga(t,1) > 1)
  gamma(t,1) = -acos(ceil(ga(t,1)) - ga(t,1))*57.3;
 elseif (gamma(t,1) < -1)
  gamma(t,1) = 180 + acos(ga(t,1) - ceil(ga(t,1))  )*57.3;     
 end
end 


%figure;plot(alpha,real(gamma)*57.3);
%colour;
%xlabel('Flexion angle');
%ylabel('Internal rotation [Degrees]');
%ylabel('Internal (-ve) ');
%title('Tibial Internal rotation');
%axis([0 160 0 20]);
%axis([0 1000 0 20]);
%gamma1 = real(acos(product1./sin(beta)))*57.3;

%gammapf = acos(product5./sin(betapf));%or also clinical gamma
ga = product5./sin(betapf);

for t =1:size(ga,1)
 if (ga(t,1) <= 1) & (ga(t,1) >= -1)    
  gammapf(t,1) = (acos(ga(t,1)))*57.3;
 elseif (ga(t,1) > 1)
  gammapf(t,1) = -acos(ceil(ga(t,1)) - ga(t,1))*57.3;
 elseif (ga(t,1) < -1)
  gammapf(t,1) = 180 + acos(ga(t,1) - ceil(ga(t,1))  )*57.3;     
 end
end 


%figure;plot(alpha,real(gamma)*57.3);
%gammapf = real(gammapf)*57.3;

%figure;plot(alphapf,-gammapf);colour;
%xlabel('Patella-femoral flexion angle');
%ylabel('Medial-Lateral tilt');
%title('Medial-Lateral tilt');


%Medial-lateral patella shift

vector5x =  (pcx-fcgx);
vector5y =  (pcy-fcgy);
vector5z =  (pcz-fcgz);

vector6x =  (pIx-pcx);
vector6y =  (pIy-pcy);
vector6z =  (pIz-pcz);


productq4  = vector5x.*vector6x + vector5y.*vector6y + vector5z.*vector6z;
%product1   H e1
%figure;plot(alphapf,productq4);colour;

%xlabel('Patella-femoral flexion angle');
%ylabel('Medial-Lateral patella shift');
%title('Medial-Lateral patella shift');


