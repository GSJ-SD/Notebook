
帮助文档：[SAS Help Center : RANDOM Statement](https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.4/statug/statug_mixed_syntax13.htm)  

基础语法：`RANDOM random-effects </options>;`  

### Options  
#### 1 协方差结构构建  
##### GDATA=  
- 请求从数据集中读入 $\mathbf{G}$ 矩阵

##### GROUP=*effect* \| GRP=*effect*
- 协方差参数按组变化  

##### LDATA=
- 当 TYPE=LIN 时指定系数矩阵数据集  

##### NOFULIZ  
- 根据缺失值消除 $\mathbf{Z}$ 中的列  

##### RATIOS  
- 指示在 GDATA= 数据集中指定ratios  

##### SUBJECT=*effect* \| SUB=*effect*  
- 指示模型中的subjects  

##### TYPE=  
- 指定 $\mathbf{G}$ 的协方差结构
- 取值：参见[SAS Help Center : Table 81.17 Covariance Structures](https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.4/statug/statug_mixed_syntax14.htm#statug.mixed.mixedcovstruct)  

#### 2 统计量输出  
##### ALPHA=$\alpha$  
- 确定置信水平($1-\alpha$)  

##### CL  
- 请求随机效应预测因子的置信限

##### G  
- 展现估计的 $\mathbf{G}$ 矩阵

##### GC  
- 展现估计的 $\mathbf{G}$ 矩阵的 Cholesky root (lower)

##### GCI  
- 展现估计的 $\mathbf{G}$ 矩阵的 inverse Cholesky root (lower)

##### GCORR  
- 根据 $\mathbf{G}$ 矩阵展现相关矩阵  

##### GI  
- 展现估计的 $\mathbf{G}$ 矩阵的 inverse  

##### SOLUTION \| S   
- 展现 G-side random effects 的解 $\mathbf{\hat{\gamma}}$   

##### V  
- 展现估计的 $\mathbf{V}$ 矩阵  

##### VC  
- 展现估计的 $\mathbf{V}$ 矩阵块的 lower-triangular Cholesky root

##### VCI  
- 展现估计的 $\mathbf{V}$ 块的逆Cholesky root

##### VCORR  
- 依据估计的 $\mathbf{V}$ 矩阵块展现相关矩阵  

##### VI  
- 展现估计的 $\mathbf{V}$ 矩阵块的 inverse  

