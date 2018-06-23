
%Written by Dr Corneliu T.C. Arsene
%Date 12.08.2009



%function [alphav] = uncerpasl1


global alphav;
global betav;
global gammav;

global alphapfv;
global gammapfv;
global mlpsv;

index = 1;
ii =0;

for i =1:1 %assuming that you have only one deterministic simulation so i = 1  
  %if (i ~= 1)&(i ~= 2)&(i ~= 12)&(i ~= 18)&(i ~= 24)&(i ~= 25)&(i ~= 26)&(i ~= 27)&(i ~= 33)&(i ~= 58)&(i ~= 64)                           
  %if (i ~= 1)&(i ~= 9)&(i ~= 11)&(i ~= 58)&(i ~= 24)&(i ~= 17)&(i ~= 64)&(i ~= 25)&(i ~= 26)&(i ~= 27)&(i ~= 28)&(i ~= 33)                           
  % if (i ~= 16)&(i ~= 26)&(i ~= 42)&(i ~= 73)&(i ~= 33)&(i ~= 112) 
  %if (i ~= 1)&(i ~= 36)&(i ~= 47)&(i ~= 54)&(i ~= 79)&(i ~= 87)&(i ~= 116)&(i ~= 130)&(i ~= 134)&(i ~= 162)&(i ~= 180)&(i ~= 182)&(i ~= 190)&(i ~= 197)&(i ~= 199)&(i ~= 207)&(i ~= 208)
   %if (i ~= 26)&(i ~= 42)&(i ~= 73)&(i ~= 33)  
  %if (i ~= 1)&(i ~= 47)&(i ~= 54)&(i ~= 87)&(i ~=116)&(i ~= 130)&(i ~=134)&(i ~= 145)&(i ~= 180)&(i ~= 190)&(i ~= 199)&(i ~= 207)
  %if (i ~= 1)&(i ~= 54)&(i ~= 87)&(i ~=116)&(i~=134)&(i ~= 199)&(i ~= 207)
  
  %if (i ~= 1)&(i ~= 36)&(i ~= 47)&(i ~= 54)&(i ~= 87)&(i ~= 116)&(i ~= 134)&(i ~= 199)&(i ~= 207)
  %if (i ~= 1)&(i ~= 47)&(i ~= 54)&(i ~= 87)&(i ~=116)&(i ~= 130)&(i ~=134)&(i ~= 145)&(i ~= 180)&(i ~= 190)&(i ~= 199)&(i ~= 207)  

  %if (i ~= 1)&(i ~= 47)&(i ~= 54)&(i ~= 66)&(i ~= 79)&(i ~= 87)&(i ~=116)&(i ~= 130)&(i ~=134)&(i ~= 145)&(i ~= 180)&(i ~= 182)&(i ~= 190)&(i ~= 199)&(i ~= 207)       
   str1 = i; 
   
   
   %readinput;%reads data input  
   
   %[alpha,beta,gamma,medlat,anttib] = anglesn(str1);% calculates the angles and the displacements of interest for the tibial-femoral component
   [alphapf,gammapf,productq4] = anglespf(str1);%calculates the angles and the displacements of interest for the patella-femoral component
   

   %if (i ~=7) & (i ~=11) & (i ~=26) & (i ~=49) & (i ~=50) & (i ~=76) &  (i ~=92)    
   %if fid ~= -1 %if the deterministic simulation was ok and you have output file then  
                %prepare to plot 
                i;
       ii = ii+1;
       %betav(:,index) = beta;%Abduction-adduction angle 
       %alphav(:,index) = alpha;%Flexion angle
       %gammav(:,index) = gamma;%External-internal rotation 
       %medlatv(:,index) = medlat;%Medial-lateral tibial thrust
       %anttibv(:,index) = anttib;%Anterior tibial drawer displacement

       alphapfv(:,index) = alphapf;
       gammapfv(:,index) = gammapf;
       mlpsv(:,index) =  productq4;
       
       keepind(index,1) = index;
       keepind(index,2) = ii;
       index = index+1;
   %else
       ii;
       
   %end  
% end    
end


