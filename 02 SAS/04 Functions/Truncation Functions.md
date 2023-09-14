
## 1 对数值进行截断和取整的函数
---
##### ceil  
- 功能：四舍五入到下一个最大整数。
- 语法：`CEIL(numeric-value)`  
- 示例：
	- CEIL(1.2)：2
	- CEIL(1.8)：2
	- CEIL(-1.2)：-1
	- CEIL(-1.8)：-1

##### floor  
- 功能：四舍五入到下一个最小的整数。
- 语法：`FLOOR(numeric-value)`  
- 示例：
	- FLOOR(1.2)：1
	- FLOOR(1.8)：1
	- FLOOR(-1.2)：-2
	- FLOOR(-1.8)：-2

##### int 
- 功能：去掉一个数字的小数部分。
- 语法：`INT(numeric-value)`  
- 示例：
	- INT(1.2)：1
	- INT(1.8)：1
	- INT(-1.2)：-1
	- INT(-1.8)：-1

##### round 
- 功能：使数值四舍五入。四舍五入可以是最接近的整数或任何期望值，例如最接近的十分之一或最接近的10。
- 语法：`ROUND(numeric-value <, round-off-unit>)`  
	- *round-off-unit*：默认值为1  
- 示例：
	- ROUND(1.2)：1
	- ROUND(1.8)：2
	- ROUND(3.14159, .01)：3.14
	- ROUND(23.1,5)：25
	- ROUND(-1.2)：-1


## 2 返回存储在小于8字节中的SAS数值的函数  
---
##### TRUNC  
- 功能：允许您在数值常量和存储在小于8字节中的SAS数值之间进行比较。请注意，这仅对非整数值是必要的。请务必参考系统配套书籍中的图表，该图表告诉您可以用*n*字节存储表示的最大整数。
- 语法：`TRUNC(numeric-value, length)`  
