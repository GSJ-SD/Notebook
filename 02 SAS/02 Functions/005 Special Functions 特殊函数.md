
## 1 从前面的观测值中取值的函数  
---
##### LAG and LAG*n*  
- 功能：从以前的观测或当前观测之前的*n*个观测中获得变量的值。
- 语法：`LAG(value)`  `LAGn(VALUE)`  
- 注意：*value*可以是任何数值变量；*n*是滞后的数目，LAG等价于LAG1。

##### DIF and DIF*n*  
- 功能：计算当前观测值与一个或多个先前观测值之间的差值。注意，DIF（X）等效于X–LAG（X）。
- 语法：`DIF(value)`  `DIFn(value)`  


## 2 字符与数字之间转换的函数  
---
##### INPUT  
- 功能：进行字符到数字的转换。在将日期等字符值转换为真正的SAS数字日期值时也很有用。
- 语法：`INPUT(value, informat)`  

##### INPUTC  
- 功能：与INPUT函数类似，只是可以在运行时指定字符信息。
- 语法：`INPUTC(value, char-informat)`  
- 示例：VALUE1 = 1，INFOR1 = "$GENDER."，则有：INPUT(VALUE1, INFOR1)="Male"。

##### INPUTN  
- 功能：与INPUT函数类似，只是可以在运行时分配数字信息。
- 语法：`INPUTN(value, num-informat)`  

##### PUT 
- 功能：执行数字到字符的转换或从用户定义的格式创建字符变量。PUT函数的结果总是一个字符值。
- 语法：`PUT(value, format)`  

##### PUTC  
- 功能：类似于PUT函数，只是可以在运行时指定字符格式。
- 语法：`PUTC(value, char-format)`  

##### PUTN  
- 功能：类似于PUT函数，只是可以在运行时指定数字格式。
- 语法：`PUTN(value, numeric-format)`  


## 3 将变量值设置为SAS缺失值的函数  
---
##### CALL MISSING  
- 功能：将其所有参数（数字或字符）设置为SAS缺失值。
- 语法：`CALL MISSING(<of> variable-1 <, ... variable-n>)`  