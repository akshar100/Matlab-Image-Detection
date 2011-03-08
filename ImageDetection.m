imaqreset %reset 
clear all

vidobj = videoinput('winvideo',1); %capture the device handle

set(vidobj, 'FramesPerTrigger',1); % each time we call trigger one frame gets captured
set(vidobj, 'TriggerRepeat',inf); % we can have infinite triggers

triggerconfig(vidobj, 'manual'); % the trigger will be called manually. We can also set times for the same
start(vidobj); % start the device capture
i=1;
n=1;
% get
while 1,
trigger(vidobj); % capture one frame
frame=getdata(vidobj); % frame is a matrix that stores the frame
bw = rgb2gray(frame);
bw = im2bw(bw,0.27);
bw = wiener2(bw,[12 12]);
bw = wiener2(bw,[12 12]);
bw = wiener2(bw,[12 12]);

BW=bw;
%imshow(bw);
[B,L,N,A] = bwboundaries(BW,'holes');
imshow(frame); 
hold on;
colors=['b' 'g' 'r' 'c' 'm' 'y'];
for k=2:length(B)
    
        boundary = B{k};
        cidx = mod(k,length(colors))+1;
        plot(boundary(:,2), boundary(:,1),colors(cidx),'LineWidth',2);
        row = boundary(1,1)+10;
        col = boundary(1,2)+25;
        
        h = text(col+1, row-1, [num2str(row) ',' num2str(col)]);
        set(h,'Color',colors(cidx),'FontSize',14,'FontWeight','bold');
        
        if row < 220
            'go ahead'
        elseif row > 260
            'go back'
        elseif col>380
            'go right'
        elseif col<320
            'go left'
        else
            'stop'
        end
       break;
        
        
        
end




n = n + 1;
if(n>200000),% we are cpatuing total of 300 frames 
stop(vidobj); % never forget to close the device handle
break;
end
end
i=i+1;
