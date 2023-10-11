
帮助文档：[SAS Help Center : CLASS Statement](https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.4/statug/statug_mixed_syntax03.htm)  

基础语法：`CLASS variable <(REF = option)> ... <variable <(REF = option)>> </ global-options>;`  

注意：
- CLASS 语句指定要在模型中使用的分类变量。如果使用 CLASS 语句，它必须出现在 MODEL 语句之前。  
- 分类变量可以是字符或数值。默认情况下，class levels由 CLASS 变量的整个格式化值集确定。  


可以在variable后面指定 REF= 选项，指定如何对单个分类变量的levels进行排序：
- REF = '_level_' \| FIRST \| LAST  

可以在斜杠（/）后指定global-options（用于 CLASS 语句中所有分类变量）：
- REF = FIRST \| LAST  
- TRUNCATE：指定通过仅使用 CLASS 变量格式化值的前16个字符来确定类级别。当格式化值超过16个字符时，可以使用此选项恢复到SAS 9之前的版本中定义的levels。

