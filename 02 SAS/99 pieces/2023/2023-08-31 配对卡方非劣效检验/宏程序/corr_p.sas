

/* 2023-08-07 autor : Patricia Rodríguez de Gil */

/*-----------------计算配对两组率差的置信区间--wald/校正wald/Tango socre----------------*/

%macro CORR_P (indata=, row_var =, col_var =, percent_CI = 95); 

* output with count and percent; 
* print suppressed; 
PROC FREQ data= &indata/*noprint*/; 
 TABLES &row_var*&col_var / norow nocol out=a; 
run; 

/*+-------------------------------------------------------------------------+ 
* Restructure output data set to a single observation with four frequencies 
and four percents; 
+--------------------------------------------------------------------------+*/; 
DATA two; 
 set a; 
 row = _n_; 
 array pct[4] pct1 - pct4; 
 array frq[4] freq1 - freq4; 
 retain pct1 - pct4 freq1 - freq4; 
 pct[row] = PERCENT; 
 frq[row] = COUNT; 
 if row = 4 then output; 
 keep pct1 - pct4 freq1 - freq4; 
proc print data = two; 
run; 
DATA CI; 
set two; 
a = Freq4; 
b = Freq2; 
c = Freq3; 
d = Freq1; 
* These are four cell frequencies; 
*a = 18; 
*b = 4; 
*c = 12; 
*d = 5; 
*Proc print data = uplim; 
*run; 
n = a+b+c+d; 
lambda_hat = (b-c)/n; * Sample difference in proportions; 
CI_prop = &percent_CI/100; 
ZL = PROBIT(1 - (1 - CI_prop)/2); * Upper critical value of Z; 
ZU = PROBIT((1 - CI_prop)/2); * Lower critical value of Z; 
/*+--------------------------------------------+ 
* Endpoints of orignal Wald interval; 
+---------------------------------------------+*/; 
Wald_old_up = lambda_hat + ZL*sqrt ((((c+b)/n)-lambda_hat**2)/n); 
Wald_old_low = lambda_hat + ZU*sqrt ((((c+b)/n)-lambda_hat**2)/n); 
/*+---------------------------------------------+ 
    * Endpoints of adjusted Wald interval; 
 +----------------------------------------------+*/; 
newb = (b +1)/(n+2); 
newc=(c+1)/(n+2); 
Wald_new_up = newb-newc + ZL *sqrt((newb+newc-(Newb-newc)**2)/(n+2)); 
Wald_new_low = newb-newc + ZU *sqrt((newb+newc-(Newb-newc)**2)/(n+2)); 
x0 = -.9999; * starting values of lambda; 
x1 = .9999; 
%Tango (a, b, c, d, n, X0, X1,ZU); 
Tango_up = X1; 
x0 = -.9999; * starting values of lambda; 
x1 = .9999; 
%Tango (a, b, c, d, n, X0, X1,ZL); 
Tango_Low = X1; 
run; 
 
DATA _null_; 
  set CI; 
  CI_Level = CI_prop*100; 
file print header = h notitles; 
put @1 'Original Wald' @20 wald_old_low 8.5 @30 wald_old_up 8.5 // 
    @1 'Revised Wald'  @20 wald_new_low 8.5 @30 wald_new_up 8.5 // 
    @1 'Tango'         @20 Tango_low 8.5 @30 Tango_up 8.5; 
return; 
h: put  @1 'Confidence Intervals for Correlated Proportions' // 
        @1 'Level of Confidence:' @31 CI_Level @33 '%' // 
        @1 'Sample Proportion Difference:' @30 lambda_hat 8.5 /// 
        @1 'CI Method' @20 '  Lower' @30 '  Upper' / 
        @1 '-------------' @20 '--------' @30 '--------'; 
run; 

%mend CORR_P;




/* -------------test----------- */

DATA study; 
INPUT bio $ alg $ ; 
cards; 
P P 
P P 
P P 
P P 
P P 
P P 
P P 
P P 
P P 
P P 
P P 
P P 
P P 
P P 
P P 
P P 
P P 
P P 
P F 
P F 
P F 
P F 
F P 
F P 
F P 
F P 
F P 
F P 
F P 
F P 
F P 
F P 
F P 
F P 
F F 
F F 
F F 
F F 
F F 
; 
run; 

proc freq data=study;
    table bio*alg;
quit;
run;


%CORR_P(indata=study, row_var =bio, col_var = alg, percent_CI = 95);

