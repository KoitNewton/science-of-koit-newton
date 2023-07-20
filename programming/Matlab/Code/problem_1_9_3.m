clear
x1=0.0; y1=0.0; x2=1.0; y2=0.0;  %inputs
p1=[x1;y1]; p2=[x2;y2];          %original points
p0=(p1+p2)/2.;                   %point midway between p1,p2
r1=norm(p2+p1);                  %length of r1
l2=2.0*r1;                       %perpendicular line length desired
r2_hat=[-(p2(2)-p1(2)),+(p2(1)-p1(1))]/r1;    %solved direction of r2
p3=p0+12*r2_hat';                %output
line([p1(1) p2(1)],[p1(2) p2(2)],'Color','k','LineStyle','-','LineWidth',2.0)