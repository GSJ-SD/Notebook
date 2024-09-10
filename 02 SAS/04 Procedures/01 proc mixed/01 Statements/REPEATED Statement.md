
帮助文档：[SAS Help Center : REPEATED Statement](https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.4/statug/statug_mixed_syntax14.htm)  

基础语法：`REPEATED <repeated-effect> </options>;`  

### Options  
#### 1 协方差结构的构造  
##### GROUP=  
- 定义在 R-side 协方差结构中指定异质性的 effect

##### LDATA=  
- 为 TYPE=LIN 指定具有系数矩阵的数据集

##### LOCAL  
- 要求将对角矩阵（diagonal matrix）增加到 $\mathbf{R}$ 中

##### LOCALW  
- 指定只有 local effects 被加权

##### NONLOCALW  
- 指定只有 nonlocal effects 被加权

##### SUBJECT=  
- 定义 R-side model 中的 subjects

##### TYPE=  
- 指定 R-side 协方差结构  
- 取值：参见[SAS Help Center : Table 81.17 Covariance Structures](https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.4/statug/statug_mixed_syntax14.htm#statug.mixed.mixedcovstruct)  

#### 2 统计量输出  
##### HLM  
- 产生 Hotelling-Lawley-McKeon 统计量的表格  

##### HLPS  
- 产生 Hotelling-Lawley-Pillai-Samson 统计量的表格  

##### R  
- 展现估计的 $\mathbf{R}$ 矩阵块  

##### RC  
- 展现估计的 $\mathbf{R}$ 矩阵块的 Chplesky root (lower)  

##### RCI  
- 展现估计的 $\mathbf{R}$ 矩阵块的 inverse Cholesky root (lower)

##### RCORR  
- 根据估计的 $\mathbf{R}$ 矩阵块展现线管矩阵  

##### RI  
- 展现估计的 $\mathbf{R}$ 矩阵块的 inverse  

