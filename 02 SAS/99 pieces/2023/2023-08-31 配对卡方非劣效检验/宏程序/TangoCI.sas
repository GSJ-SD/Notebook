

/* 2023-08-07 autor : Patricia Rodríguez de Gil */

/*-----------------计算配对两组率差的置信区间--Tango socre--割线法--------------*/

%macro Tango (a, b, c, d, n, X0, X1,Z);

/* 
    a,b,c,d,n   ：频数值
    X0,X1       ：初始值
    Z           ：正态分位数
*/

/*Initializing iteration counter;*/
iteration = 1;  
a = &a;b = &b;c = &c;d = &d;n = &n;X0 = &X0;x1 = &X1;Z = &Z;

do until (abs(change) < .000001);

/* Evaluate x0;*/
    lambda = x0;
    AA = 2*n;
    BB = -1*b-c+(2*n - b + c)*lambda;
    CC = -1*c*lambda*(1-lambda);
    q21_hat = (SQRT(BB**2 - 4*AA*CC) - BB)/(2*AA);
    if (n*(2*q21_hat+lambda*(1-lambda))>=0) then fx0 = b-c-n*lambda - Z*SQRT(n*(2*q21_hat+lambda*(1-lambda)));
    if (n*(2*q21_hat+lambda*(1-lambda))<0) then fx0 = b-c-n*lambda;

 /*---------------------------------------------------+
* Evaluate x1;
 +--------------------------------------------------- */;
    lambda = x1;
    AA = 2*n;
    BB = -1*b-c+(2*n - b + c)*lambda;
    CC = -1*c*lambda*(1-lambda);
    q21_hat = (SQRT(BB**2 - 4*AA*CC) - BB)/(2*AA);
    if (n*(2*q21_hat+lambda*(1-lambda))>=0) then fx1 = b-c-n*lambda - Z*SQRT(n*(2*q21_hat+lambda*(1-lambda)));
    if (n*(2*q21_hat+lambda*(1-lambda))<0) then fx1 = b-c-n*lambda;

 /*---------------------------------------------------+
 * Evaluate change in lambda;
 +----------------------------------------------------*/
    x2 = x1 - (fx1 * (x1-x0)/(fx1 - fx0)); * update value of lambda to evaluate;
    change = x2 - x1;
/*-------------------------------------------------------------------------+
* Set x0 and x1 for next iteration of loop, and increment iteration counter;
+-------------------------------------------------------------------------*/;

    x0 = x1;
    x1 = x2;
    iteration = iteration + 1;
end;

%mend Tango;
