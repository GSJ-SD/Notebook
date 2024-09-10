
### 1 参考资料 
[1]王治国.临床检验方法比较研究中回归分析方法的介绍[J].陕西医学检验,1996,(02):18-20.  
[2]胡丽涛,王薇,王治国.回归和多元分析在参考物质互换性研究中的应用[J].中国卫生统计,2012,29(03):462-464.  
[3]Kristian Linnet, Performance of Deming regression analysis in case of misspecified analytical error ratio in method comparison studies, _Clinical Chemistry_, Volume 44, Issue 5, 1 May 1998, Pages 1024–1031, [https://doi.org/10.1093/clinchem/44.5.1024](https://doi.org/10.1093/clinchem/44.5.1024)  
\[2\][Deming regression for comparing different measurement methods - The DO Loop (sas.com)](https://blogs.sas.com/content/iml/2019/01/07/deming-regression-sas.html)  

### 2 公式及简介  
#### 2.1 简介  

Deming回归，假设两个测量程序 $X$ 和 $Y$ 所得的结果都含有误差，其对回归模型斜率和截距的估计是根据观察点到回归线的垂直距离的平方和最小。  

Deming 回归不需要 $X$ 和 $Y$ 数据方差相等，当方差不相等时根据观察点到回归线的非垂直（合适的角度）距离平方和最小，但前提是假设方差在数据范围内是恒定的。  

当 $X$ 和 $Y$ 的标准差在测量范围内都近似恒定，可以对测量结果的重复均值使用常规的 Deming 回归分析方法。若方差不是常数而是与浓度成比例，推荐使用加权 Deming 回归分析或者非加权 Deming 回归分析对结果进行对数转换<sup>[2]</sup>。  

#### 2.2 计算公式  

设有 $k$ 对观测值 $(x_i,y_i)$ 的基础上，其离差平方和和交叉乘积和为：  
$$\begin{align}
u= &\Sigma(x_i-\bar{x})^2;\ \ q=\Sigma(y_i-\bar{y})^2 \\
p= &\Sigma(x_i-\bar{x})(y_i-\bar{y})
\end{align}
$$  

假定标准差固定，给定<font color=blue>双份测定</font>（$x_{1i}$ 和 $x_{2i}$ ，$y_{1i}$ 和 $y_{2i}$），分析标准差估计为  
$$\begin{align}
(SD_{ax})^2= &(1/2k)\Sigma(x_{1i}-x_{2i})^2 \\
(SD_{ay})^2= &(1/2k)\Sigma(y_{1i}-y_{2i})^2
\end{align}
$$  
可求分析标准差平方的比值：  
$$\hat{\lambda}=\frac{(SD_{ax})^2}{(SD_{ay})^2}$$  
回归线估计如下：  
$$\begin{align}
&b=\frac{(\hat{\lambda}q-u)+\sqrt{(u-\hat{\lambda}q)^2+4\hat{\lambda}p^2}}{2\hat{\lambda}p}  \\
&a=\bar{y}  \\
&a_0=a-b\bar{x}  \\
&\hat{Y_i}=a+b(\hat{X_i}-\bar{x})=a_0+b\hat{X_i}
\end{align}
$$  
#### 2.3 单次测量时的考虑  

应用 Deming 回归分析的前提是指定分析标准差平方的比值，但在每种测量方法近设计单次测量的情况下，该比值可能是未知的，并且通常被指定为默认值1<sup>[3]</sup>。  

### 3 SAS实现  

待补充。