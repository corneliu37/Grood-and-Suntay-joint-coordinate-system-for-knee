
%Written by Dr Corneliu T.C. Arsene
%Date 12.08.2009


function [alpha,beta,gamma,medlat,anttib] = anglesn(str1)

%reads input files
     
[pKx,pKy,pKz,pJx,pJy,pJz,pIx,pIy,pIz,pcx,pcy,pcz,fcgx,fcgy,fcgz,fcgIx,fcgIy,fcgIz,fcgJx,fcgJy,fcgJz,fcgKx,fcgKy,fcgKz,tcgx,tcgy,tcgz,tcgix,tcgiy,tcgiz,tcgkx,tcgky,tcgkz] = readinput(str1);

%femur - femoral component
%tibial - tibial component

%the numerical values from below represent the initial coordinate of the respective
%points before you started the PamCrash simulation 

%the direction and meaning of the i,j,k and I,J,K vectors is the one from
%the Grood and Suntay paper

%fcgx - femur center of gravity x coordinate
%fcgy - femur center of gravity y coordinate
%fcgz - femur center of gravity z coordinate

fcgx = fcgx - 29.1706 ;
fcgy = fcgy - 84.099 ;
fcgz = fcgz - 388.828 ;

%fcgIx - femur I point the x coordinate
%fcgIy - femur I point the y coordinate
%fcgIz - femur I point the z coordinate

fcgIx = fcgIx - 29.1706 ;
fcgIy = fcgIy - 85.099 ;
fcgIz = fcgIz - 388.828 ;

%fcgJx - femur J point the x coordinate
%fcgJy - femur J point the y coordinate
%fcgJz - femur J point the z coordinate

fcgJx = fcgJx - 19.1706 ;
fcgJy = fcgJy - 84.099 ;
fcgJz = fcgJz - 388.828 ;

%fcgKx - femur K point the x coordinate
%fcgKy - femur K point the y coordinate
%fcgKz - femur K point the z coordinate

fcgKx = fcgKx - 29.1706 ;
fcgKy = fcgKy - 84.099 ;
fcgKz = fcgKz - 387.828 ;

%tcgx - tibial center of gravity x coordinate
%tcgy - tibial center of gravity y coordinate
%tcgz - tibial center of gravity z coordinate

tcgx = tcgx - 29.1706 ;
tcgy = tcgy - 84.099 ;
tcgz = tcgz - 413.606 ;%409.606

%tcgix - tibial i point x coordinate
%tcgiy - tibial i point y coordinate
%tcgiz - tibial i point z coordinate
tcgix = tcgix - 29.1706 ;
tcgiy = tcgiy - 85.099 ;
tcgiz = tcgiz - 413.606 ;%409.606

%tcgkx - tibial k point x coordinate
%tcgky - tibial k point y coordinate
%tcgkz - tibial k point z coordinate


tcgkx = tcgkx - 29.1706 ;
tcgky = tcgky - 84.099 ;
tcgkz = tcgkz - 412.606 ;%408.606



%Abduction - adduction angle 

vector1x =  (fcgIx-fcgx);
vector1y =  (fcgIy-fcgy);
vector1z =  (fcgIz-fcgz);

vector2x =  (tcgkx-tcgx);
vector2y =  (tcgky-tcgy);
vector2z =  (tcgkz-tcgz);


magnitude1 =sqrt(vector1x.^2 + vector1y.^2 + vector1z.^2);
magnitude2 =sqrt(vector2x.^2 + vector2y.^2 + vector2z.^2);

product1 = vector1x.*vector2x + vector1y.*vector2y + vector1z.*vector2z;


%beta = acos(product1./(magnitude1.*magnitude2)) ;%angle between k vector and I vector 
                                                %Abduction - adduction angle  

beta = acos(product1) ;
                                                
%Medial-lateral tibial thrust                                                 
                                                
vector1x =  (fcgIx-fcgx);
vector1y =  (fcgIy-fcgy);
vector1z =  (fcgIz-fcgz);

vector2x =  (tcgx-fcgx);
vector2y =  (tcgy-fcgy);
vector2z =  (tcgz-fcgz);

medlat = vector1x.*vector2x + vector1y.*vector2y + vector1z.*vector2z;%Medial-lateral tibial thrust 


%Anterior tibial drawer displacement

vector1x =  (fcgIx-fcgx);
vector1y =  (fcgIy-fcgy);
vector1z =  (fcgIz-fcgz);

