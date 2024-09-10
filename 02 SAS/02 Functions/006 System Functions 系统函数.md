
### SYSGET   
- 返回指定的操作环境变量的值。  
- 语法：`SYSGET(operating-environment-variable)`  
	- _operating-environment-variable_：是一个字符常量、变量或表达式，其值是操作环境变量的名称。操作环境变量的情况必须与存储在操作环境中的情况一致。SYSGET参数中的尾随空格意义重大。使用TRIM功能将其移除。  
- 注意  
	- 如果SYSGET函数向尚未指定长度的变量返回一个值，则默认情况下，该变量的长度为200。  
	- 如果操作环境变量的值被截断或未在操作环境中定义该变量，SYSGET会在SAS日志中显示警告消息。  

### %SYSFUNC and %QSYSFUNC Functions  
- 执行SAS 函数或用户编写的函数。  
- 语法  
	- `%SYSFUNC(function(argument-1 <...argument-n>)<, format>)`  
	- `%QSYSFUNC(function(argument-1 <...argument-n>)<, format>)`  
- 参数
	- **_function_**：需执行的函数名称。可以是 SAS 函数、SAS/TOOLKIT 软件写入的函数，或者使用 FCMP 过程创建的函数；但不能是宏函数。  
	- **_argument-1 <...argument-n>_**：是函数使用的一个或多个参数。参数可以是宏变量引用，也可以是为函数生成参数的文本表达式。如果参数可能包含下面列出的特殊字符或助记符，请使用%QSYSFUNC：`& % ' " ( ) + - * / < > = ¬ ^ ~ ; , #  blank AND OR NOT EQ NE LE LT GE GT IN`  
	- **_format_**：是应用于函数结果的可选格式。此格式可以由 SAS 提供，也可以由 PROC FORMAT 生成，也可以使用 SAS/TOOLKIT 创建。格式没有默认值。如果未指定格式，则 SAS Macro Facility 不会对结果执行格式化操作，而是使用函数的默认值。  
- 细节
	- 因为 %SYSFUNC 是一个宏函数，<font color=blue>所以不需要像在DATA步骤函数中那样用引号括起字符值</font>。例如，当函数单独使用时，OPEN 函数的参数用引号括起来，但在 %SYSFUNC 中使用时不需要引号。  
		- 示例1：`dsid=open("sasuser.houses,"i");`  
		- 示例2：`%let dsid=%sysfunc(open(sasuser.houses,i));`  
		- 示例3：`dsid=open("&mydata","&mode");`  
		- 示例4：`%let dsid=%sysfunc(open(&mydata,&mode));`  
	- %SYSFUNC 中 DATA 步骤函数中的所有参数必须用逗号分隔。不能在参数列表前使用单词OF。  
	- %SYSFUNC 的参数根据 SAS 宏语言的规则进行评估。这包括函数名称和函数的参数列表。特别是，空的参数位置不会生成 NULL 参数，而是生成长度为零的参数。  
	- 当%SYSFUNC或%QSYSFUNC调用的函数需要数值型参数时，宏功能会将该参数转换为数值。%SYSFUNC和%QSYSFUNC执行的函数支持浮点数时，它们可以返回浮点数。  
	- 使用INPUTN、INPUTC、PUTN和PUTC，而不是使用%SYSFUNC和%QSYSFUNC不可用的INPUT和PUT。  
- 参考文献
	- [SUGI 23: %SYSFUNC - The Brave New Macro World (sas.com)](https://support.sas.com/resources/papers/proceedings/proceedings/sugi23/Advtutor/p44.pdf)  

#### SAS Functions Not Available with %SYSFUNC and %QSYSFUNC  

| 1                                  | 2       | 3        |
| ---------------------------------- | ------- | -------- |
| DIF                                | DIM     | HBOUND   |
| IORCMSG                            | INPUT   | LAG      |
| LBOUND                             | LEXCOMB | LEXCOMBI |
| LEXPERK                            | LEXPERM | MISSING  |
| PUT                                | RESOLVE | SYMGET   |
| All Variable Information Functions | ALLCOMB | ALLPERM  |


