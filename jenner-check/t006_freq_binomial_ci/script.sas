/*========================================率的检验=========================================*/
/*========================================二项分布========================================*/
/*------------------------单组率的置信区间-----------------------*/
data tmp1;
    aval = "无效"; count = 45; output;
    aval = "有效"; count = 55; output;
run;

proc freq data = tmp1;
    tables aval/ alpha=0.05 binomial (level="有效" cl=wald exact);
    weight count;
    output out=test2 binomial;
run;

/*------------------------单组率-----------------------*/
data tmp1;
    aval = "未治愈"; count = 63; output;
    aval = "治愈"; count = 117; output;
run;

proc freq data = tmp1;
    tables aval/ alpha=0.05 binomial (level="治愈" p=0.45 cl=wald exact);
    /*aval="治愈"的率与45%的差异性检验*/
    weight count;
    output out=test3 binomial;
run;
