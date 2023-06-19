%copyright by J. E Hasbun and T. Datta
%unit_cell_BCC.m
%Here we plot the atomic positions for the BCC crystal
%and then plot its conventional and primitive unit cells.
clc
close all
clear 
a=1.0; %lattice constant
%The BCC smallest possible translation vectors
a0=[0;0;0]; a1=a*[1/2;1/2;-1/2]; a2=a*[1/2;-1/2;1/2]; a3=a*[-1/2;1/2;1/2];
a4=a1+a2; a5=a1+a3; a6=a2+a3; a7=a4+a3; %unit cell can be built now
%with 8 corner positions
%and also make some new ones for structure purposes
a8=a1-a2; a9=a1-a3; a10=a2-a3; a11=a4-a3;
a12=2*a1; a13=2*a2; a14=2*a3;
%First eight in T are to construct the primitive cell
T=[a0,a1,a2,a3,a4,a5,a6,a7,-a1,-a2,-a3,a8,a9,a10,a11];
T=[T,-a4,-a5,-a6,-a7,-a8,-a9,-a10,-a11,a12,a13,a14,-a12,-a13,-a14];
%We should identify the cube positions too
b0=[0;0;0]; b1=a*[1;0;0]; b2=a*[0;1;0]; b3=a*[0;0;1];
b4=b1+b2; b5=b1+b3; b6=b2+b3; b7=b4+b3; %To locate cube position atoms
%plus new ones
b8=b1-b2; b9=b1-b3; b10=b2-b3; b11=b4-b3;
b12=2*b1; b13=2*b2; b14=2*b3;
Tb=[b0,b1,b2,b3,b4,b5,b6,b7,-b1,-b2,-b3,b8,b9,b10,b11];
Tb=[Tb,-b4,-b5,-b6,-b7,-b8,-b9,-b10,-b11,b12,b13,b14,-b12,-b13,-b14];
%final T
T=[T,Tb];
%
M=length(T); %number of possible smallest translation vectors
%N=52; %number of atoms desired some are repeated
N=input('Enter the number of atoms to plot (some are repeated) [52] -> ');
if(isempty(N)), N=52; end
%p= atomic positions in the diamond lattice
p0=a*[0;0;0]; %the atoms at the origin
p=zeros(3,N); %define the dimensions of atomic position matrix
jc=0;
for i=0:N-1
    j=mod(i,M); %j can only go from 1 to M
    if(j==0); jc=jc+1; end %counts number of times j goes through 0
    %jc allows for reusage of previously obtained position vectors to
    %which T can be added to obtain new position vectors, etc
    p(:,i+1)=p0+T(:,j+1);
    p0=p(:,jc);
end
rnn=norm(T(:,1)-T(:,2)); %bcc nn distance
x=p(1,:); y=p(2,:); z=p(3,:); %x, y, z coords of all atoms
%draw atoms
plot3(x,y,z,'ko','MarkerSize',6,'MarkerFaceColor','k')
hold on
%Draw bonds between near neighbors only
for i=1:N
    for j=1:N
        if(j ~= i)
            rd=norm(p(:,i)-p(:,j)); %calculate the distance between atoms
                                    %but draw lines between nn only
            if(rd <= rnn)
                line([p(1,i),p(1,j)],[p(2,i),p(2,j)],[p(3,i),p(3,j)],...
                    'Color','b','LineWidth',1);
            end
        end
    end
end
%----------
%The lines below work better here for the primitive cell
line([a0(1),a1(1)],[a0(2),a1(2)],[a0(3),a1(3)],'Color','g','LineWidth',3);
line([a0(1),a2(1)],[a0(2),a2(2)],[a0(3),a2(3)],'Color','g','LineWidth',3);
line([a0(1),a3(1)],[a0(2),a3(2)],[a0(3),a3(3)],'Color','g','LineWidth',3);
line([a1(1),a4(1)],[a1(2),a4(2)],[a1(3),a4(3)],'Color','g','LineWidth',3);
line([a1(1),a5(1)],[a1(2),a5(2)],[a1(3),a5(3)],'Color','g','LineWidth',3);
line([a2(1),a4(1)],[a2(2),a4(2)],[a2(3),a4(3)],'Color','g','LineWidth',3);
line([a2(1),a6(1)],[a2(2),a6(2)],[a2(3),a6(3)],'Color','g','LineWidth',3);
line([a3(1),a5(1)],[a3(2),a5(2)],[a3(3),a5(3)],'Color','g','LineWidth',3);
line([a3(1),a6(1)],[a3(2),a6(2)],[a3(3),a6(3)],'Color','g','LineWidth',3);
line([a4(1),a7(1)],[a4(2),a7(2)],[a4(3),a7(3)],'Color','g','LineWidth',3);
line([a5(1),a7(1)],[a5(2),a7(2)],[a5(3),a7(3)],'Color','g','LineWidth',3);
line([a6(1),a7(1)],[a6(2),a7(2)],[a6(3),a7(3)],'Color','g','LineWidth',3);
%----------
%To show the cube positions too - not so thick lines
rnnb=norm(Tb(:,1)-Tb(:,2)); %cube position nn distances
for i=1:8
    for j=1:8
        if(j ~= i)
            rd=norm(Tb(:,i)-Tb(:,j)); %calculate the distance between atoms
                                      %but draw lines between nn only
            if(rd <= rnnb)
                line([Tb(1,i),Tb(1,j)],[Tb(2,i),Tb(2,j)],[Tb(3,i),Tb(3,j)],...
                'Color','k','LineStyle','-.','LineWidth',2);
            end
        end
    end
end
%Make sure the cube corner atoms appear too
plot3(Tb(1,1:8),Tb(2,1:8),Tb(3,1:8),'ko','MarkerSize',6,'MarkerFaceColor','k')
%----------
view(-156,12) %Angle for viewing purposes
box on
axis equal
xlabel('X'), ylabel('Y'), zlabel('Z')
title('BCC, conventional cell (dashed black), primitive cell (thick blue)')







