
帮助文档：[SAS Help Center : CONTRAST Statement](https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.4/statug/statug_mixed_syntax05.htm)  

基础语法：`CONTRAST 'label' <fixed-effect values ...> <\random-effect values ...>,...</options>;`  

### 参数  
##### *label*  
- 表格中contrast的标签。每个指定的 contrast 都需要一个标签，标签最多可以有200个字符，并且必须用括号括起来。  

##### *fixed-effect*  
- 定义 MODEL 语句中呈现的effect。关键字 INTERCEPT 可以用作模型中拟合截距时的一种effect。不需要在 MODEL 语句中包含所有的effects。

##### *random-effect*  
- 定义 <font color=#4D7EBF>RANDOM</font> 语句中呈现的effect。第一个random effect必须跟在“|”后面，但是random effects并不是必须被指定。  

##### *values*  
- 与固定效应和随机效应相关的 $\mathbf{L}$ 矩阵元素的常数。  

### Options  
##### CHISQ  
- 在 *F* 检验之外进行卡方检验。一个卡方统计量等于其相应的 *F* 统计量乘以关联分子自由度，并使用相同的自由度来计算卡方检验的 *p* 值。这个 *p* 值总是小于 *F* 检验因为它有效地（effectively）对应于具有无限分母自由度的 *F* 检验。  

##### DF=*number*  
- 指定 *F* 检验的分母自由度。
- 对于自由度方法（degrees-of-freedom methods） DDFM=BETWITHIN，DDFM=CONTAIN，和DDFM=RESIDUAL，默认值是从“Tests of Fixed Effects”中取得的分母自由度，并对应于你在 CONTRAST 语句中列出的final effect。
- 对于DDFM=SATTERTHWAITE，DDFM=KENWARDROGER，和DDFM=KENWARDROGER2，分母自由度分别针对每个contrast进行计算。  

##### E  
- 显示contrast的 $\mathbf{L}$ 矩阵系数，输出结果名称为 “L Matrix Coefficients”。  

##### GROUP *coeffs* / GRP *coeffs*   
- 当 GROUP=variable 出现在 RANDOM 语句中时，设置不同组之间的random-effect contrasts。默认情况下， CONTRAST 语句系数对 random-effect 的分布是均匀的。  

##### SINGULAR=*number*  
- 调整 estimability checking。  
- 取值需在0-1之间，默认值为 1E-4。  

##### SUBJECT *coeffs* / SUB *coeffs*  
- 当 SUBJECT=variable 出现在 RANDOM 语句中时，设置不同 subject 之间的random-effect contrasts。默认情况下，随机效应的 contrast 语句系数在subject之间均匀分布。  


