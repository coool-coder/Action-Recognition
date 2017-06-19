%  1) reading target and querry video into frames
%  2) converting them to gray scale video  
%  3) converting the target video into short clips of size similar to
%     querry video
%  4) Making Qn(window size) odd or local analysis window size odd
%  5) computing weigths of each of the frames or computing 3D-LSK for each of
%     the frames.
%%
Q_vid = VideoReader('Beach_walk1_template.avi'); %querry video
Q_frames = rgb2grayVid(Q_vid);   % converting colour video to gray-scale video
%clear Q_vid
% Q_vid = VideoReader('vid.avi');
% Q_frames = read(Q_vid);
Qn = 7; 
n=Q_vid.NumberOfFrames;
%delete vid.avi

%%
T_vid = VideoReader('Beach_data.avi'); % Target video
T_frames = rgb2grayVid(T_vid);   % converting colour video to gray-scale video
% clear T_vid
% T_vid = VideoReader('vid.avi');
% T_frames = read(T_vid);
Tn = T_vid.NumberOfFrames;
%%
Q_wt=[];
for i=1:4:(n-2*Qn)
    temp = Q_frames(:,:,i:i+2*Qn-1);
    Q_wt=[Q_wt,WeightKernel(Q_frames,Qn,i)];
end


%%
T_wt=[];
for i=1:4:(Tn-2*Qn)
    i
    temp = T_frames(:,:,i:i+2*Qn-1);
    T_wt=[T_wt,WeightKernel(temp,Qn,i)];
end
