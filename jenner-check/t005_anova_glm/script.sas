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
