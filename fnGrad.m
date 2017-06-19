function [gx,gy,gz] = fnGrad(frames,Qn)
gx=[];
gy=[];
temp=frames(:,:,1);
gz=[temp(:)];
for i=1:Qn
    im=frames(:,:,i);
    temp = circshift(im,[0,1]);
    temp = temp-im;
    temp(:,1)=0;
    gx = [gx,temp(:)];
    temp = circshift(im,[1,0]);
    temp = temp-im;
    temp(1,:)=0;
    gy = [gy,temp(:)];
end
for i=1:Qn-1
    temp=frames(:,:,i+1)-frames(:,:,i);
    gz=[gz,temp(:)];
end
