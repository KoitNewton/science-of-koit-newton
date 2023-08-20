%We use the constant n approximation:
%fj=3Zj*(sin(GR)-GR*cos(GR))/G^3 where Z=atomic number
%We do iron, with a BCC structure
clear
Z = 26; %Fe number of electrons for the j^th basis atom
lambda=1.0; %lambda in angstroms
a = 2.87; %Lattice constant (Angstroms) Iron (Fe),
%Radius of atom is neareast neighbor distance divided by 2
dnn=sqrt(3)*a/2; %BCC nearest neighbor distance
R=dnn/2; %atom Radius close packing model
thes=(80-0)/400; %angle range
thet =0:thes:80; %angle in degrees
theta = thet*pi/180; %angle in radians
for i = 1:length(theta)
thv=theta(i); if(thv==0), thv=1.e-6; end %prevent theta=0 problems
G = (4.0*pi/lambda)*sin(thv); %reciprocal lattice vector magnitude
fj(i) = 3*Z*(sin(G*R)-(G*R).*cos(G*R))./(G*R).^3; %constant n approx
end
str=cat(2,'Form factor for F_e (Z=26), \lambda=',...
num2str(lambda,'%6.3f'),' Angstroms');
plot(thet,fj,'k')
title (str)
xlabel ('\theta (degrees)')
ylabel ('f_j')