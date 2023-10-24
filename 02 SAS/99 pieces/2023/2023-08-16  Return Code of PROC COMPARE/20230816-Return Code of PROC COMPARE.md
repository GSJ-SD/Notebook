📗参考资料：
\[1\][SAS Help Center: Results: PROC COMPARE](https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/proc/n1jbbrf1tztya8n1tju77t35dej9.htm)  
\[2\][A Practical Use of Bitwise Encoding in SAS® ](https://www.lexjansen.com/pharmasug-cn/2019/AD/Pharmasug-China-2019-AD61.pdf)  

## 1 MACRO Return Codes (SYSINFO)
PROC COMPARE 将返回码（return code）存储在自动宏变量 SYSINFO 中。 返回码的值提供有关比较结果的信息。  
通过在 PROC COMPARE 运行之后和任何其他步骤开始之前检查 SYSINFO 的值（SYSINFO的值将在PROC COMPARE过程结束后的下一个步骤开始处重置），SAS 宏可以使用 PROC COMPARE 步骤的结果来确定要采取的操作或要执行 SAS 程序的哪些部分。
下表是解释 PROC COMPARE 的 SYSINFO 返回码的关键。 对于列出的每个条件（condition），如果条件为真，则关联的值将添加到返回码中。 因此，<font color = #ff0000>SYSINFO 返回码是下表中针对适用条件列出的代码的总和</font>：  
![ReturnCodeTable](ReturnCodeTable.png)
SYSINFO 的最终值是代码中所有 SYSINFO 实例的累积值。【示例1】例如，如果运行以下示例代码（数据集具有不同的标签和不等值），SYSINFO 的第一个实例生成返回码 32，第二个实例生成返回码 4096。这两个值相加在一起生成最终返回码 4128。  
```SAS
/*数据集具有不同的标签和不等值 -- RC is 4128*/
data class1;
   set sashelp.class;
   label sex='Gender';
run;
data class2;
   set sashelp.class;
   if name="Jeffrey" then name="Jeff";
run;

proc compare base=class1 comp=class2;
run;

%let rc=&sysinfo
%put 'RC' &rc
```

![ProcCompareBitEncoding1](ProcCompareBitEncoding1.png)

如上述示例，如果Base数据集与Comparison数据集间存在多种不一致的情况，要如何从最终累积的SYSINFO中判别出来呢？

## 2 二进制（Binary）
我们非常熟悉的十进制，使用10个数字0-9，十进制数字中的每个“列”（column）代表10的列数减1的幂。

![image-20230804112410865](image-20230804112410865.png)

二进制，顾名思义，它只使用0和1这两个数字，列表示2的列数减去1的幂：

![image-20230804112527562](image-20230804112527562.png)

因此，==SYSINFO的return codes转换为二进制后即为==：

![image-20230804113012239](image-20230804113012239.png)

可以看到，转换为二进制（Binary）后，二进制值一共有16位，对应16个Bit。每一个Code的二进制值在相应的Bit上的值为1，其余均为0，如此可以很容易地分辨出累积值中的各个code。  
【示例2】例如，如果COMPARE过程确定比较的数据集具有以下差异：  
- 数据集具有不同的数据集标签
- 两个数据集中的公共变量具有不同的长度
- 值比较显示值不等  
retrun code将会有以下结果：  

![image-20230804113908496](image-20230804113908496.png)

如上，最终的return code为4113，==转换为二进制后，可以从中识别出每个Code的信息（每个Code对应的Bit上值为1）==。  
据此，可以将return code转换为二进制值后再对其进行识别。

## 3 位测试（Bit testing）与位掩码（Bit-mask）
### 3.1 位测试
位测试操作的一般形式是：  
`expression comparison-operator bit-mask`
位测试操作的组成部分为：  
- expression
  - 可以是任何有效的SAS表达式。字符和数字变量都可以进行位测试。
  - 当SAS测试一个字符值时，<font color = #ff0000>它将掩码的最左边与字符串的最左边对齐</font>；位测试通过相应的位进行，向右移动。
  - SAS测试==数值==时，该值会从浮点数截断为32位整数。<font color = #ff0000>掩码的最右边与数字的最右边对齐</font>，位测试通过相应的位向左移动。
- comparison-operator
  - 将表达式与位掩码进行比较。
### 3.2 位掩码
位掩码（bit-mask）是一个由0、1和英文句点（.）组成的字符串，后面紧跟着一个B（可为小写，可为大写），如'..1.0000’b。  
零（0）测试位是否关闭；一（1）测试位是否打开；<font color = #ff0000>点（.）表示忽略该位（bit）（即不对该位点进行测试/比对）</font>。  
在不影响其含义的情况下，可以在位掩码中插入逗号和空格以提高可读性。  
==注意==：
- SAS使用位掩码时可能会发生截断。  <font color = #ff0000>如果表达式比位掩码长，SAS会在表达式与位掩码进行比较之前截断该表达式。</font>可能会导致错误的比较。

## 4 程序示例
基于以上内容，可对SYSINFO的最终值使用以下程序进行识别：
```SAS
/* First trap SYSINFO's value because it will be reset to 0 by any subsequent procedure or data step */
%let _sysinfo = &sysinfo;
/* Test each bit in turn to see if it's set or not */
data _null_;
 if &_sysinfo = '...............1'b then put 'Bit 1 was set!';
 if &_sysinfo = '..............1.'b then put 'Bit 2 was set!';
 if &_sysinfo = '.............1..'b then put 'Bit 3 was set!';
 if &_sysinfo = '............1...'b then put 'Bit 4 was set!';
 if &_sysinfo = '...........1....'b then put 'Bit 5 was set!';
 if &_sysinfo = '..........1.....'b then put 'Bit 6 was set!';
 if &_sysinfo = '.........1......'b then put 'Bit 7 was set!';
 if &_sysinfo = '........1.......'b then put 'Bit 8 was set!';
 if &_sysinfo = '.......1........'b then put 'Bit 9 was set!';
 if &_sysinfo = '......1.........'b then put 'Bit 10 was set!';
 if &_sysinfo = '.....1..........'b then put 'Bit 11 was set!';
 if &_sysinfo = '....1...........'b then put 'Bit 12 was set!';
 if &_sysinfo = '...1............'b then put 'Bit 13 was set!';
 if &_sysinfo = '..1.............'b then put 'Bit 14 was set!';
 if &_sysinfo = '.1..............'b then put 'Bit 15 was set!';
 if &_sysinfo = '1...............'b then put 'Bit 16 was set!';
run;
```

如【示例1】，则有SYSINFO = 32 + 4096 = 4128 = ‘0001000000100000’b，从右往左，第6位和第13位上数值为1，其余位上为0，使用上述程序进行匹配（.表示忽略此位不进行比较），则会分别匹配到Bit 6和Bit 13。  
![ProcCompareBitEncoding2](ProcCompareBitEncoding2.png)

根据SAS使用位掩码时先将表达式与位掩码对齐后再进行截断比较的特性，还可以将上述程序简化为：
```SAS
proc compare base=SAS-data-set
             compare=SAS-data-set;
run;

%let rc=&sysinfo;
data _null_;
   /* Test for data set label */
   if &rc = '1'b then
      put '<<<< Data sets have different labels';
/* Test for data set types */
   if &rc = '1.'b then
      put '<<<< Data set types differ';
/* Test for label */
   if &rc = '1.....'b then
      put '<<<< Variable has different label';
/* Test for base observation */
if &rc = '1......'b then
      put '<<<< Base data set has observation not in comparison data set';
/* Test for length */
   if &rc = '1....'b then
      put '<<<< Variable has different lengths between the base data set 
      and the comparison data set';
/* Variable in base data set not in compare data set */
   if &rc ='1..........'b then 
      put '<<<< Variable in base data set not found in comparison data set';
/* Comparison data set has variable not in base data set */
   if &rc = '1...........'b then
      put '<<<< Comparison data set has variable not contained in the 
      base data set';
/* Test for values */
   if &rc = '1............'b then
      put '<<<< A value comparison was unequal';
/* Conflicting variable types */
   if &rc ='1.............'b then
      put '<<<< Conflicting variable types between the two data sets 
      being compared';
run;
```

以上即为SAS Help Center中提供的SYSINFO信息辨别程序。