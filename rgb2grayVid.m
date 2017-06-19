function frames=rgb2grayVid(vid)
n = vid.NumberOfFrames;
for i=1:n
    temp = read(vid,i);
    temp = rgb2gray(temp);
    frames(:,:,i) = temp;
end
videoFWriter= vision.VideoFileWriter('vid.avi');
for i=1:n
    step(videoFWriter,frames(:,:,i));
end
release(videoFWriter);
% GrayVid = VideoWriter(fullfile(workingDir,'videos',sprintf('%02d',i)));
% GrayVid.FrameRate = vid.FrameRate;
% open(GrayVid)
% writeVideo(GrayVid,temp);