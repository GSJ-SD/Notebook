/*=======================================T检验===========================================*/
/*----------------------单组t检验----------------------*/
data read;
   input score count @@;
   datalines;
40 2   47 2   52 2   26 1   19 2
25 2   35 4   39 1   26 1   48 1
14 2   22 1   42 1   34 2   33 2
18 1   15 1   29 1   41 2   44 1
51 1   43 1   27 2   46 2   28 1
49 1   31 1   28 1   54 1   45 1
;
run;

proc ttest data=read h0=30;
   var score;
   freq count;
run;

/*----------------------配对t检验----------------------*/
data pressure;
   input SBPbefore SBPafter @@;
   datalines;
120 128   124 131   130 131   118 127
140 132   128 125   140 141   135 137
126 118   130 132   126 129   127 135
;
run;

proc ttest data=pressure h0=5;
   paired SBPbefore*SBPafter;
run;

/*非劣效检验：非劣界值-2.0，单侧alpha=0.025*/
proc ttest data=pressure h0=-1.5 sides=2 alpha=0.05;
   paired SBPbefore*SBPafter;
run;

/*----------------------两独立t检验----------------------*/
data scores;
   input Gender $ Score @@;
   datalines;
f 75  f 76  f 80  f 77  f 80  f 77  f 73
m 82  m 80  m 85  m 85  m 78  m 87  m 82
;
run;

proc ttest data=scores h0=-5 cochran ci=equal umpu;
   class Gender;
   var Score;
run;

/*=======================================方差分析===========================================*/
data plants;
   input Type $ @;
   do Block = 1 to 3;
      input StemLength @;
      output;
   end;
   datalines;
Clarion  32.7 32.3 31.5
Clinton  32.1 29.7 29.1
Knox     35.7 35.9 33.1
O'Neill  36.0 34.2 31.2
Compost  31.8 28.0 29.2
Wabash   38.2 37.8 31.9
Webster  32.5 31.1 29.7
;

/*anova过程*/
proc anova data=plants plots=none;
   class Block(ref="3");/*block=组别；ref选项用于指定排序，不要也可以*/
   model StemLength = Block;
   means Block/bon snk;
quit;

proc glm data=plants;
   class Block(ref="3");/*block=组别；ref选项用于指定排序，不要也可以*/
   model StemLength = Block;
   means block/dunnett;/*使用dunnett方法比较两两之间有无差异*/
quit;


