clear;
clc

vid= videoinput('winvideo',1,'YUY2_320x240');
% Set the properties of the video object
set(vid, 'FramesPerTrigger', Inf);
set(vid, 'ReturnedColorspace', 'rgb')
vid.FrameGrabInterval = 5;
preview(vid)
pause(2)
ser=serial('COM5'); % Set COM port
fopen(ser)

while(1)

   rgb = getsnapshot(vid);
   %rgb=imread('1.bmp');
   %imview(rgb)
   [a b c]=size(rgb);
   

   rgb1=rgb(,,1); 
   rgb2=rgb(,,2);
   rgb3=rgb(,,3);
 y=a;
 x=b;
   for m=1a
       for n=1b
           if (rgb1(m,n)230 && rgb2(m,n)180 && rgb3(m,n)100) % Set threshold 
               I(m,n)=1;
           else
               I(m,n)=0;
           end
      end
   end

%imview(I)


KIM=I;
%imview(KIM)

for ikim=1240
	for jkim=1320
		if (KIM(ikim,jkim)0)
			KIM(ikim,jkim)=1;
		end
	end
end


KIM_1=0;
KIM_2=0;
KIM_3=0;
KIM_4=0;
KIM_5=0;
KIM_6=0;
KIM_7=0;
KIM_8=0;
KIM_9=0;

%%%%%%%%%%
for i1=180
	for j1=1110
		KIM_1=KIM_1 + KIM(i1,j1);
	end
end

for i2=81160
	for j2=1110
		KIM_2=KIM_2 + KIM(i2,j2);
	end
end

for i3=161240
	for j3=1110
		KIM_3=KIM_3 + KIM(i3,j3);
	end
end



%%%%%%%%%%%%%%
for i4=180
	for j4=111210
		KIM_4=KIM_4 + KIM(i4,j4);
	end
end

for i5=81160
	for j5=111210
		KIM_5=KIM_5 + KIM(i5,j5);
	end
end

for i6=161240
	for j6=111210
		KIM_6=KIM_6 + KIM(i6,j6);
	end
end

%%%%%%%%%%%%%%
for i7=180
	for j7=211320
		KIM_7=KIM_7 + KIM(i5,j7);
	end
end

for i8=81160
	for j8=211320
		KIM_8=KIM_8 + KIM(i8,j8);
	end
end

for i9=161240
	for j9=211320
		KIM_9=KIM_9 + KIM(i9,j9);
	end
end



%disp(KIM_1);
%disp(KIM_2);
%disp(KIM_3);

%disp(KIM_4);
%disp(KIM_5);
%disp(KIM_6);

%disp(KIM_7);
%disp(KIM_8);
%disp(KIM_9);

if((KIM_1KIM_2)&&(KIM_1KIM_3)&&(KIM_1KIM_4)&&(KIM_1KIM_5)&&(KIM_1KIM_6)&&(KIM_1KIM_7)&&(KIM_1KIM_8)&&(KIM_1KIM_9))
	fprintf(ser,'1'); 
end

if((KIM_2KIM_1)&&(KIM_2KIM_3)&&(KIM_2KIM_4)&&(KIM_2KIM_5)&&(KIM_2KIM_6)&&(KIM_2KIM_7)&&(KIM_2KIM_8)&&(KIM_2KIM_9))
	fprintf(ser,'2');
end

if((KIM_3KIM_1)&&(KIM_3KIM_2)&&(KIM_3KIM_4)&&(KIM_3KIM_5)&&(KIM_3KIM_6)&&(KIM_3KIM_7)&&(KIM_3KIM_8)&&(KIM_3KIM_9))
	fprintf(ser,'3');
end

if((KIM_4KIM_1)&&(KIM_4KIM_2)&&(KIM_4KIM_3)&&(KIM_4KIM_5)&&(KIM_4KIM_6)&&(KIM_4KIM_7)&&(KIM_4KIM_8)&&(KIM_4KIM_9))
	fprintf(ser,'4');
end

if((KIM_5KIM_1)&&(KIM_5KIM_2)&&(KIM_5KIM_3)&&(KIM_5KIM_4)&&(KIM_5KIM_6)&&(KIM_5KIM_7)&&(KIM_5KIM_8)&&(KIM_5KIM_9))
	fprintf(ser,'5');
end

if((KIM_6KIM_1)&&(KIM_6KIM_2)&&(KIM_6KIM_3)&&(KIM_6KIM_4)&&(KIM_6KIM_5)&&(KIM_6KIM_7)&&(KIM_6KIM_8)&&(KIM_6KIM_9))
	fprintf(ser,'6');
end

if((KIM_7KIM_1)&&(KIM_7KIM_2)&&(KIM_7KIM_3)&&(KIM_7KIM_4)&&(KIM_7KIM_5)&&(KIM_7KIM_6)&&(KIM_7KIM_8)&&(KIM_7KIM_9))
	fprintf(ser,'7');
end

if((KIM_8KIM_1)&&(KIM_8KIM_2)&&(KIM_8KIM_3)&&(KIM_8KIM_4)&&(KIM_8KIM_5)&&(KIM_8KIM_6)&&(KIM_8KIM_7)&&(KIM_8KIM_9))
	fprintf(ser,'8');
end

if((KIM_9KIM_1)&&(KIM_9KIM_2)&&(KIM_9KIM_3)&&(KIM_9KIM_4)&&(KIM_9KIM_5)&&(KIM_9KIM_6)&&(KIM_9KIM_7)&&(KIM_9KIM_8))
	fprintf(ser,'9');
end

end



fclose(ser)