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
