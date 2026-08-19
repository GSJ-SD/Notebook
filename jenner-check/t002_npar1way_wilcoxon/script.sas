/*---------------------------两独立样本-------------------------*/
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
