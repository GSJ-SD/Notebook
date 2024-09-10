
## 1 确定SAS变量信息的函数  
---
##### VTYPE  
- 功能：确定变量是字符型还是数值型，分别返回“C”或“N”值。
- 语法：`VTYPE(variable)`  

##### VTYPEX  
- 功能：确定变量是字符型还是数值型。
- 语法：`VTYPEX(expression)`  
	- *expression*：一个计算结果为SAS变量名的表达式。
- 示例：VTYPEX('X' || '1')，X1是一个数值型变量。

##### VLENGTH  
- 功能：返回变量的存储长度（在编译时确定）。
- 语法：`VLENGTH(variable)`  

##### VNAME  
- 功能：返回SAS变量的名称。请注意，还有一个具有相同名称的CALL例程可以完成相同的任务。
- 语法：`VNAME(variable-reference)`  

##### VLABEL  
- 功能：返回与SAS变量关联的标签。如果没有标签与变量关联，函数将返回变量名。如果没有为包含标签的变量指定长度，则默认情况下，该变量的长度为200。
- 语法：`VLABEL(variable)`  

##### CALL VNEXT  
- 功能：确定一个或多个DATA步骤变量的名称、类型和长度。对例程的每次连续调用都会返回SAS数据集中下一个变量的信息。
- 语法：`CALL VNEXT(name <, type <, length>>)`  
- 示例：
	```SAS
	data var_info;
		if 0 then set var;
		length var_name $32 var_type $1;
		do until (missing(var_name));
			call vnext(var_name, var_type, var_length);
			if not missing(var_name) then output;
		end;
		keep var_:;
	run;
	```

##### VVALUE  
- 功能：获取变量的格式化值。这个函数和PUT函数有一些相似之处。例如，如果在DATA步骤中将一个格式与一个变量相关联，那么VVALUE函数将返回一个类似于PUT函数的值，其中PUT函数中的第二个参数就是所讨论的格式。如果您之前没有为生成的变量定义长度，那么它的长度将为200。相反，使用PUT函数创建的变量的长度将是最长的格式化值。
- 语法：`VVALUE(variable)`  


## 2 确定Format信息的函数  
---
##### VFORMAT  
- 功能：返回与变量关联的格式名称。如果格式与字符变量相关联，则名称包括\$，如果包含宽度，则名称包含宽度。对于数值变量，名称还包括小数点右侧的值。例如，可能返回的值为$CHAR15和DOLLAR8.2。
- 语法：`VFORMAT(variable)`  

##### VFORMATD  
- 功能：返回与变量关联的format decimal value。
- 语法：`VFORMATD(variable)`  

##### VFORMATN  
- 功能：返回与变量关联的格式名称。如果格式是字符变量，则名称包括\$，但不包括十进制值的宽度。
- 语法：`VFORMATN(variable)`  

##### VFORMATW  
- 功能：返回与变量关联的格式宽度。
- 语法：`VFORMATW(variable)`  


## 3 确定Informat信息的函数  
---
##### VINFORMAT  
- 功能：返回与变量关联的informat名称。如果信息与字符变量相关联，则名称包括\$，如果包括宽度，则名称包含宽度。对于数值变量，名称还包括小数点右侧的值。例如，可能返回的值为$CHAR15和DOLLAR8.2。
- 语法：`VINFORMAT(variable)`  

##### VINFORMATD  
- 功能：返回与变量相关联的informat decimal value。
- 语法：`VINFORMATD(variable)`  

##### VINFORMATN  
- 功能：返回与变量关联的informat名称。如果信息与字符变量关联，则名称包括\$，但不包括十进制值的宽度。
- 语法：`VINFORMATN(variable)`  

##### VINFORMATW  
- 功能：返回与变量关联的informat名称。如果信息与字符变量关联，则名称包括\$，但不包括十进制值的宽度。
- 语法：`VINFORMATW(variable)`  