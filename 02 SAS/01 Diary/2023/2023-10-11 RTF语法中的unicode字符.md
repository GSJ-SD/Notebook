在 `pretext` 和 `posttext` 两个字段中，无法使用SAS自定义的特殊转义字符（如`^` 和 `@`），此时仅能使用RTF语法来实现特殊字符的输出显示。

示例：需要输出特殊字符：`®`，若使用以下程序，RTF无法解析：  
```SAS
%let rtf_name1       = 表5.1.5 受试者分布 与cobas^{unicode 00ae} EGFR Mutation Test v2比对;/*填写图表标题*/

proc report data = rptdata split = "~" 
            style(report)={ protectspecialchars=on  asis=on  just=c outputwidth=100%
	                            fontfamily="Times New Roman" fontsize=10.5pt
	                            pretext="&pretext"
	                            posttext="\ql\fs21&posttext"}
```

此时需要使用RTF自带的转义写法，对于unicode字符，以 `\u` 标志开始，注意要将 `00ae` 转换为10进制（因为RTF仅能识别十进制字符；转换可使用windows自带字符映射表+计算器），最后以 `;` 结尾（注意需要使用 `%str` 屏蔽 `;` 的转义）。  
```SAS
%let rtf_name1       = 表5.1.5 受试者分布 与cobas\u174%str(;) EGFR Mutation Test v2比对;/*填写图表标题*/
```
