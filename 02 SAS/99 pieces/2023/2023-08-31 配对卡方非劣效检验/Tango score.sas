/*---Tango---*/
/*���߷�*/
%MACRO secant(x0,x1,Z,out);
/*--------------------------------
x0:��ʼֵ1
x1:��ʼֵ2
Z:�ٷ�λ��
--------------------------------*/
data &out;
    /*��������*/
    iteration=1;
	x0=&x0;
	x1=&x1;
    do until (abs(change)<0.000001);/*����ֹͣ����*/
        /*λ��1����ֵ*/
        lambda=x0;
        AA=2*&n;
        BB=-1*&b-&c+(2*&n-&b+&c)*lambda;
        CC=-1*&c*lambda*(1-lambda);
        q=(sqrt(BB**2-4*AA*CC)-BB)/(2*AA);
        /*fx0���������:��ĸΪ0���ĸ��Ϊ0*/
        if (&n*(2*q)+lambda*(1-lambda)>=0) then fx0=&b-&c-&n*lambda-&z*sqrt(&n*(2*q+lambda*(1-lambda)));
        if (&n*(2*q)+lambda*(1-lambda)<0) then fx0=&b-&c-&n*lambda;

        /*λ��2����ֵ*/
        lambda=x1;
        AA=2*&n;
        BB=-1*&b-&c+(2*&n-&b+&c)*lambda;
        CC=-1*&c*lambda*(1-lambda);
        q=(sqrt(BB**2-4*AA*CC)-BB)/(2*AA);
        /*fx0���������:��ĸΪ0���ĸ��Ϊ0*/
        if (&n*(2*q)+lambda*(1-lambda)>=0) then fx1=&b-&c-&n*lambda-&z*sqrt(&n*(2*q+lambda*(1-lambda)));
        if (&n*(2*q)+lambda*(1-lambda)<0) then fx1=&b-&c-&n*lambda;

        /*λ��1��λ��2�ĸ���ֵ*/
        secant=(fx1-fx0)/(x1-x0);

        /*����λ��*/
        x2=x1-(fx1/secant);

		/*λ���ֵ*/
		change=x2-x1;

        /*��������*/
        x0=x1;
        x1=x2;
        iteration=iteration+1;
    end;
    keep x1;
run;
%MEND secant;

/*TangoCI*/
%MACRO tangoci(indata,outdata,uid,row,col,level,alpha);

proc sql noprint;
	select count(unique &uid) into : n from &indata;
    select count(unique &uid) into : a from &indata where &row =  &level and &col =  &level;
    select count(unique &uid) into : b from &indata where &row =  &level and &col ne &level;
    select count(unique &uid) into : c from &indata where &row ne &level and &col =  &level;
    select count(unique &uid) into : d from &indata where &row ne &level and &col ne &level;

    select probit(1-&alpha/2) into : ZL from &indata;
    select probit(&alpha/2) into : ZU from &indata;
quit;

/*���ø��߷�������������������*/
%secant(-0.9999,0.9999,&zl,cll);
%secant(-0.9999,0.9999,&zu,clu);

data &outdata;
length cll 8. clu 8. cl $40;
    merge cll(rename=(x1=cll)) clu(rename=(x1=clu));
    cl=cats("(",put(cll,8.4),",",put(clu,8.4),")");
run;

/*��������������ݼ�*/
proc datasets lib=work noprint; 
	delete cll clu; 
quit;

%MEND tangoci;

/*����*/
/*
DATA study;
INPUT uid $ bio $ alg $ ;
cards;
S001 P P
S002 P P
S003 P P
S004 P P
S005 P P
S006 P P
S007 P P
S008 P P
S009 P P
S010 P P
S011 P P
S012 P P
S013 P P
S014 P P
S015 P P
S016 P P
S017 P P
S018 P P
S019 P F
S020 P F
S021 P F
S022 P F
S023 F P
S024 F P
S025 F P
S026 F P
S027 F P
S028 F P
S029 F P
S030 F P
S031 F P
S032 F P
S033 F P
S034 F P
S035 F F
S036 F F
S037 F F
S038 F F
S039 F F
;
run;

%tangoci(indata=study,outdata=test1,uid=uid,row=bio,col=alg,level="F",alpha=0.05);
*/
