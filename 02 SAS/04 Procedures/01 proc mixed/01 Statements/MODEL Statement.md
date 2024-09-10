
帮助文档：[SAS Help Center : MODEL Statement](https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.4/statug/statug_mixed_syntax10.htm)  

基础语法：`MODEL dependent=<fixed-effects> </options>;`  

### Options  
#### 1 模型构建  
##### NOINT  
- 从模型中排除固定效应截距。  

#### 2 统计量计算  
##### ALPHA=$\alpha$  
- 确定固定效应的置信水平($1-\alpha$)  

##### ALPHAP=$\alpha$  
- 确定预测值的置信水平($1-\alpha$)  

##### CHISQ  
- 进行卡方检验  

##### DDF=  
- 指定分母自由度  

##### DDFM=  
- 指定计算分母自由度的方法  
- 取值：DDFM=CONTAIN \| BETWITHIN \| RESIDUAL \| SATTERTHWAITE \| KENWARDROGER<(FIRSTORDER)> \| KENWARDROGER<(LINEAR)> \| KENWARDROGER2  
- 默认值：
	- RANDOM 语句：CONTAIN  
	- REPEATED (with no RANDOM 语句)：BETWITHIN  

##### HTYPE=  
- 选择假设检验的类型  

##### INFLUENCE<(*influence-options*)>  
- requests influence and case-deletion diagnostics  

##### NOTEST  
- 不进行固定效应的假设检验  

##### OUTP=  
- 指定预测值和相关量（relative quantities）的输出数据集  

##### OUTPM=  
- 指定预测均值和相关量的输出数据集

##### RESIDUAL  
- 将 Pearson-type 和 studentized residual 加入到输出数据集中  

##### VCIRY  
- 向数据集中添加按比例缩放的边际残差（scale marginal residual）

#### 3 统计量输出  
##### CL  
- 展现固定效应参数估计的置信限

##### CORRB  
- 展现固定效应参数估计的相关矩阵

##### COVB  
- 展现固定效应参数估计的协方差矩阵

##### COVBI
- 展现固定效应参数估计的逆协方差矩阵

##### E，E1，E2，E3  
- 展现 $\mathbf{L}$ 矩阵系数

##### INTERCEPT  
- 将截距行增加到test tables中  

##### SOLUTION  
- 展现固定效应参数估计（和 GLM 模型中的尺度参数）

#### 4 Singularity Tolerances  
##### SINGCHOL=  
- 调整 Cholesky roots 的灵敏度

##### SINGRES=  
- 调整残差方差的 singularity criterion

##### SINGULAR=  
- 调整 sweeping 的灵敏度  

##### ZETA=  
- 调整形成 type 3函数的灵敏度

