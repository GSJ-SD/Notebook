
### 1 参考资料  
[Passing-Bablok regression in SAS - The DO Loop](https://blogs.sas.com/content/iml/2022/02/14/passing-bablok-regression-sas.html)  
[How to execute Passing-Bablok Regression in SAS](https://communities.sas.com/t5/SAS-Communities-Library/An-example-of-Passing-Bablok-Regression-in-SAS/ta-p/790884)  
[1]胡丽涛,王薇,王治国.回归和多元分析在参考物质互换性研究中的应用[J].中国卫生统计,2012,29(03):462-464.

### 2 公式及简介  
#### 2.1 简介  

与 Deming 回归相似，PB 回归在两个变量都存在不精密度时较适用。  

PB 回归是一种非参数程序，对误差分布类型没有规定，可适用于恒定或成比例的误差情况，唯一的限制是假设方差的比例等于斜率的平方。  

PB 回归的优点表现在离群值的稳健性，缺点是由于非参数方法的性质造成的较宽的置信区间。  

#### 2.2 计算公式  
##### 2.2.1 斜率和截距的点估计

设共有 $N$ 个数据点对（pair of data points），对于给定的数据点对 $(x_i,y_i)$ 和 $(x_j,y_j)$ ，可计算两点之间的斜率为：
$$s_{ij}=\frac{y_i-y_j}{x_i-x_j}\ for\ 1\le i\le N \tag{1}$$  
则对于N个数据点对，共能求得 $n$ 个斜率（$n \le N(N-1)/2$）；对于一些特殊情况的处理如下：
1. 当 $x_i=x_j$ 且 $y_i=y_j$ 时，数据点对于斜率 $\beta$ 的估计无贡献，可剔除该点斜率；
2. 当 $x_i=x_j$ 且 $y_i \ne y_j$ 时，根据 $y_i-y_j$ 的正负，令斜率 $s_{ij}=\pm{\infty}$ ；
3. 当 $x_i\ne x_j$ 且 $y_i=y_j$ 时，$s_{ij}=0$ 。

对得到的 $n$ 个斜率从小到大进行排序：
$$s_{(1)}\le s_{(2)}\le\ldots\le s_{(n)} \tag{2}$$  
将 $s_{ij}<-1$ 的斜率的个数记作 $K$ ；斜率 $\beta$ 的估计值即为：
$$b=
\begin{cases}
s_{(\frac{N+1}{2}+K)}, & \text{if }N\text{ is odd}\\
\frac{1}{2}(s_{(\frac{N}{2}+K)}+s_{(\frac{N}{2}+1+K)}), & \text{if }N\text{ is even} \tag{3}
\end{cases}
$$  
得到斜率 $\beta$ 的估计值 $b$ 后，对于每个数据点对，有 $a_i=y_i-bx_i$ ，截距 $\alpha$ 的估计值为 $N$ 个 $a_i$ 的中位数：
$$a=med\{y_i-bx_i\} \tag{4}$$  
##### 2.2.2 斜率和截距的区间估计  

要求斜率 $\beta$ 的 $(1-\frac{\gamma}{2})\%$ 的置信区间，有：
$$C_{\gamma}=Z_{1-\frac{\gamma}{2}}\sqrt{\frac{n(n-1)(2n+5)}{18}} \tag{5}$$  
$$M_1=\frac{N-C_{\gamma}}{2},\ M_2=N-M_1+1,\ \ M_1\text{ rounded to an integer value} \tag{6}$$    
则 $b$ 的置信区间为：
$$s_{(M_1+K)}\le \beta \le s_{(M_2+K)} \tag{7}$$  
 $a$ 的置信区间为：
 $$\begin{align}
 a_L=med\{y_i-b_Ux_i\} \tag{8} \\
 a_U=med\{y_i-b_Lx_i\} \tag{9}
 \end{align}
 $$  
### 3 SAS实现  

除参考文献中使用 IML 外，也可使用 SAS Base 模块实现：  
```SAS
%MACRO PBLOK(indata,x,y,outdata);
data analysis;
  set &indata;
  seq=_N_;
  keep seq &Y &X;
run;

proc sql noprint;
  select count(seq) into: N1/*样本例数*/
  from analysis;
quit;

/*求S_ij*/
data pass1;
  array p(2,&N1);
  do i=1 to &N1;
    set analysis;
    p(1,i)=&X;
    p(2,i)=&Y;
  end;
  do i=1 to &N1-1;
    do j=2 to &N1;
      if i<j then do;
        if p(2,i)=p(2,j) and p(1,i)=p(1,j) then s=99999;/*xi=xj and yi=yj*/
        else if p(2,i) = p(2,j) and p(1,i) ne p(1,j) then s=0;/*xi ne xj and yi=yj*/
        else if p(2,i)-p(2,j) > 0 and p(1,i)-p(1,j)=0 then s=constant("BIG");/*xi = xj*/
        else if p(2,i)-p(2,j) < 0 and p(1,i)-p(1,j)=0 then s=-1*constant("BIG");
        else if (p(2,i)-p(2,j))/(p(1,i)-p(1,j))=-1 then s=99999;/*s=-1*/
        else s=(p(2,i)-p(2,j))/(p(1,i)-p(1,j));
      end;
      if i>=j then do;
       s=99999;
      end;
      output;
    end;
  end;
run;

data pass2;
  set pass1;
  where s^=99999;
  keep s;
run;

/*将S_ij按升序排列*/
proc sort data=pass2 out=pass2;
  by s;
run;

data pass2;
  set pass2;
  seq=_N_;
run;

/*求小于-1的S_ij数K*/
proc sql noprint;
  select count(seq) into: N2/*s数目*/
  from pass2;
  select count(seq) into: K
  from pass2 where s<-1;
quit;

%put &N2 &K;

proc sql noprint;
  select index(strip(put(&N2/2,best.)),".") into : mod
  from &indata;
quit;

%let CN1 = %sysevalf(&N2/2+&K);
%let CN2 = %sysevalf(&N2/2+1+&K);

/*求斜率估计值b0*/
data pass3;
  set pass2;
    %if &mod = 0 %then %do;
        where seq in (&CN1,&CN2);
    %end;
    %if &mod ne 0 %then %do;
        where seq=(&N2+1)/2+&K;
    %end;
run;

proc sql noprint;
  select mean(s) into: b0
  from pass3;
quit;


/*求斜率b的95%置信区间*/
data _null_;
  C=probit(0.975)*sqrt(&N1*(&N1-1)*(2*&N1+5)/18);
  M1=round((&N2-C)/2,1);
  M2=&N2-M1+1;
  Q1=M1+&K;
  Q2=M2+&K;
  call symput("Q1",Q1);
  call symput("Q2",Q2);
run;

proc sql noprint;
  select s into: b_CIL
  from pass2 where seq=&Q1;
  select s into: b_CIU
  from pass2 where seq=&Q2;
quit;

/*求截距估计值a0及其95%置信区间*/
data analysis2;
  set analysis;
  a=&Y-&b0*&X;
  a_l=&Y-&b_CIU*&X;
  a_u=&Y-&b_CIL*&X;
run;

proc sql noprint;
  select median(a) into: a0
  from analysis2;
  select median(a_u) into: a_CIU
  from analysis2;
  select median(a_l) into: a_CIL
  from analysis2;
quit;

/*结果整理*/
data &outdata;
length seq 8. describ $20. var1 $40. var2 $40.;
  seq=1; describ="估计值"; var2=strip(put(&a0+0,8.3)); var1=strip(put(&b0+0,8.3)); output;
  seq=2; describ="95% CI"; var2="("||strip(put(&a_CIL+0,8.3))||","||strip(put(&a_CIU+0,8.3))||")";
         var1="("||strip(put(&b_CIL+0,8.3))||","||strip(put(&b_CIU+0,8.3))||")"; output;
run;

/*清除过程数据集*/
proc datasets lib=work noprint; delete analysis analysis2 pass1 pass2 pass3; quit;
 
%MEND PBLOK;
```  
