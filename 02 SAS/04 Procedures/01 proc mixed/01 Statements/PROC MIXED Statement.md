
帮助文档：[SAS Help Center : PROC MIXED Statement](https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.4/statug/statug_mixed_syntax01.htm)    

基础语法：  `PROC MIXED <options>;`  

## 1 Options  
### 1.1 Basic Options  
##### DATA=
- 指定输入数据集  
- 默认值：最近创建的数据集  

##### METHOD=  
- 指定协方差参数（covariance parameters）的估计方法  
- 可选参数：METHOD = REML \| ML \| MIVQUE0 \|TYPE1 \|TYPE2 \|TYPE3  
	- REML：residual (restricted) maximun likelihood，限制最大似然估计  
	- ML：maximum likelihood，最大似然估计  
	- MIVQUE0：minimum variance quadratic unbiased estimation，最小方差二次无偏估计  
	- TYPE*n*：仅在无 <font color=#4D7EBF>SUBJECT=</font> 效应且无 <font color=#4D7EBF>REPEATED</font> 语句时可用。输出结果中包含一个方差分析表，mean squares用于估计variance components，得到的variance components估计值用于后续的计算，包括从 ESTIMATE 和 LSMEANS 语句计算的标准误差。  
- 默认值：REML  
- 定义明晰：[最大似然估计和限制性极大似然估计 - 知乎](https://zhuanlan.zhihu.com/p/66062778)  

##### NOPROFILE  
- 在优化中包含尺度参数（scale paramenter）
- 将残差作为Newton-Raphson迭代的一部分。此选项仅适用于具有残差方差参数的模型。
- 默认情况下，此参数将会在likelihood calculations之外进行配置，除非在PARAMS预计中指定了 HOLD= 选项。  

##### ORDER=  
- 指定 <font color=#4D7EBF>CLASS</font> 的排序。  
- 应用于 CLASS 指定的所有分类变量。  
- 可选参数：OREDER = DATA \| FORMATTED \| FREQ \| INTERNAL  
	- DATA：根据输入数据集中的数据显示进行排序  
	- FORMATTED：外部格式化值，但没有显示格式的数值变量除外（将按其未格式化的值排序）
	- FREQ：频数降序排序  
	- INTERNAL：根据未经格式化的值进行排序  
- 默认值：FORMATTED  

### 1.2 Displayed Output  
##### ASYCORR  
- 显示协方差参数估计的渐进相关矩阵（asymptotic correlation matrix）  

##### ASYCOV  
- 显示协方差参数估计相关的渐进协方差矩阵（asymptotic covariance matrix）  

##### CL  
- 请求计算协方差参数估计的置信区间  
- 计算置信区间的方法：CL<=WALD>；使用Wald Z-scores方法来获取置信限。  
- 默认计算95%置信区间，可通过 <font color=#4D7EBF>ALPHA=</font> 选项来进行调整。  

##### COVTEST  
- 显示协方差参数的渐进标准误差和Wald检验  

##### IC  
- 显示一个包含各种information criteria的表格，这些criteria都是越小越好（smaller-is-better）的形式  
- *Criterion*：
	- AIC：$-2\mathscr{l} + 2d$  
	- AICC：$-2\mathscr{l} + 2dn^*/(n^*-d-1)$  
	- HQIC：$-2\mathscr{l} + 2d loglogn\ for\ n>1$  
	- BIC：$-2\mathscr{l} + dlogn\ for \ n>0$ 
	- CAIC：$-2\mathscr{l}+d(logn+1)\ for\ n>0$  

##### ITDETAILS  
- 显示添加到“Iteration History”中的估计值和渐变（gradients）  

##### LOGNOTE  
- 向日志中写入定期注释（periodic notes），描述计算机的当前状态。用于需要大量CPU资源的分析。  

##### MMEQ  
- 显示混合模型的方程  

##### MMEQSOL  
- 显示混合模型方程的解  

##### NOCLPRINT<=*number*>  
- 若没有指定*number*，则不显示“Class Level Information”；如果指定了*number*，则表中只列出总数i小于*number*的类别。  

##### NOITPRINT  
- 不显示“Iteration History”表格  

##### PLOTS=  
- 生成ODS statistics graphics  
- 可选（具体参数参见帮助文档）：
	- `PLOTS <(global-plot-options)> <=plot-request <(options)>>`  
	- `PLOTS <(global-plot-options)> <=(plot-request <(options)> <...plot-request<(options)>>)>`  

##### RANKS  
- 显示design matrices X 和 (XZ) 的ranks表  

##### RATIO  
- 生成协方差参数估计值于残差方差的比值  

### 1.3 Optimization Options  
##### MAXFUNC=  
- 指定似然比计算的最大次数  

##### MAXITER=  
- 指定迭代的最大次数  

### 1.4 Computational Options  
##### CONVF<=number>  
- 请求和调整relative function的收敛准则  
- relative function convergence criterion为：$\frac{|f_k-f_{k-1}|}{|f_k|} \leq number$
- 如果不想使用$|f_k|$作为除数，可使用 <font color=#4D7EBF>ABSOLUTE</font> 选项  
- 默认的convergence criterion为CONVH，默认的限值为1E-8  

##### CONVG<=number>  
- 请求和调整相对梯度收敛准则（relative gradient convergence criterion）  
- relative gradient convergence criterion为：$\frac{max_j|g_{jk}|}{|f_k|} \leq number$  
- 如果不想使用$|f_k|$作为除数，可使用 <font color=#4D7EBF>ABSOLUTE</font> 选项  
- 默认的convergence criterion为CONVH，默认的限值为1E-8  

##### CONVH<=number>  
- 请求relative Hessian convergence criterion与公差数（tolarance *number*）。  

##### DFBW  
- 选择between-within自由度方法  
- 具有与 <font color=#4D7EBF>MODEL</font> 语句中的 DDFM=BW 选项相同的效果  

##### EMPIRICAL  
- 计算经验（“sandwich”）估计量  

##### NOBOUND  
- 无边界协方差参数估计（unbounds covariance parameter estimates）  

##### RIDGE=  
- 指定Newton-Raphson算法中minimun ridge value的初始值，默认值为0.3125  

##### SCORING  
- 在可用时应用Fisher scoring  

### 1.5 Other  
##### ABSOLUTE  
- 使收敛准则为绝对值。默认情况下，是相对值。  

##### ALPHA=*number*  
- 请求对具有$1-number$置信水平的协方差参数估计构造置信限。
- 默认值为0.05  

##### ANOVAF  
- 通过类似于Brunner、Domhof和Langer的方法计算具有 REPEATED 语句且不具有 RANDOM 语句的模型中的F检验。该方法包括计算特殊F统计量并调整其自由度。  

