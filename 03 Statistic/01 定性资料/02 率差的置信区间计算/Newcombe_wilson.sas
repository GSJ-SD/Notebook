/*�����ʾ�Ϊ0%��100%*/
/*�¼����ݼ�*/
data event1;
    arm="������"; event="��Ч"; count=59; output;
    arm="������"; event="��Ч"; count=0; output;
    arm="������"; event="��Ч"; count=56; output;
    arm="������"; event="��Ч"; count=0; output;
run;

/*���ݼ���ʽ����*/
data _count;
    g1_v1 = 59; g1_v2=0; g1=59+0; g2_v1=56; g2_v2=0; g2=56+0; output;
run;

/*Wilson����������������������*/
data _wilsonCI;
    set _count;
    z=probit(1-0.025);
    l1 = (2*g1*(g1_v1/g1)+z**2-z*sqrt(z**2+4*g1*(g1_v1/g1)*(g1_v2/g1)))/(2*(g1+z**2));
    u1 = (2*g1*(g1_v1/g1)+z**2+z*sqrt(z**2+4*g1*(g1_v1/g1)*(g1_v2/g1)))/(2*(g1+z**2));

    l2 = (2*g2*(g2_v1/g2)+z**2-z*sqrt(z**2+4*g2*(g2_v1/g2)*(g2_v2/g2)))/(2*(g2+z**2));
    u2 = (2*g2*(g2_v1/g2)+z**2+z*sqrt(z**2+4*g2*(g2_v1/g2)*(g2_v2/g2)))/(2*(g2+z**2));
run;

/*Newcombe-Wilson�����ʲ���������������*/
data _newcombeCI;
    set _wilsonCI;
    L = (g1_v1/g1)-(g2_v1/g2)-sqrt(((g1_v1/g1)-l1)**2+(u2-(g2_v1/g2)));
    U = (g1_v1/g1)-(g2_v1/g2)+sqrt(((g2_v1/g2)-l2)**2+(u1-(g1_v1/g1)));
run;



/*�����ʷ�Ϊ0%��100%*/
/*�¼����ݼ�*/
data event2;
    arm="������"; event="��Ч"; count=59; output;
    arm="������"; event="��Ч"; count=2; output;
    arm="������"; event="��Ч"; count=56; output;
    arm="������"; event="��Ч"; count=1; output;
run;

/*���ݼ���ʽ����*/
data _count;
    g1_v1 = 59; g1_v2=2; g1=59+2; g2_v1=56; g2_v2=1; g2=56+1; output;
run;

/*Wilson����������������������*/
data _wilsonCI;
    set _count;
    z=probit(1-0.025);
    l1 = (2*g1*(g1_v1/g1)+z**2-z*sqrt(z**2+4*g1*(g1_v1/g1)*(g1_v2/g1)))/(2*(g1+z**2));
    u1 = (2*g1*(g1_v1/g1)+z**2+z*sqrt(z**2+4*g1*(g1_v1/g1)*(g1_v2/g1)))/(2*(g1+z**2));

    l2 = (2*g2*(g2_v1/g2)+z**2-z*sqrt(z**2+4*g2*(g2_v1/g2)*(g2_v2/g2)))/(2*(g2+z**2));
    u2 = (2*g2*(g2_v1/g2)+z**2+z*sqrt(z**2+4*g2*(g2_v1/g2)*(g2_v2/g2)))/(2*(g2+z**2));
run;

/*Newcombe-Wilson�����ʲ���������������*/
data _newcombeCI;
    set _wilsonCI;
    d = (g1_v1/g1)-(g2_v1/g2);
    L = (g1_v1/g1)-(g2_v1/g2)-sqrt(((g1_v1/g1)-l1)**2+(u2-(g2_v1/g2))**2);
    U = (g1_v1/g1)-(g2_v1/g2)+sqrt(((g2_v1/g2)-l2)**2+(u1-(g1_v1/g1))**2);
run;

/*��SASnewcombe���Ƿ�һ��*/
proc freq data=event2(where=(arm="������"));
    tables event / bin(cl=(wilson) level="��Ч");
    weight count / zeros;
run;

proc freq data=event2(where=(arm="������"));
    tables event / bin(cl=(wilson) level="��Ч");
    weight count / zeros;
run;

proc freq data=event2;
    tables arm * event / riskdiff(cl=(newcombe)) alpha=0.05;
    weight count / zeros;
run;
