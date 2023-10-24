proc import datafile = "C:\Users\12712\OneDrive\05 笔记整理\04 日常学习笔记\2023\08 August\2023-08-10\条件logistic回归.csv"
  dbms = csv
  out = data1;
run;

/*增加中心分层*/
data data1;
  set data1;
  seq = _n_;
  if seq <= 39 then site = 1;
  else if 39 < seq <= 139 then site = 2;
  else if 139 < seq <=200 then site = 3;
  else site = 4;
run;

proc logistic data = data1 descending;/*SAS默认因变量的较小值与较大值进行比较，使用descending选项将其反转*/
  class site(param=reference ref="1");
  model sAKI=site/stb rsquare;
  strata subclass;
quit;
