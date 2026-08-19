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
