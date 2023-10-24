proc import datafile = "C:\Users\12712\OneDrive\05 �ʼ�����\04 �ճ�ѧϰ�ʼ�\2023\08 August\2023-08-10\����logistic�ع�.csv"
  dbms = csv
  out = data1;
run;

/*�������ķֲ�*/
data data1;
  set data1;
  seq = _n_;
  if seq <= 39 then site = 1;
  else if 39 < seq <= 139 then site = 2;
  else if 139 < seq <=200 then site = 3;
  else site = 4;
run;

proc logistic data = data1 descending;/*SASĬ��������Ľ�Сֵ��ϴ�ֵ���бȽϣ�ʹ��descendingѡ��䷴ת*/
  class site(param=reference ref="1");
  model sAKI=site/stb rsquare;
  strata subclass;
quit;
