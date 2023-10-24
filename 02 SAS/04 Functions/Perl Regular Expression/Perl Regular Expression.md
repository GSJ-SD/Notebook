
📌
正则表达式教程：[https://www.runoob.com/regexp/regexp-tutorial.html](https://www.runoob.com/regexp/regexp-tutorial.html)  
正则表达式在线测试1：[https://c.runoob.com/front-end/854/](https://c.runoob.com/front-end/854/)  
正则表达式在线测试2（支持预查语法）：[https://tool.oschina.net/regex](https://tool.oschina.net/regex/)  
正则表达式可视化：[https://jex.im/regulex/#!flags=&re=](https://jex.im/regulex/)  
正则表达式练习：[https://www.codejiaonang.com/#/course/regex_chapter1/0/0](https://www.codejiaonang.com/)  
正则表达式练习：[https://www.codejiaonang.com/#/course/regex_chapter2/0/0](https://www.codejiaonang.com/)  

## 1 PRXPARSE Function  

编译一个 Perl 正则表达式（PRX），该表达式可用于字符值的 pattern matching。  

注意：
- 该功能被指定为 I18N Level 0 状态，专为SBCS数据设计。请勿使用此函数处理DBCS或MBCS数据。  
- SAS采用了Unicode的国际组件（ICU）。ICU使SAS能够将正则表达式匹配应用于Unicode字符串数据。  

### 1.1 语法

```SAS
regular-expression-id=PRXPARSE(perl-regular-expression)
```

#### 1.1.1 必要参数  

- **_regular-expression-id_**  
	- 是由 PRXPARSE 函数返回的数值型 pattern 标识符。  
- **_perl-regular-expression_**  
	- 指定一个字符值，该值是Perl正则表达式。  

### 1.2 注意事项  

- PRXPARSE 函数返回一个模式标识符编号，其他 Perl 函数和 CALL 例程使用该编号来匹配 pattern。如果解析正则表达式时出错，SAS将返回一个缺失的值。  

- 如果 perl 正则表达式是常量，或者它使用/o选项，则 perl 正则表达式只编译一次。对 PRXPARSE 的连续调用不会导致重新编译，但会返回已编译的正则表达式的正则表达式 id 。这种行为简化了代码，因为您不需要使用初始化块（IF_N_=1）来初始化 Perl 正则表达式。  

- 如果有一个常量 Perl 正则表达式，或者该正则表达式使用/o选项，那么调用 PRXFREE 以释放内存分配会导致在下次被 PRXPARSE 调用时需要重新编译该正则表达式。在 DATA 步骤中使用 PRXPARSE 时会发生一次编译行为。对于所有其他用途，每次调用 PRXPARSE 都会重新编译 perl 正则表达式。  

## 2 PRXMATCH Function  

搜索匹配的 pattern 并返回找到该 pattern 的位置。  

### 2.1 语法  

```SAS
PRXMATCH(regular-expression-id | perl-regular-expression, source)  
```

#### 2.1.1 必要参数  

- **_regular-expression-id_**  
	- 指定一个数值变量，该变量的值是从PRXPARSE函数返回的模式标识符。  
- **_perl-regular-expression_**  
	- 指定字符常量、变量或具有Perl正则表达式值的表达式。  
- **_source_**  
	- 指定要搜索的字符常量、变量或表达式。  

## 3 程序示例  

程序示例1：  
```SAS
data _null_;
	patternID = prxparse('/world/');
	position = prxmatch(patternID, 'Hello world!');
	put position=;
run;
```

程序示例2：  
```SAS
data ZipCodes;
	input name:$16. zip:$10.;
	datalines;
Johnathan 32523-2343
Seth 39204
Samuel 93849-3843
;

data ZipPlus4;
	set ZipCodes;
	where prxmatch('/\d{5}-\d{4}/',zip);
run;
proc print data=ZipPlus4;
run;
```

注：PRXPARSE函数的自变量是一个标准的Perl正则表达式。在本例中，使用正斜杠（/）作为正则表达式的分隔符。你可以选择其他字符作为分隔符，只要表达式的开头和结尾为相同的分隔符。正斜杠最常用作正则表达式的分隔符表达式。  

