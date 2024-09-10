在SAS的GBK环境和unicode环境下，使用PROC SORT过程对中文字符串进行排序会得到不同的结果，要保证在不同环境下运行得到的结果一致，此时需使用locale选项来规定字符串排序规则。  

示例如下：  
```SAS
proc sort data = level1_seq sortseq = linguistic(locale = zh_CN);
	by level1;
quit;
```
