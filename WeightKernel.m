function Wt=WeightKernel(frames,Qn,iter)
% iter is to start the iterations from the iter of new frame and used in allocating the point xl
[m,n,~] = size(frames);

Wt=[];
h=1.6;
st=(Qn+1)/2;
st
w=(st-1)+iter;  % w = st,st+4,st+8.....;
w
for i=st:4:m-(Qn+st)+1
    for j=st:4:n-(Qn+st)+1      
        i
        j
        temp = frames(i:i+Qn-1,j:j+Qn-1,w:w+Qn-1);
        size(temp)
        xi=[i+st;j+st;w+st];
        ker=zeros(size(temp));
        count = 0;
         t=1;
        for lt=w:w+Qn-1
           x=1;
            for lx=i:i+Qn-1
                y=1;
                for ly=j:j+Qn-1
                    
                    it=lx-st+1;
                    jt=ly-st+1;
                    kt=lt-st+1;
                                       
                    xltemp=frames(it:it+Qn-1,jt:jt+Qn-1,kt:kt+Qn-1);
%                     s=size(xltemp);
                    xltemp=double(xltemp)/255;
                    [gx,gy,gz]=fnGrad(double(xltemp),Qn);
                    Jl  = [gx(:),gy(:),gz(:)];
                    Cl = double(Jl')*double(Jl);  % covariance matrix
                    sub=([lx;ly;lt]-xi);
%                     sq=sqrt(det(Cl))
                    tt=sub'*Cl*sub;
%                     e=(-0.5/h^2)*tt;
                    ker(x,y,t)=sqrt(det(Cl))*exp((-0.5/h^2)*tt);
                    y=y+1;
                    count=count+1;
                end
                x=x+1;
            end
            t=t+1;
        end
        count
        figure,
        for va=1:7
            subplot(3,3,va),imagesc(ker(:,:,va));
        end
        s=sum(ker(:));
        ker=ker./s;
        Wt=[Wt,ker(:)];
    end
    
end