vector2x =  (tcgkx-tcgx);
vector2y =  (tcgky-tcgy);
vector2z =  (tcgkz-tcgz);

vector3x =  (tcgx-fcgx);
vector3y =  (tcgy-fcgy);
vector3z =  (tcgz-fcgz);


e2x = (vector2y.*vector1z-vector2z.*vector1y)./sin(beta);
e2y = (vector2z.*vector1x-vector2x.*vector1z)./sin(beta);
e2z = (vector2x.*vector1y-vector2y.*vector1x)./sin(beta);

% H e2
anttib = e2x.*vector3x + e2y.*vector3y + e2z.*vector3z;%Anterior tibial drawer displacement



%Flexion angle

% Kk/sin(beta)

  vector1x =  (fcgKx-fcgx);
  vector1y =  (fcgKy-fcgy);
  vector1z =  (fcgKz-fcgz);

  vector2x =  (tcgkx-tcgx);
  vector2y =  (tcgky-tcgy);
  vector2z =  (tcgkz-tcgz);

 
 
product1 = vector1x.*vector2x + vector1y.*vector2y + vector1z.*vector2z;
tb = (product1./sin(beta));
%talpha1 =(acos(talpha));
%for i=1:size(talpha)
%  if isreal(talpha1(i))
%     alpha(i) = talpha1(i)*57.3;
%  else    
%     alpha(i) = 180-imag(talpha1(i))*57.3;
%  end    
%end
product1;
tb;
sign(vector1x);

for t =1:size(tb,1)
 if vector1x(t,1) > 0
    if (tb(t,1) <= 1) & (tb(t,1) >= -1)  
       alpha(t,1) = -(acos(tb(t,1)))*57.3; 
    elseif (tb(t,1) > 1)       
       alpha(t,1) = (-acos(ceil(tb(t,1)) - tb(t,1))*57.3);        
    elseif (tb(t,1) < -1)
       alpha(t,1) = 180 + acos(tb(t,1) - ceil(tb(t,1))  )*57.3;     
    end
       
 else
   if (tb(t,1) <= 1) & (tb(t,1) >= -1)    
     alpha(t,1) = (acos(tb(t,1)))*57.3;
   elseif (tb(t,1) > 1)
     alpha(t,1) = (-acos(ceil(tb(t,1)) - tb(t,1))*57.3);
  
   elseif (tb(t,1) < -1)
     alpha(t,1) = 180 + acos(tb(t,1) - ceil(tb(t,1))  )*57.3;     
   end

     %alpha(t,1) = (acos(tb(t,1)))*57.3;
     
 end
end



%for t =1:size(tb,1)
% if (tb(t,1) <= 1) & (tb(t,1) >= -1)    
%  alpha(t,1) = (acos(tb(t,1)))*57.3;
% elseif (tb(t,1) > 1)
%  alpha(t,1) = (-acos(ceil(tb(t,1)) - tb(t,1))*57.3);
%  
% elseif (tb(t,1) < -1)
%  alpha(t,1) = 180 + acos(tb(t,1) - ceil(tb(t,1))  )*57.3;     
% end
%end 

%alpha =-imag(acos(talpha))*57.3;%Flexion angle
%alpha = 90 - sign(talpha).*acos(1-abs(talpha))*57.3;
%exit(1);
%Gamma

vector1x =  (fcgIx-fcgx);
vector1y =  (fcgIy-fcgy);
vector1z =  (fcgIz-fcgz);

vector2x =  (tcgix-tcgx);
vector2y =  (tcgiy-tcgy);
vector2z =  (tcgiz-tcgz);

magnitude1 =sqrt(vector1x.^2 + vector1y.^2 + vector1z.^2);
magnitude2 =sqrt(vector2x.^2 + vector2y.^2 + vector2z.^2);
product1 = vector1x.*vector2x + vector1y.*vector2y + vector1z.*vector2z;
%gamma = acos(product1./sin(beta));%External-internal rotation 
ga = product1./sin(beta);

for t =1:size(ga,1)
 if (ga(t,1) <= 1) & (ga(t,1) >= -1)    
  gamma(t,1) = (acos(ga(t,1)))*57.3;
 elseif (ga(t,1) > 1)
  gamma(t,1) = -acos(ceil(ga(t,1)) - ga(t,1))*57.3;
 elseif (ga(t,1) < -1)
  gamma(t,1) = 180 + acos(ga(t,1) - ceil(ga(t,1))  )*57.3;     
 end
end 

