
帮助文档：[SAS Help Center : EXTIMATE Statement](https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.4/statug/statug_mixed_syntax06.htm)    

基础语法：`'label' <fixed-effect values ...> <|random-effect values ...> </options>;`  

ESTIMATE 语句与 CONTRAST 语句完全相同，只是只允许单行的 $\mathbf{L}$ 矩阵。实际的估计 $\mathbf{L'\hat{p}}$ 连同其近似标准误差一起显示。还生成了一个 $\mathbf{L'\hat{p}}$=0 的近似 *t* 检验。  

PROC MIXED 选择自由度来匹配在 ESTIMATE 语句中列出的final effect的 “Tests of Fixed Effects” 中显示的那些自由度。可以使用 DF= 选项修改自由度。  

如果 PROC MIXED 发现指定估计的固定效应部分是不可估计的，那么将对估计条目显示 “Non-test”。  

### Options  
##### ALPHA=*number*  
- 规定 *t* 型的置信区间的置信水平为 1-*number* 。
- *number* 的值必须介于0和1之间。
- 默认值为0.05。  

##### CL  
- 计算 *t* 型置信区间。
- 置信水平默认为0.95，可通过 ALPHA= 选项进行调整。  

##### DF=*number*  
- 指定 *t* 检验和置信限的自由度。默认值是从 “Tests of Fixed Effects” 中获取的分母自由度。  

##### DIVISOR=*number*  
- 指定一个值，该值用于除以所有系数，以便小数系数可以作为整数分子输入。  

##### E  
- 显示contrast的 $\mathbf{L}$ 矩阵系数，输出结果名称为 “L Matrix Coefficients”。  

##### GROUP *coeffs* / GRP *coeffs*  
- 当 GROUP=variable 出现在 RANDOM 语句中时，设置不同组之间的random-effect contrasts。默认情况下， CONTRAST 语句系数对 random-effect 的分布是均匀的。   

##### LOWER / LOWERTAILED  
- 要求 *t* 检验的 *p* 值仅基于小于 *t* 统计量的值。默认情况下是双尾检验，如果指定 CL 选项，还会产生一个 lower-tailed confidence limit。  

##### SIGULAR=*number*  
- 按照 CONTRAST 语句中 SINGULAR = 选项的记录调整可估计性检查。  

##### SUBJECT *coeffs* / SUB *coeffs*  
- 当 SUBJECT=variable 出现在 RANDOM 语句中时，设置不同 subject 之间的random-effect contrasts。默认情况下，随机效应的 contrast 语句系数在subject之间均匀分布。  

##### UPPER / UPPERTAILED  
- 要求 *t* 检验的 *p* 值仅基于大于 *t* 统计量的值。默认情况下是双尾检验，如果指定 CL 选项，还会产生一个 upper-tailed confidence limit。 