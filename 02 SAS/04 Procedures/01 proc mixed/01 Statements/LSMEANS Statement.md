
帮助文档：[SAS Help Center : LSMEANS Statement](https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.4/statug/statug_mixed_syntax08.htm)  

基础语法：`LSMEANS fixed-effects </options>;`  


LSMEANS 语句计算固定效应的最小二乘均值。与 GLM 过程一样，LS 均值是预测的总体标记，也就是说，它们估计平衡总体上的边际均值。  

### Options  
#### 1 LS 均值的构建和计算  
##### 1.1 AT  
- 计算 LS-means 时调整协变量值。
- 语法：
	- `AT variable=value`  
	- `AT (variable-list)=(value-list)`  
	- `AT MEANS`  

##### 1.2 BYLEVEL  
- 计算单独的margins。

##### 1.3 DIFF  
- 求 LS-means 的差值。
- 语法：
	- `DIFF<=difftype>`  
	- `PDIFF<=difftype>`  
- 可选的 *difftype* 指定要产生哪些差异，可选值为：ALL、CONTROL、CONTROLL和CONTROLU。
- 示例：效应A、B、C、D是分类变量，每个分类变量有两个级别1和2，指定A\*B的(1,2)级别和B\*C的(2,1)级别作为对照：`lsmeans A*B B*C / diff=control('1' '2' '2' '1')`。  

##### 1.4 OM<=*OM-data-set*>  
- 指定 LS-mean 计算的加权方案。

##### 1.5 SINGULAR  
- 调整 estimability checking。

##### 1.6 SLICE=  
- 分区 *F* 检验（simple effects）  
- 指定用于划分交互 LAMEANS 效应的effects。 
- 示例：假设A\*B显著，并且想要测试A对B的每个水平的影响，适当的LAMEANS语句如下：
	- `lsmeans A*B / slice=B;`  

#### 2 自由度和 *p*  值
##### 2.1 ADJDFE=   
- 确定是否使用 DDFM=SATTERTHWAITE、DDFM=KENWARDROGER或DDFM=KENWARDROGER2 计算 rowwise 分母自由度。  
- 取值：ADJDFE=SOURCE \| ROW 
	- SOURCE：“Type 3 Tests of Fixed Effects”中 LS-mean effect 的分母自由度  
	- ROW：对应于 “Differences of Least Squares Means” 中的自由度
- 默认值：SOURCE

##### 2.2 ADJUST=  
- 确定 LS-means 差异多重比较校正的方法。  
- 取值：ADJUST=BON \| DUNNETT \| SCHEFFE \| SIDAK \| SIMULATE \| SMM(GT2) \| TUKEY  

##### 2.3 ALPHA=$\alpha$   
- 确定置信水平 $(1-\alpha)$ 。

##### 2.4 DF=  
- 为检验和置信限的自由度分配指定值。

#### 3 Statistical Output  
##### 3.1 CL  
- 计算均值和/或均值差值的置信限。  

##### 3.2 CORR  
- 展现 LS-means 的相关矩阵。  

##### 3.3 COV  
- 展现 LS-means 的协方差矩阵。  

##### 3.4 E  
- 打印 $\mathbf{L}$ 矩阵。  
