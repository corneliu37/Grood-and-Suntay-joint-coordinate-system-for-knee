

%Written by Dr Corneliu T.C. Arsene
%Date 12.08.2009


%function [fcgx,fcgy,fcgz,fcgIx,fcgIy,fcgIz,fcgJx,fcgJy,fcgJz,fcgKx,fcgKy,fcgKz,tcgx,tcgy,tcgz,tcgix,tcgiy,tcgiz,tcgkx,tcgky,tcgkz] = readinput(str1)
function  [pKx,pKy,pKz,pJx,pJy,pJz,pIx,pIy,pIz,pcx,pcy,pcz,fcgx,fcgy,fcgz,fcgIx,fcgIy,fcgIz,fcgJx,fcgJy,fcgJz,fcgKx,fcgKy,fcgKz,tcgx,tcgy,tcgz,tcgix,tcgiy,tcgiz,tcgkx,tcgky,tcgkz] = readinput(str1)


signal =0;
signal1 =0;

indexk1 =1;
indexk2 =1;
indexk3 =1;
indexk4 =1;
indexk5 =1;
indexk6 =1;
indexk7 =1;
indexk8 =1;
indexk9 =1;
indexk10 =1;
indexk11 =1;
indexk12 =1;
indexk13 =1;
indexk14 =1;
indexk15 =1;

indexk16 =1;
indexk17 =1;
indexk18 =1;
indexk19 =1;
indexk20 =1;
indexk21 =1;


indexk22 = 1;  
indexk23 = 1;  
indexk24 = 1;  
indexk25 = 1;  
indexk26 = 1;  
indexk27 = 1;  
indexk28 = 1;  
indexk29 = 1;  
indexk30 = 1;  
indexk31 = 1;  
indexk32 = 1;  
indexk33 = 1;  

