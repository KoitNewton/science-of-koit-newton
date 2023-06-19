%copyright by J. E Hasbun and T. Datta but corrected by M.Y Cui, now this
%edition is belong to M.Y Cui
%plane_indices.m is changed into plane_indices_cmy.m
%The script's purpose is to visualize a plane whose intercepts
%are provided and shows their relatiosnship to the Miller indices
clear
clc
close all
%function plane_indices
clear
a1=1.0; %axes in angstroms
a2=1.0;
a3=1.0;
alph=90; %angles in degrees
bet =90;
gamm=90;
alpha=(pi/180)*alph; %angles in radians
beta =(pi/180)*bet;
gamma=(pi/180)*gamm;
%Define c1, c2, and c3 to compose the C matrix
c1= a3*cos(beta);
c2= a3*(cos(alpha)-cos(gamma)*cos(beta))/(sin(gamma));
c3= + sqrt((a3^2 - (c1)^2 - (c2)^2));
%plane's intercepts are u*a1, v*a2, w*a3; u, v, w are the coefficients.
%u=6; v=5; w=4; %examples
cI=input('Enter [u,v,w] as a row vector like [6,5,4] -> ');
if isempty(cI), cI=[6,5,4]; end
u=cI(1); v=cI(2); w=cI(3);
loc=[u 0 0
    0 v 0
    0 0 w];
%Conversion matrix
cM =[a1 a2*cos(gamma) c1
     0 a2*sin(gamma) c2
     0 0 c3 ];
%Transformed intercepts
p=cM*loc;
%x, y, z coords of all intercepts
x=p(1,:); y=p(2,:); z=p(3,:);
plot3(x,y,z,'ko','MarkerSize',2,'MarkerFaceColor','w')
view(155,32)
hold on
%The Axes a1, a2, a3 plotted in Cartesian coords
line([0,p(1,1)],[0,p(2,1)],[0,p(3,1)],'Color','b','LineWidth',2)
line([0,p(1,2)],[0,p(2,2)],[0,p(3,2)],'Color','b','LineWidth',2)
line([0,p(1,3)],[0,p(2,3)],[0,p(3,3)],'Color','b','LineWidth',2)
%Vector u*a1+v*a2+w*a3 in Cartesian coords (crystal direction [uvw] from 0)
pmax=max([norm(p(:,1)),norm(p(:,2)),norm(p(:,3))]);
vC=p(:,1)+p(:,2)+p(:,3);
vC=bestDiv(vC,53,10); %vector with smallest integers
vCm=vC*pmax/norm(vC); %For plotting purposes, its size is moderated
h1=line([0,vCm(1)],[0,vCm(2)],[0,vCm(3)],'Color',[0.6 0.3 0],'LineWidth',1.5);
%Now the vector vA perpendicular to the plane: Miller indices (hkl)
sg=sgn(u)*sgn(v)*sgn(w); %tricky trick to get the (hkl) sign right!
v1=p(:,1)-p(:,3); %plane border vectors
v2=p(:,2)-p(:,1);
vA=sg*cross(v1,v2); %v1 X v2 gives a plane perpendicular
%v3=p(:,3)-p(:,2); %can create another border vector for some checking
%vB=sg*cross(v2,v3) %another perpendicular to the plane
%dot(v1,vA) %check: if 0, v1 & vB are perpendicular to each other
%dot(v1,vB) %check: if 0 also for v1 & vB
%We next use prime numbers to find a common divisor, up to number 53,
%to simplify further and plot the perpendicular
vA=bestDiv(vA,53,10); %vector with smallest integers (Miller indices)
pmax=max([norm(p(:,1)),norm(p(:,2)),norm(p(:,3))]);
vAm=vA*pmax/norm(vA); %moderate the size of vA for plotting purposes
h2=line([0,vAm(1)],[0,vAm(2)],[0,vAm(3)],'lineStyle','-.','Color','green','LineWidth',1.5);
%Make the 3-D polygon defined by the vector intercepts with color
h=fill3(p(1,:),p(2,:),p(3,:),[0.75 0.75 0.75]);
set(h,'EdgeAlpha',0.3,'FaceAlpha',0.5) %edges, transparent]
axis equal, hb(1)=xlabel('x'); hb(2)=ylabel('y'); hb(3)=zlabel('z');
%hl=legend('[uvw]','(hkl)');
hl=legend([h1,h2],'[uvw]','(hkl)','Location','northeast');
set(hl,'FontSize',14), set(hb,'FontSize',14)
title(hl,'vector')
ti=' ';
alx=cat(2,', \alpha=',num2str(alph,'%3.1f'),'^\circ');
bex=cat(2,', \beta=' ,num2str(bet ,'%3.1f'),'^\circ');
gax=cat(2,', \gamma=',num2str(gamm,'%3.1f'),'^\circ');
ax=cat(2, ' a1=',num2str(a1,'%4.2f'));
bx=cat(2,', a2=',num2str(a2,'%4.2f'));
cx=cat(2,', a3=',num2str(a3,'%4.2f'));
str1=cat(2,ti,' (',ax,bx,cx,alx,bex,gax,' )');
% ux=cat(2, ' u=',num2str(u,'%4.2f'));
% vx=cat(2,', v=',num2str(v,'%4.2f'));
% wx=cat(2,', w=',num2str(w,'%4.2f'));
ux=cat(2, ' u=',num2str(vC(1),'%4.2f'));
vx=cat(2,', v=',num2str(vC(2),'%4.2f'));
wx=cat(2,', w=',num2str(vC(3),'%4.2f'));
hx=cat(2, ' h=',num2str(vA(1),'%4.2f'));
kx=cat(2,', k=',num2str(vA(2),'%4.2f'));
lx=cat(2,', l=',num2str(vA(3),'%4.2f'));
str2=cat(2,'[',ux,vx,wx,']',', (',hx,kx,lx,')');
title({str1;str2},'FontSize',14)


function y=sgn(x)
%Returns the sign of x. If x=0, the result is > 0.
if(x >= 0.0), y=1.0; else y=-1.0; end
end

function V=bestDiv(V,Np,ipasses)
lV=length(V);
p=primes(Np);
p0=1.0;
for ip=1:ipasses
    p1=p0; %reset p1 and pp
    pp=ones(1,lV);
    for i=1:length(p) %go through the primes
        iflag=1;
        for j=1:lV
            a=round(V(j)*1.e12)/1.e12; %to avoid small decimals
            b=p(i);
            c=mod(a,b);
            if(c==0), pp(j)=p(i); end %keep a divisor if it works
        end
        %If we have a common divisor, all pp should be equal, let's check
        for m=2:lV
            if(pp(m)~=pp(1)), iflag=0; break; end %not found, go to next
        end
        if(pp(1) > p1 && iflag==1), p1=pp(1); end %keep the largest divisor
    end
    V=V/p1;
end

end
%This finds the largest common divisor among the numbers in V
%and returns the simplified V. The idea is based on dividing by
%prime integers until we have such as divisor. Then V is simplified.
%Prime numbers up to NP are used and several passes can be made.
%ipasses=number of passes to make for the simplification in case
%more simplification is possible and is needed
