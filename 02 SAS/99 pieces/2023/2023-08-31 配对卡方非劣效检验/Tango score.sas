/*---Tango---*/
/*割线法*/
%MACRO secant(x0,x1,Z,out);
/*--------------------------------
x0:初始值1
x1:初始值2
Z:百分位数
--------------------------------*/
data &out;
    /*迭代次数*/
    iteration=1;
	x0=&x0;
	x1=&x1;
    do until (abs(change)<0.000001);/*迭代停止条件*/
        /*位点1函数值*/
        lambda=x0;
        AA=2*&n;
        BB=-1*&b-&c+(2*&n-&b+&c)*lambda;
        CC=-1*&c*lambda*(1-lambda);
        q=(sqrt(BB**2-4*AA*CC)-BB)/(2*AA);
        /*fx0分情况考虑:分母为0与分母不为0*/
        if (&n*(2*q)+lambda*(1-lambda)>=0) then fx0=&b-&c-&n*lambda-&z*sqrt(&n*(2*q+lambda*(1-lambda)));
        if (&n*(2*q)+lambda*(1-lambda)<0) then fx0=&b-&c-&n*lambda;

        /*位点2函数值*/
        lambda=x1;
        AA=2*&n;
        BB=-1*&b-&c+(2*&n-&b+&c)*lambda;
        CC=-1*&c*lambda*(1-lambda);
        q=(sqrt(BB**2-4*AA*CC)-BB)/(2*AA);
        /*fx0分情况考虑:分母为0与分母不为0*/
        if (&n*(2*q)+lambda*(1-lambda)>=0) then fx1=&b-&c-&n*lambda-&z*sqrt(&n*(2*q+lambda*(1-lambda)));
        if (&n*(2*q)+lambda*(1-lambda)<0) then fx1=&b-&c-&n*lambda;

        /*位点1与位点2的割线值*/
        secant=(fx1-fx0)/(x1-x0);

        /*迭代位点*/
        x2=x1-(fx1/secant);

		/*位点差值*/
		change=x2-x1;

        /*继续迭代*/
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

/*调用割线法宏求置信区间上下限*/
%secant(-0.9999,0.9999,&zl,cll);
%secant(-0.9999,0.9999,&zu,clu);

data &outdata;
length cll 8. clu 8. cl $40;
    merge cll(rename=(x1=cll)) clu(rename=(x1=clu));
    cl=cats("(",put(cll,8.4),",",put(clu,8.4),")");
run;

/*清除过程所用数据集*/
proc datasets lib=work noprint; 
	delete cll clu; 
quit;

%MEND tangoci;

/*测试*/
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