for h=1:33%I have 33 files that I read in which I saved during the FE simulation the data from bellow
    
    %femur_COG_I_X - means the X coordinate of the I point which defines
    %a coordinate system together with points J and K with respect to the
    %center of gravity of the femoral component 
   
    %femur_COG_X - means the X coordinate of the center of gravity of the
    %femoral component which together with points I, J , K forms a sort of
    %local coordinate system attached to femoral component 
    
    %similar points for the patella and tibial component
    
  k =1;
  if h ==1  
   str = sprintf('femur_COG_I_X_%d',str1);   
   fid = fopen(str,'r');  
  elseif h ==2
   str = sprintf('femur_COG_I_Y_%d',str1);   
   fid = fopen(str,'r');  
  elseif h ==3     
   str = sprintf('femur_COG_I_Z_%d',str1);   
   fid = fopen(str,'r');  
  elseif h ==4    
   str = sprintf('femur_COG_J_X_%d',str1);   
   fid = fopen(str,'r');  
  elseif h ==5
   str = sprintf('femur_COG_J_Y_%d',str1);   
   fid = fopen(str,'r');  
  elseif h ==6
   str = sprintf('femur_COG_J_Z_%d',str1);   
   fid = fopen(str,'r'); 
  elseif h ==7
   str = sprintf('femur_COG_K_X_%d',str1);   
   fid = fopen(str,'r'); 
  elseif h ==8
   str = sprintf('femur_COG_K_Y_%d',str1);   
   fid = fopen(str,'r'); 
  elseif h ==9
   str = sprintf('femur_COG_K_Z_%d',str1);   
   fid = fopen(str,'r'); 
  elseif h ==10
   str = sprintf('tibia_COG_i_X_%d',str1);   
   fid = fopen(str,'r'); 
  elseif h ==11
   str = sprintf('tibia_COG_i_Y_%d',str1);   
   fid = fopen(str,'r'); 
  elseif h ==12
   str = sprintf('tibia_COG_i_Z_%d',str1);   
   fid = fopen(str,'r'); 
  elseif h ==13
   str = sprintf('tibia_COG_k_X_%d',str1);   
   fid = fopen(str,'r'); 
  elseif h ==14
   str = sprintf('tibia_COG_k_Y_%d',str1);   
   fid = fopen(str,'r'); 
  elseif h ==15
   str = sprintf('tibia_COG_k_Z_%d',str1);   
   fid = fopen(str,'r'); 
  elseif h ==16
   str = sprintf('tibia_COG_X_%d',str1);   
   fid = fopen(str,'r'); 

  elseif h ==17
   str = sprintf('tibia_COG_Y_%d',str1);   
   fid = fopen(str,'r'); 
  elseif h ==18
   str = sprintf('tibia_COG_Z_%d',str1);   
   fid = fopen(str,'r'); 
  elseif h ==19
   str = sprintf('femur_COG_X_%d',str1);   
   fid = fopen(str,'r'); 
  elseif h ==20
   str = sprintf('femur_COG_Y_%d',str1);   
   fid = fopen(str,'r'); 
  elseif h ==21
   str = sprintf('femur_COG_Z_%d',str1);   
   fid = fopen(str,'r'); 
  elseif h ==22
   str = sprintf('patella_COG_X_%d',str1);   
   fid = fopen(str,'r'); 
  elseif h ==23
   str = sprintf('patella_COG_Y_%d',str1);   
   fid = fopen(str,'r'); 
  elseif h ==24
   str = sprintf('patella_COG_Z_%d',str1);   
   fid = fopen(str,'r'); 
  elseif h ==25
   str = sprintf('patella_I_X_%d',str1);   
   fid = fopen(str,'r'); 
  elseif h ==26
   str = sprintf('patella_I_Y_%d',str1);   
   fid = fopen(str,'r'); 
  elseif h ==27
   str = sprintf('patella_I_Z_%d',str1);   
   fid = fopen(str,'r'); 
  elseif h ==28
   str = sprintf('patella_J_X_%d',str1);   
   fid = fopen(str,'r'); 
  elseif h ==29
   str = sprintf('patella_J_Y_%d',str1);   
   fid = fopen(str,'r'); 
  elseif h ==30
   str = sprintf('patella_J_Z_%d',str1);   
   fid = fopen(str,'r'); 
  elseif h ==31
   str = sprintf('patella_K_X_%d',str1);   
   fid = fopen(str,'r'); 
  elseif h ==32
   str = sprintf('patella_K_Y_%d',str1);   
   fid = fopen(str,'r'); 
  elseif h ==33
   str = sprintf('patella_K_Z_%d',str1);   
   fid = fopen(str,'r'); 

   
  end    
      
  if fid ~= -1 
 
      for i=1:9
         tline = fgetl(fid);
      end  
      %C = textscan(fid, '%s %s %f32 %d8 %u %f %f %s');
      for j=1:1
         C = textscan(fid, ' %f32 %f32');
      end 
      fclose(fid);
     
           if h ==1
              fcgIx(:,indexk1) = C{2};    
              indexk1 = indexk1 +1;
           elseif h == 2
              fcgIy(:,indexk2) = C{2} ;    
              indexk2 = indexk2 +1;
           elseif h == 3
              fcgIz(:,indexk3) = C{2} ;                   
              indexk3 = indexk3 +1;              
           elseif h == 4    
              fcgJx(:,indexk4) = C{2} ;    
              indexk4 = indexk4 +1;
           elseif h == 5    
              fcgJy(:,indexk5) = C{2} ;                   
              indexk5 = indexk5 +1;              
           elseif h == 6
              fcgJz(:,indexk6) = C{2} ;    
              indexk6 = indexk6 +1;              
           elseif h == 7
              fcgKx(:,indexk7) = C{2} ;    
              indexk7 = indexk7 +1;              
           elseif h == 8
              fcgKy(:,indexk8) = C{2} ;    
              indexk8 = indexk8 +1;              
           elseif h == 9
              fcgKz(:,indexk9) = C{2} ;    
              indexk9 = indexk9 +1;              
           elseif h == 10
              tcgix(:,indexk10) = C{2} ;    
              indexk10 = indexk10 +1;              
           elseif h == 11
              tcgiy(:,indexk11) = C{2} ;    
              indexk11 = indexk11 +1;              
           elseif h == 12
              tcgiz(:,indexk12) = C{2} ;    
              indexk12 = indexk12 +1;              
           elseif h == 13
              tcgkx(:,indexk13) = C{2} ;    
              indexk13 = indexk13 +1;              
           elseif h == 14
              tcgky(:,indexk14) = C{2} ;    
              indexk14 = indexk14 +1;              
           elseif h == 15
              tcgkz(:,indexk15) = C{2} ;    
              indexk15 = indexk15 +1;  
              
           elseif h == 16
              %size(C{2}) 
              %size(tcgx)
              tcgx(:,indexk16) = C{2} ;    
              indexk16 = indexk16 +1;    
              
           elseif h == 17
              tcgy(:,indexk17) = C{2} ;    
              indexk17 = indexk17 +1;              
           elseif h == 18
              tcgz(:,indexk18) = C{2} ;    
              indexk18 = indexk18 +1;              
           elseif h == 19
              fcgx(:,indexk19) = C{2} ;    
              indexk19 = indexk19 +1;              
           elseif h == 20
              fcgy(:,indexk20) = C{2} ;    
              indexk20 = indexk20 +1;              
           elseif h == 21
              fcgz(:,indexk21) = C{2} ;    
              indexk21 = indexk21 +1;  
           elseif h == 22
              pcx(:,indexk22) = C{2} ;    
              indexk22 = indexk22 +1;                
           elseif h == 23
              pcy(:,indexk23) = C{2} ;    
              indexk23 = indexk23 +1;  
           elseif h == 24
              pcz(:,indexk24) = C{2} ;    
              indexk24 = indexk24 +1;  
           elseif h == 25
              pIx(:,indexk25) = C{2} ;    
              indexk25 = indexk25 +1;                
           elseif h == 26
              pIy(:,indexk26) = C{2} ;    
              indexk26 = indexk26 +1;           
           elseif h == 27
              pIz(:,indexk27) = C{2} ;    
              indexk27 = indexk27 +1;  
           elseif h == 28
              pJx(:,indexk28) = C{2} ;    
              indexk28 = indexk28 +1;                
           elseif h == 29
              pJy(:,indexk29) = C{2} ;    
              indexk29 = indexk29 +1;                
           elseif h == 30
              pJz(:,indexk30) = C{2} ;    
              indexk30 = indexk30 +1;  
          elseif h == 31
              pKx(:,indexk31) = C{2} ;    
              indexk31 = indexk31 +1;                
          elseif h == 32
              pKy(:,indexk32) = C{2} ;    
              indexk32 = indexk32 +1;                
          elseif h == 33
              pKz(:,indexk33) = C{2} ;    
              indexk33 = indexk33 +1;                
              
           end    
        %end 
      %end    
   else
     signal1 = signal1 +1  ;
     str;

     fcgIx(:,indexk1) = 0;    
     fcgIy(:,indexk2) = 0 ;    
     fcgIz(:,indexk3) = 0 ;                   
     fcgJx(:,indexk4) = 0 ;    
     fcgJy(:,indexk5) = 0 ;                   
     fcgJz(:,indexk6) = 0 ;    
     fcgKx(:,indexk7) = 0 ;    
     fcgKy(:,indexk8) = 0 ;    
     fcgKz(:,indexk9) = 0 ;    
     tcgix(:,indexk10) = 0 ;    
     tcgiy(:,indexk11) = 0 ;    
     tcgiz(:,indexk12) = 0 ;    
     tcgkx(:,indexk13) = 0 ;    
     tcgky(:,indexk14) = 0 ;    
     tcgkz(:,indexk15) = 0 ;    
     tcgx(:,indexk16) = 0 ;    
     tcgy(:,indexk17) = 0 ;    
     tcgz(:,indexk18) = 0 ;    
     fcgx(:,indexk19) = 0 ;    
     fcgy(:,indexk20) = 0 ;    
     fcgz(:,indexk21) = 0 ;    
     pcx(:,indexk22) = 0 ;    
     pcy(:,indexk23) = 0 ;    
     pcz(:,indexk24) = 0 ;    
     pIx(:,indexk25) = 0 ;    
     pIy(:,indexk26) = 0 ;    
     pIz(:,indexk27) = 0 ;    
     pJx(:,indexk28) = 0 ;    
     pJy(:,indexk29) = 0 ;    
     pJz(:,indexk30) = 0 ;    
     pKx(:,indexk31) = 0 ;    
     pKy(:,indexk32) = 0 ;    
     pKz(:,indexk33) = 0 ;    
     
              
     %break;
     %fclose(fid);
   end    
end







