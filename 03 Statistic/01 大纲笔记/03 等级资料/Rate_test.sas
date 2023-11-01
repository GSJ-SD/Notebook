/*=========================等级资料=========================*/
/*--------------------------单组--------------------------*/
/*wilcoxon signed-rank test，符号秩和检验*/
/*对应于输出结果中的：【Signed Rank】/【符号秩】*/
data training;
    input before after @@;
    d= after-before;
    datalines;
3  5 2  4 4  3 1  3 4  4
3  5 1  2 4  5 3  1 1  3
3  5 2  4 3  2 3  5 1  3
;
run;

proc univariate data = training alpha=0.05 mu0=3 CIQUANTDF;
    /*mu0=3：指定要与之比较的位置值为3*/
    var before;
run;


/*---------------------------配对两组-------------------------*/
/*wilcoxon signed-rank test，符号秩和检验*/
/*对应于输出结果中的：【Signed Rank】/【符号秩】*/
data training;
    input before after @@;
    d= after-before;
    datalines;
3  5 2  4 4  3 1  3 4  4
3  5 1  2 4  5 3  1 1  3
3  5 2  4 3  2 3  5 1  3
;
run;

proc univariate data = training alpha=0.05 mu0=0 CIQUANTDF;
    /*mu0=3：指定要与之比较的位置值为3*/
    var d;
run;

/*---------------------------两独立组别-------------------------*/
/*wilcoxon score，wilcoxon秩和检验*/
data Arthritis;
   input Treatment $ Response Freq @@;
   datalines;
Active 5 5 Active 4 11 Active 3 5 Active 2 1 Active 1 5
Placebo 5 2 Placebo 4 4 Placebo 3 7 Placebo 2 7 Placebo 1 12
;

proc npar1way data=Arthritis wilcoxon median 
               plots=(wilcoxonboxplot medianplot)
               correct=no;
   class Treatment;
   var Response;
   freq Freq;
run;

/*---------------------------独立多组别-------------------------*/
