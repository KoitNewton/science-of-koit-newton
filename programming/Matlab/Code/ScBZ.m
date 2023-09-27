%ScBZ.m
%Draws the Brillouin zone for the simple cubic and its irreducible
%tetrahedron and calculates the volume.
%Vectors in units of 2*pi/a
%
function ScBZ
clear
clc
Z=[0,0,0]; %zero point (gamma) - origin
X=[1/2,0,0]; %high symmetry points X, R, M
R=[1/2,1/2,1/2];
M=[1/2,1/2,0];
VSC=abs(dot(X,cross(R,M))/6); %tetrahedron volume
disp('============ Simple Cubic ==============')
fprintf('SC: irreducible V=%s%s\n',rats(VSC),' of BZ volume')
disp('SC symmetry points (in units of 2*pi/a):')
disp('X=[1/2,0,0], R=[1/2,1/2,1/2], M=[1/2,1/2,0]')
disp('Known SC BZ volume: (2*pi/a)^3')
view(150,20) %viewpoint longitude, latitude
grid on %show a grid
%Begin the tetrahedron
liner(Z,X,'-','k',1.0) %lines to symmetry points
liner(Z,R,'-','k',1.0)
liner(Z,M,'-','k',1.0)
liner(X,R,'-','k',1.0)
liner(X,M,'-','k',1.0)
liner(R,M,'-','k',1.0)
hold on %Begin to fill tetrahedron faces
x = [0;X(1);R(1);]; y=[0;X(2);R(2);]; z=[0;X(3);R(3);];
setter(x,y,z,[0.70 0.60 0.70],0.3,0.5)
x = [0;X(1);M(1);]; y=[0;X(2);M(2);]; z=[0;X(3);M(3);];
setter(x,y,z,[0.70 0.60 0.70],0.3,0.5)
x = [0;R(1);M(1);]; y=[0;R(2);M(2);]; z=[0;R(3);M(3);];
setter(x,y,z,[0.70 0.60 0.70],0.3,0.5)
x = [X(1);R(1);M(1);]; y=[X(2);R(2);M(2);]; z=[X(3);R(3);M(3);];
setter(x,y,z,[0.70 0.60 0.70],0.3,0.5)
text(Z(1),Z(2),Z(3),'\Gamma','FontSize',18)
text(X(1),X(2),X(3),'X','FontSize',14)
text(R(1),R(2),R(3),'R','FontSize',14)
text(M(1),M(2),M(3),'M','FontSize',14)
title('SC BZ & irreducible Brillouin Zone in units of 2\pi/a')
%SC BZ next.
%Corners to which lines will be drawn
c1=[1/2,1/2,1/2]; c2=[-1/2,1/2,1/2]; c3=[-1/2,-1/2,1/2]; c4=[1/2,-1/2,1/2];
c5=[1/2,1/2,-1/2]; c6=[-1/2,1/2,-1/2]; c7=[-1/2,-1/2,-1/2];
c8=[1/2,-1/2,-1/2];
liner(c1,c2,'-','b',1.0) %c1 top corner connectors
liner(c1,c4,'-','b',1.0)
liner(c1,c5,'-','b',1.0)
liner(c2,c6,'-','b',1.0) %c2 top corner connectors
liner(c2,c3,'-','b',1.0)
liner(c3,c4,'-','b',1.0) %c3 top corner connectors
liner(c3,c7,'-','b',1.0)
liner(c5,c6,'-','b',1.0) %c5 bottom corner connectors
liner(c5,c8,'-','b',1.0)
liner(c7,c6,'-','b',1.0) %c7 bottom corner connectors
liner(c7,c8,'-','b',1.0)
liner(c8,c4,'-','b',1.0) %c8 bottom corner connectors
hold off
axis equal %helps to make the cube look like it
xlabel('k_x'), ylabel('k_y'), zlabel('k_z')
function liner(v1,v2,lin_style_txt,lin_color_txt,lin_width_num)
%Draws a line given initial vector v1 and final vector v2
%lin_style_txt: line style text format
%lin_color_txt: line color text format
%lin_width_num: line width number format
line([v1(1),v2(1)],[v1(2),v2(2)],[v1(3),v2(3)],...
'LineStyle',lin_style_txt,'color',...
lin_color_txt,'linewidth',lin_width_num)
function setter(x,y,z,v,Edge_num,Face_num)
%fills a polygon according to coords x,y,z vectors
%v is a color vector like v=[0.70 0.70 0.40] for example
%Edge_num is a number like 0.3, and Face_num is also a number like 0.5
h=fill3(x,y,z,v); %fill face
set(h,'EdgeAlpha',Edge_num,'FaceAlpha',Face_num) %edges, transparent
