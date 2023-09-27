%for the BCC structure.
clear
%BCC - cubic crystal vectors used here
a = 2.87; %Lattice constant (Angstroms) Iron (Fe),
a1=a*[1,0,0]; %using the cubic cell vectors
a2=a*[0,1,0];
a3=a*[0,0,1];
%A=[h,k,l]; %the Miller indices, avoid zeros and infinities
A=input('Enter [h,k,l] as a row vector [2,2,2] -> ');
if isempty(A), A=[2,2,2]; end
h=A(1); k=A(2); l=A(3);
fprintf('[h,k,l]=[%6.3f,%6.3f,%6.3f ]\n',h,k,l)
%Reciprocal lattice vectors follow
Vt=dot(a1,cross(a2,a3)); %system's unit cell volume
b1=2*pi*cross(a2,a3)/Vt;
b2=2*pi*cross(a3,a1)/Vt;
b3=2*pi*cross(a1,a2)/Vt;
G_v=h*b1+k*b2+l*b3; %reciprocal lattice vector
G_m=norm(G_v); %magnitude of G
G_hat=G_v/G_m; %getting the G unit vector
%fprintf('G_hat=[%6.3f,%6.3f,%6.3f ]\n',G_hat)
d=2*pi/G_m; %plane distance
lambda=d/3; %lambda in angstroms as used here
themin=0; themax=80; %angle range
%
thes=(themax-themin)/400;
thet =themin:thes:themax; %angle in degrees
theta = thet*pi/180; %angle in radians
Z = 26; %Fe number of electrons for the j^th basis atom
%Radius of atom is neareast neighbor distance divided by 2
%for the BCC dnn=sqrt(3)a/2.
dnn=sqrt(3)*a/2; %BCC nearest neighbor distance
R =dnn/2; %atom Radius close packing model
N=50; %number of cells used in getting Rh, Rk, Rl below
Ga1=dot(G_hat,a1);
Ga2=dot(G_hat,a2);
Ga3=dot(G_hat,a3);
%basis atoms (BCC)
nb=2;
rb(1,:)=a*[0 0 0];
rb(2,:)=a*[1 1 1]/2;
%dot products of G_hat with the basis vectors
for j=1:nb
    Gb(j)=dot(G_hat,rb(j,:));
end
for i = 1:length(theta)
    %G = 2*k*sin(theta) where k is equal to 2*pi/lambda
    thv=theta(i); if(thv==0), thv=1.e-6; end %prevent theta=0 problems
    G = (4.0*pi/lambda)*sin(thv);
    fj(i) = 3*Z*(sin(G*R)-(G*R).*cos(G*R))./(G*R).^3; %constant n approx
    %G.a1/2, G.a2/2, G.a3/2 follow. The Laue condition is
    %G.a_i/2=pi*s_i. where a_i=a1, a2, a3, and s_i=h,k,l, for i=1,2,3.
    %Thus we need G*Ga_i/2/s_i=pi. This means that whenever
    %G*Ga_i/2/s_i=pi we get Bragg peaks. We divide by that factor to
    %work with the Laue condition.
    betA=G*Ga1/2.0/h;
    betB=G*Ga2/2.0/k;
    betC=G*Ga3/2.0/l;
    denoA=sin(betA);
    denoB=sin(betB);
    denoC=sin(betC);
    %If the denominator=0, sin(N*0)/sin(0)->N
    Rh(i)=N; Rk(i)=N; Rl(i)=N;
    if(abs(denoA) >= 1.e-6), Rh(i)=sin(N*betA)/denoA; end
    if(abs(denoB) >= 1.e-6), Rk(i)=sin(N*betB)/denoB; end
    if(abs(denoC) >= 1.e-6), Rl(i)=sin(N*betC)/denoC; end
    %structure factor
    %This way of calculating SG, it takes out reflections
    %from BCC planes for which h+k+l odd. However, for this to happen
    %G has to be the right magnitude such that G*Gb(j)=pi*(h+k+l)
    %in which case exp(-zim*G*Gb(j))=-1 which cancels the the
    %exp(0)=1 term producing zero reflection at that angle.
    SG(i)=0.0;
    zim=complex(0,1);
    for j=1:nb
        SG(i)=SG(i)+fj(i)*exp(-zim*G*Gb(j));
    end
end
str=cat(2,'Form factor for F_e (Z=26), \lambda=',...
    num2str(lambda,'%6.3f'),' Angstroms');
plot(thet,fj,'k')
title (str)
xlabel ('\theta (degrees)')
ylabel ('f_j')
%Structure Factor & Intensity BCC lattice - Note for iron fj is the same
%for each atom (BCC: 2 atom basis)
I0=abs(Rh.*Rk.*Rl).^2; %lattice sum intensity
SG=abs(SG).^2;
figure
plot(thet,SG,'k') %structure factor vs theta
axis([0 max(thet) 0 1])
str=cat(2,' BCC F_e (Z=26), [a, d, \lambda]=[',...
    num2str(a,' %6.3f'),', ',num2str(d,'%6.3f'),', ',...
    num2str(lambda,'%6.3f'),'] Angs, (hkl)=(',num2str(h,'%4.0f'),...
    ' ',num2str(k,'%4.0f'),' ',num2str(l,'%4.0f'),')');
title (str)
xlabel ('\theta (degrees)')
ylabel ('Structure Factor')
%
figure
I=SG.*I0; %intensity at detector vs theta
plot(thet,I,'k')
axis([0 max(thet) 0 1E9])
str=cat(2,' BCC F_e (Z=26), [a, d, \lambda]=[',...
num2str(a,' %6.3f'),', ',num2str(d,'%6.3f'),', ',...
num2str(lambda,'%6.3f'),'] Angs, (hkl)=(',num2str(h,'%4.0f'),...
' ',num2str(k,'%4.0f'),' ',num2str(l,'%4.0f'),')');
title (str)
xlabel ('\theta (degrees)')
ylabel ('Calculated Bragg Peak Intensity')
