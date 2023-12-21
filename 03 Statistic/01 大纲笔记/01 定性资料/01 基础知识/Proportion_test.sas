/*========================================�ʵļ���=========================================*/
/*������ͳ��*/
ods output OneWayFreqs=Test1;
proc freq data=sashelp.class;
    tables sex;
run;
ods output close;

/*========================================����ֲ�========================================*/
/*------------------------�����ʵ���������-----------------------*/
data tmp1;
    aval = "��Ч"; count = 45; output;
    aval = "��Ч"; count = 55; output;
run;

proc freq data = tmp1;
    tables aval/ alpha=0.05 binomial (level="��Ч" cl=wald exact);
    weight count;
    output out=test2 binomial;
run;

/*------------------------������-----------------------*/
data tmp1;
    aval = "δ����"; count = 63; output;
    aval = "����"; count = 117; output;
run;

proc freq data = tmp1;
    tables aval/ alpha=0.05 binomial (level="����" p=0.45 cl=wald exact);
    /*aval="����"������45%�Ĳ����Լ���*/
    weight count;
    output out=test3 binomial;
run;

/*poisson�ֲ����*/
data a;
    X=68;
    alpha=0.05;
    LowerCL=X-probit(0.975)*sqrt(X);
    UpperCL=X+probit(0.975)*sqrt(X);
run;

data b;
    n=25000;
    X=123;
    pi_0=0.003;
    lambda=n*pi_0;
    alpha=0.05;
    u=(X-lambda)/sqrt(lambda);
    P=1-probnorm(u);
run;

/*------------------------���������-----------------------*/
data tmp2;
    aval1=1; aval2=1; count=11; output;
    aval1=1; aval2=2; count=12; output;
    aval1=2; aval2=1; count=2; output;
    aval1=2; aval2=2; count=33; output;
run;

proc freq data = tmp2;
    tables aval1 * aval2/ agree;
    weight count;
    output out=test3 agree;
run;

/*------------------------������������-----------------------*/
/*�����Լ���*/
data tmp3;
    group=1; aval=1; count=99; output;
    gtoup=1; aval=2; count=5; output;
    group=2; aval=1; count=75; output;
    group=2; aval=2; count=21; output;
run;

proc freq data = tmp3;
    tables group * aval/ chisq(warn=output) exact expected;
  /*warn=output�����һ��01���������ݼ�����ʾ�Ƿ��г���20%�ĸ��ӵ�����Ƶ��С��5��
    ���ݱ���ֵ�����жϣ�ѡ�񿨷�ֵ������ѡ��ȷ�и��ʷ���*/
    weight count;
    output out=result1 chisq fisher phi pchi;
run;

/*��Ч�Լ���*/
data tmp4;
    group=1; aval=1; count=121; output;
    gtoup=1; aval=2; count=14; output;
    group=2; aval=1; count=104; output;
    group=2; aval=2; count=10; output;
run;

proc freq data=tmp4;
    tables group * aval/riskdiff (equiv MARGIN=(-0.05,0.1)) alpha=0.025;
    weight count;
    output out=result2 riskdiff;
run;

proc freq data=tmp4;
    tables group * aval/riskdiff (equiv MARGIN=0.1) alpha=0.025;
    weight count;
    output out=result2 riskdiff;
run;


/*����Ч�Լ���*/
data tmp4;
    group=1; aval=1; count=97; output;
    gtoup=1; aval=2; count=15; output;
    group=2; aval=1; count=102; output;
    group=2; aval=2; count=10; output;
run;

proc freq data=tmp4;
    tables group * aval /riskdiff (noninf MARGIN=0.10) alpha=0.025;
    weight count;
    output out=test4 riskdiff;
run;


/*��Ч�Լ���*/
data tmp5;
    group=1; aval=1; count=134; output;
    gtoup=1; aval=2; count=14; output;
    group=2; aval=1; count=104; output;
    group=2; aval=2; count=13; output;
run;

proc freq data=tmp5;
    tables group * aval/riskdiff (sup MARGIN=0.05) alpha=0.025;
    weight count;
    output out=result3 riskdiff;
run;

/*------------------------�������������-----------------------*/
data tmp4;
  do grp = 1 to 3;
    do aval = 1 to 4;
      input count @@;
      output;
    end;
  end;
  datalines;
   450 410 100 40
   190 250 40 20
   300 250 350 100
  ;
run;

proc freq data = tmp4;
  tables grp*aval/ chisq(warn=output) expected;
  /*warn=output�����һ��01���������ݼ�����ʾ�Ƿ��г���20%�ĸ��ӵ�����Ƶ��С��5��
    ���ݱ���ֵ�����жϣ�ѡ�񿨷�ֵ������ѡ��ȷ�и��ʷ���*/
  weight count;
  output out=result2 chisq fisher pchi;
run;

