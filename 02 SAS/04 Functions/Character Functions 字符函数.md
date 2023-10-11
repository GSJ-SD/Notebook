
## 1 大小写转换  
---
##### UPCASE  
- 功能：将全部字符转换为大写  
- 语法：`UPCASE(Character-value)`  
- 注意：可使用`put(character-value,$UPCASE.)`，可实现相同的效果。  

##### LOWCASE  
- 功能：将全部字符转换为小写  
- 语法：`LOWCASE(character-value)`  

##### PROPCASE  
- 功能：令字符串中（每个由字符串分隔开的）子串首字母大写（分隔符默认为空白、正斜杠、连字符、左括号、句点和制表符）  
- 语法：`PROPCASE(character-value <,delimiters>)`  
	- *delimiters*：指定分隔符


## 2 从字符串中删除字符  
---
##### COMPBL  
- 功能：将字符串中一个以上的空格替换为一个空格  
- 语法：`COMPBL(character-value)`  

##### COMPRESS  
- 功能：从字符串中删除指定内容；若未指定，默认删除空格  
- 语法：`COMPRESS(character-value <,'compress-list'> <,'modifiers>')`  
	- *compress-list*：指定要删除的字符
	- *modifiers*：修饰符
		- a or A：*compress-list*包括所有大写、小写的字母（alphabetic characters）
		- c or C：*compress-list*中包括控制字符
		- d or D：*compress-list*中包括数字
		- f or F：*compress-list*中包括下划线字符和英文字母
		- g or G：*compress-list*中包括图形字符（graphic characters）
		- h or H：*compress-list*中包括水平的制表符（horizontal tab）
		- i or I：忽略大小写
		- k or K：保留*compress-list*中的字符而非删除
		- l or L：*compress-list*中包括小写字母
		- n or N：*compress-list*中包括数字、下划线和英文字母
		- o or O：处理第二个和第三个参数一次，而不是每次调用COMPRESS函数。在DATA步骤（不包括WHERE子句）或SQL过程中使用O修饰符，可以使COMPRESS在第二个和第三个参数不变的循环中调用时运行得更快。
		- p or P：*compress-list*包括标点符号
		- s or S：*compress-list*中包括空格字符（空白、水平制表符、垂直制表符、回车符、换行符、换页符和 NBSP（'A0'x 或 160 十进制 ASCII））。
		- t or T：删除第一个参数和第二个参数的尾部空格
		- u or U：*compress-list*中包括大写字符
		- w or W：*compress-list*中包括可打印字符
		- x or X：*compress-list*中包括十六进制字符
		- TIP：如果修饰符是常量，请将其括在引号中。 在一组引号中指定多个常量。 修饰符也可以表示为变量或表达式。


## 3 定位字符位置  
---
##### ANYALNUM  
- 功能：定位字母数字字符（任何大写或小写字母或数字）的第一次出现并返回其位置。 如果没有找到，该函数返回 0。通过使用可选参数，该函数可以从字符串中的任何位置开始搜索，如果需要，还可以从右向左搜索。
- 语法：`ANYALNUM(character-value <,start>)`
- 注意：*start*是一个可选参数，指定字符串中开始搜索的位置。 如果省略，则从字符串的开头开始搜索。 如果它非零，则从字符串中数字绝对值的位置开始搜索（从字符串中最左边的位置开始）（<font color=red>但返回的是从右至左开始的绝对位置</font>）。 如果起始值为正，则从左向右搜索； 如果值为负，则从右向左搜索。 大于字符串长度的负值会导致从右到左扫描，从字符串末尾开始。 如果*start*的值为大于字符串长度的正数，或者为 0，则函数返回 0。

##### ANYALPHA  
- 功能：定位字母字符（任何大写或小写字母）的第一次出现并返回其位置。 如果没有找到，该函数返回 0。通过使用可选参数，该函数可以从字符串中的任何位置开始搜索，如果需要，还可以从右向左搜索。
- 语法：`ANYALPHA(character-value <,start>)`  

##### ANYDIGIT  
- 功能：定位digit（numeral）的第一次出现并返回其位置。 如果没有找到，该函数返回 0。通过使用可选参数，该函数可以从字符串中的任何位置开始搜索，如果需要，还可以从右向左搜索。
- 语法：`ANYDIGIT(character-value <,start>)`  

##### ANYPUNCT  
- 功能：定位标点字符的第一次出现并返回其位置。 如果没有找到，该函数返回 0。通过使用可选参数，该函数可以从字符串中的任何位置开始搜索，如果需要，还可以从右向左搜索。
- 语法：`ANYPUNCT(character-value <,start>)`  

##### ANYSPACE  
- 功能：定位第一次出现的空白字符（空白、水平或垂直制表符、回车符、换行符和换页符）并返回其位置。 如果没有找到，该函数返回 0。通过使用可选参数，该函数可以从字符串中的任何位置开始搜索，如果需要，还可以从右向左搜索。
- 语法：`ANYSPACE(character-value <,start>)`  

##### ANYUPPER  
- 功能：定位大写字母第一次出现的位置并返回其位置。 如果没有找到，该函数返回 0。通过使用可选参数，该函数可以从字符串中的任何位置开始搜索，如果需要，还可以从右向左搜索。
- 语法：`ANYUPPER(character-value <,start>)`  

##### ANYLOWER  
- 功能：找到第一次出现的小写字母并返回其位置。 如果没有找到，该函数返回 0。通过使用可选参数，该函数可以从字符串中的任何位置开始搜索，如果需要，还可以从右向左搜索。
- 语法：`ANYLOWER(character-value <,start>)`  

##### NOTALNUM  
- 功能：确定字符串中非字母数字（任何大写或小写字母或数字）的第一个字符的位置。 如果没有找到，该函数返回 0。通过使用可选参数，该函数可以从字符串中的任何位置开始搜索，如果需要，还可以从右向左搜索。
- 语法：`NOTALNUM(character-value <,start>)`  

##### NOTALPHA  
- 功能：确定字符串中第一个非大写或小写字母（字母字符）的字符的位置。 如果没有找到，该函数返回 0。通过使用可选参数，该函数可以从字符串中的任何位置开始搜索，如果需要，还可以从右向左搜索。
- 语法：`NOTALPHA(character-value <,start>)`  

##### NOTDIGIT  
- 功能：确定字符串中第一个非数字字符的位置。 如果没有找到，该函数返回 0。通过使用可选参数，该函数可以从字符串中的任何位置开始搜索，如果需要，还可以从右向左搜索。
- 语法：`NOTDIGIT(character-value <,start>)`  

##### NOTUPPER  
- 功能：确定字符串中第一个非大写字母的字符的位置。 如果没有找到，该函数返回 0。通过使用可选参数，该函数可以从字符串中的任何位置开始搜索，如果需要，还可以从右向左搜索。
- 语法：`NOTUPPER(character-value <,start>)`  

##### NOTLOWER  
- 功能：确定字符串中第一个非小写字母的字符的位置。 如果没有找到，该函数返回 0。通过使用可选参数，该函数可以从字符串中的任何位置开始搜索，如果需要，还可以从右向左搜索。
- 语法：`NOTLOWER(character-value <,start>)`  

## 4 查找字符
---
##### FIND  
- 功能：定位字符串中的子字符串。 使用可选参数，您可以定义搜索的起点、设置搜索方向并忽略大小写或尾随空格。
- 语法：`FIND(character-value, find-string <,'modifiers'> <,start>)`  
	- *modifiers*：可为大写或小写，可以被括在单引号或双引号中；可为以下取值：
		- i：忽略大小写
		- t：忽略字符变量和*find-string*中的尾部空格。
- 注意：*find-string*是一个字符变量或字符串文字，其中包含一个或多个要搜索的字符。 该函数返回包含查找字符串的字符值中的第一个位置。 如果未找到查找字符串，则该函数返回 0。
- 示例：`STRING1 = "Hello hello goodbye"`，`STRING2 = "hello"`，FIND函数的使用示例为：
	`FIND(STRING1, STRING2, 'i')`  

##### FINDC  
- 功能：定位字符串中出现或未出现的字符。 使用可选参数，您可以定义搜索的起点、设置搜索方向、忽略大小写或尾随空格，或者查找除列出的字符之外的字符。
- 语法：`FINDC(character-value, find-characters <,'modifiers'> <,start>)`  
	- *modifiers*：可为大写或小写，可以被括在单引号或双引号中；可为以下取值：
		- i：忽略大小写
		- t：忽略字符变量和*find-characters*中的尾部空格
		- k：仅计数不在*find-characters*中的字符
		- o：对于函数的特定调用，仅处理一次修饰符和查找字符。 在后续调用中，对这些参数的更改将不起作用。 如果查找字符是常量或文字，这可能会提高性能。
		- a：将大写和小写字母添加到要查找的字符列表中。
		- d：将数字（digits）添加到要查找的字符列表中。

##### FINDW  
- 功能：在字符串中搜索单词，该单词定义为两端由单词边界（空格、字符串开头或字符串结尾）分隔的一组字母。 请注意，<font color=red>标点符号不被视为单词边界</font>。
- 语法：`FINDW(char-value, word <,delim>)` or `FINDW(char-value, word, delim, modifier <,start>)`  

##### INDEX  
- 功能：定位字符串中子串的起始位置。（<font color=red>对find-string整体进行查找</font>）
- 语法：`INDEX(character-value, find-string)`  

##### INDEXC  
- 功能：在字符串中搜索一个或多个字符。 INDEXC 函数的工作方式与 INDEX 函数类似，不同之处在于它可用于搜索字符值列表中的任何一个。
- 语法1：`INDEXC(character-value, 'char1','char2','char3',...)`  
- 语法2：`INDEXC(character-value, 'char1char2char3...')`  

##### VERIFY  
- 功能：检查字符串是否包含任何不需要的值。
- 语法：`VERIFY(character-value, verify-string)`  
- 注意：此函数返回验证字符串中不存在的字符值中的第一个位置。 如果字符值不包含验证字符串以外的任何字符，则该函数返回 0。使用此函数时要特别小心考虑尾随空格。 如果您有一个等于“ABC”（后跟五个空格）的 8 字节字符变量，并且验证字符串等于“ABC”，则 VERIFY 函数返回 4，即第一个空格的位置（不是 存在于验证字符串中）。 因此，您可能需要对字符值、验证字符串或两者使用 TRIM 函数。  

## 5 提取字符串  
---
##### SUBSTR  
- 功能：提取字符串的一部分。当SUBSTR函数用在等号左边时，可以将指定的字符放入现有的字符串中。
- 语法：`SUBSTR(character-value, start <,length>)`  
	- *start*：字符串的起始位置。  
	- *length*：如果指定，是子字符串中包含的字符数。 如果省略此参数，SUBSTR 函数将返回从字符串起始位置到末尾的所有字符。  
- 示例：`SUBSTR(character-value, start <,length>) = character-to-replace`  的用法
	- `EXISTING = 'ABCDEFGH'`，`NEW = 'XY'` 
	- 令`SUBSTR(EXISTING,3,2) = NEW`  
	- 则有`EXISTING = 'ABXYEFGH'`  
- 注意：使用此函数处理中文时，因为一个中文字符为2个byte，SUBSTR函数中的*start*和*length*均为byte数，因此可能会发生意外的截断，建议使用KSUBSTR。

##### SUBSTRN  
- 功能：此函数的用途与 SUBSTR 函数相同，但增加了一些功能。 与 SUBSTR 函数不同，SUBSTRN 函数的起始位置和长度参数可以为 0 或负数，而不会导致错误。 特别是，如果长度为 0，则该函数返回长度为 0 的字符串。 当您使用正则表达式函数时，当未找到字符时长度参数可能为 0（例如，使用 PRXSUBSTR 函数）时，这特别有用。 可以在任何要使用 SUBSTR 函数的应用程序中使用 SUBSTRN 函数。 
- 语法：`SUBSTRN(character-value, start <,length>)`  

##### CHAR  
- 功能：从字符串中提取单个字符。 该函数的独特之处在于结果的默认长度为 1 个字节。 除此功能外，该函数与 SUBSTR（或 SUBSTRN）函数类似，但第三个参数（长度）的值设置为 1。
- 语法：`CHAR(character-value, position)`  
	- *position*：返回的字符的位置。若取值为0或负数或大于*character-value*的长度，CHAR返回一个缺失值（长度为1）；若*position*为缺失值，则CHAR返回一个长度为0的字符串。

##### FIRST  
- 功能：从字符串中提取第一个字符。 此函数类似于 CHAR 函数，其中位置参数设置为 1。与 CHAR 函数一样，结果值的默认长度（如果之前未定义）等于 1。
- 语法：`FIRST(character-value)`  

## 6 连接字符串  
---

有 3 个 CALL 例程和 5 个函数用于连接字符串。虽然您可以将连接运算符 (||) 与 STRIP、TRIM 或 LEFT 函数结合使用，但这些例程和函数使将字符串组合在一起变得更加容易， 如果需要，可以在字符串之间放置一个或多个分隔符。
##### CALL CATS  
- 功能：连接两个或多个字符串，并在连接前删除字符串头部和尾部的空格。
- 语法：`CALL CATS(result, string-1 <,string-n>)`  

##### CALL CATT  
- 功能：连接两个或多个字符串，并在连接前删除尾部空格。
- 语法：`CALL CATT(result, string-1 <,string-n>)`  

##### CALL CATX  
- 功能：连接两个或多个字符串，在连接前删除头部和尾部的空格，并可在字符串之间放置一个空格或其他一个或多个指定的字符。
- 语法：`CALL CATX(separator, result, string-1 <,string-n>)`  

##### CAT  
- 功能：连接两个或多个字符串或数值（numeric values），不对头部和尾部的字符串做更改。功能与连接符（||）相同。
- 语法：`CAT(item-1, item-2, <,item-n>)`  
- 注意：CAT函数与连接符的不同之处在于，连接符的默认结果长度为各连接字符串长度之和，而CAT函数结果的默认长度为200。

##### CATS  
- 功能：连接两个或多个字符串或数值，并在连接前删除字符值头部和尾部的空格。
- 语法：`CATS(item-1, item-2, <,item-n>)`  

##### CATT  
- 功能：连接两个或多个字符串或数值，并在连接前删除字符值的尾部空格。
- 语法：`CATT(item-1, item-2 <,item-n>)`  

##### CATX  
- 功能：连接两个或多个字符串或数值，在连接前删除字符值头部和尾部的空格，并在字符串之前插入一个或多个分隔符。
- 语法：`CATX(separator, item-1, item-2 <,item-n>)`  

##### CATQ  
- 功能：此函数类似于 CATX 函数，因为它连接字符串或数值并允许您选择每个字符串之间的分隔符。 如果要连接的任何字符串包含分隔符，则在该字符串周围放置单引号或双引号。 与 CATX 不同，CATQ 不会自动去除前导和尾随空白，除非您使用 s 修饰符。 此外，使用 a 修饰符，您可以在所有连接的字符串周围放置引号。 与其他“CAT”函数一样，参数可以是字符或数字。
- 语法：`CATQ(modifiers,<delimiter,>item-1,item-2<,item-n>)`  

## 7 从字符串中删除空格 
---
##### LEFT  
- 功能：将字符串向左对齐（不改变字符变量长度）。
- 语法：`LEFT(character-value)`  
- 注意：$CAHRw.格式包含头部空格，而\$w.格式将文本向左对齐。  \$QUOTE格式将在print过程中在字符串两端加上双引号，这样将能明显看出字符串前后两端的空格。示例：
	```SAS
	proc print data=right_on noobs;
		format string right_string $quote.;
	run;
	```

##### RIGHT  
- 功能：将字符串向右对齐（不改变字符变量长度）。  
- 语法：`RIGHT(character-value)`  

##### TRIM  
- 功能：删除字符串的尾部空格。
- 语法：`TRIM(character-value)`  
- 注意：去除尾部空格后，字符变量长度不变  

##### TRIMN  
- 功能：删除字符串的尾部空格
- 语法：`TRIMN(character-value)`  
- 注意：去除尾部空格后，字符变量长度不变  
- 与TRIM的区别：两个函数的工能几乎完全一致，仅在处理全为空格的参数时返回值不同：TRIM返回长度为1的空格，TRIMN返回长度为0的null string。

##### STRIP  
- 功能：从字符变量或字符串中去掉头部和尾随空格。
- 语法：`STRIP(character-value)`  
- 注意：STRIP函数不改变参数原有长度。


## 8 字符串比对  
---
##### COMPARE  
- 功能：比较两个字符串
- 语法：`COMPARE(string-1, string-2 <,'modifiers'>)`  
- *modifiers*取值如下：
	- i or I：忽略大小写
	- l or L：去除头部空格
	- n or N：从任何n-literal参数中删除引号并忽略大小写。
	- :  ：将较长字符串截断为较短字符串的长度。注意，默认情况是在比较之前用空格填充较短的字符串；这类似于=: 比较运算符。
	- 使用时注意修饰符的顺序，会影响结果。


## 9 拆分字符串  
---
##### SCAN  
- 功能：从字符值中提取指定的单词，其中单词定义为由一组指定的分隔符分隔的字符。返回的变量的长度为200，除非之前有定义。  
- 语法：`SCAN(char-value, n <, 'delimiters' <,'modifiers'>>)`  
	- n：字符串中由分隔符delimiter分隔开的第n个“word”  
	- *delimiter*：分隔符  
	- *modifiers*：
		- a：包括所有大小写字母
		- c：包括控制字符
		- d：包括所有数字
		- h：包括制表符
		- i：忽略大小写
		- k：使用不在'dilimiters'列表中的字符作为分隔符
		- l：包括小写字符
		- m：如果没有m修饰符，多个连续的分隔符将被视为单个分隔符，并且字符串开头或结尾的分隔符被忽略。使用m修饰符将连续的分隔符视为长度为零的分隔字符串。
		- p：包括所有标点符号
		- s：包括所有空格字符（空格、制表符、垂直制表符和水平制表符）
		- u：包括大写字符  

##### CALL SCAN  
- 功能：将字符串分解为"word"，其中"word"被定义为由一组指定的分隔符分隔的字符，并返回第n个单词的起始位置和长度。
- 语法：`CALL SCAN(char-value, n, position, length <, 'delim' <, 'modifiers'>)`   


## 10 替换字符串中的字母或单词  
---
##### TRANSLATE  
- 功能：将一个字符值替换为另一个。例如，您可能希望将值1–5更改为值A–E。
- 语法：`TRANSLATE(character-value, to-1, from-1 <,... to-n, from-n>)`   

##### TRANWRD  
- 功能：用替换词替换字符串中的一个或多个词。它的工作原理与大多数文字处理器的查找和替换功能类似。
- 语法：`TRANWRD(character-value, find, replace)`   


## 11 计算字符串的长度  
---
##### LENGTH  
- 功能：确定字符值的长度，不计算尾部空格。null参数（包括空格）返回值1。
- 语法：`LENGTH(character-value)`

##### LENGTHC  
- 功能：确定字符值的长度，计算尾部空格。
- 语法：`LENGTHC(character-value)`  

##### LENGTHM  
- 功能：确定内存中字符变量的长度。（啥叫内存中？功能貌似与LENGTHC一致）
- 语法：`LENGTHM(character-value)`  

##### LENGTHN  
- 功能：确定字符值的长度，不计算尾部空格。null参数（包括空格）返回值0.
- 语法：`LENGTHN(character-value)`  


## 12 计数字符串中的字母或子串  
---
##### COUNT  
- 功能：计算给定子字符串在字符串中出现的次数。使用修饰符可以忽略大小写。如果没有找到子字符串，函数将返回0。
- 语法：`COUNT(character-value, find-string <, 'modifiers'>)`  
	- *modifiers*
		- i or I：忽略大小写
		- t or T：忽略character-value和find-string中的尾部空格

##### COUNTC  
- 功能：计算字符串中出现或未出现的单个字符数。使用修饰符可以忽略大小写。另一个修饰符允许您计算未出现在字符串中的字符数。如果找不到指定的字符，函数将返回0。
- 语法：`COUNTC(character-value, characters <, 'modifiers'>)`  
	- *modifiers*
		- i or I：忽略大小写
		- o or O：只处理一次字符或多个字符和修饰符。如果COUNTC函数在相同的DATA步中使用，则使用此前的字符和修饰符值，而忽略当前值。（？）
		- t or T：忽略character-value和characters的尾部空格。请注意，在查找空格或使用v修饰符时，此修饰符尤其重要。
		- v or V：只计算未出现在字符值中的字符。请记住，除非使用了t修饰符，否则此计数将包括尾随空格。

##### COUNTW  
- 功能：计算一个字符值中的字数。通过使用修饰符，可以更改此函数的操作方式。如果不指定分隔符，则会有一组默认值略有不同，具体取决于您使用的是ASCII还是EBCDIC（因此，我们建议您在使用此函数时指定分隔符。）如果未找到子字符串，则函数会返回0。
- 语法：`COUNTW(character-value <,delim> <, 'modifiers'>)`  
	- *delim*
		- ASCII环境下默认值：blank . < ( + & ! $ * ) ; ^ - / , % |  
		- EBCDIC环境下默认值：blank . < ( + | & ! $ * ) ; ¬ - / , % | ¢  
	- *modifiers* 
		- a：包括所有字母（大写与小写）
		- c：包括控制字符（啥叫控制字符？）
		- d：包括数字
		- h：包括水平制表符
		- i：忽略大小写
		- k：将所有不在分隔符列表中或由修饰符定义的字符视为分隔符。
		- l：包括小写字符
		- m：影响处理多个分隔符的方式。如果没有此修饰符，多个连续分隔符将被视为单个分隔符，并且字符串开头或结尾的分隔符将忽略。使用“m”修饰符会导致多个分隔符分隔零长度的单词。此外，字符串开头或结尾的分隔符也对零长度的单词进行分隔。
		- o：只处理修改器列表一次（即使它们的值发生了变化）。这可能会使此功能运行得更快。
		- p：包括所有标点符号
		- q：忽略引号内的分隔符
		- s：包括空格字符（空格、制表符、水平换行符和垂直换行符）
		- t：从字符值和分隔符参数中修剪尾部空格。
		- u：包括大写字符
		- w：包括可打印字符（啥叫可打印字符？）
		- x：包括十六进制数字


## 13 其他字符串函数  
---
##### CHOOSEC  
- 功能：从字符值列表中选择字符值（作为函数的第2个到第n个参数提供）
- 语法：`CHOOSEC(item-number, value-1 <, value-2 , ...>)`  
	- *item-number*：从value列表选择要返回的项目，如果值为负数，则从列表末尾开始计数；如果值大于value列表中value的个数，则返回缺失值（\_error\_=1）  

##### CHOOSEN  
- 功能：从数值列表中选择一个数值（作为函数的第2个到第n个参数提供）。
- 语法：`CHOOSEN(item-number, value-1 <, value-2, ...>)`  

##### MISSING  
- 功能：确定参数是否缺少（字符或数字）值。这是一个很方便使用的函数，因为您不必知道测试的变量是字符还是数字。如果该值缺少值，则函数返回1（true），否则返回0（false）。
- 语法：`MISSING(variable)`  

##### COALESCEC  
- 功能：从字符值列表中选择第一个未缺失的字符值。如果之前没有定义，则返回的变量的长度将为200。（若所有值均缺失，则返回缺失值）
- 语法：`COALESCEC(<of> char-1 <, char-n>)`  

##### IFC  
- 功能：根据对逻辑表达式的求值来选择字符值。函数的第一个参数是一个逻辑表达式，该表达式要么为true，要么为false，要么缺失。当表达式为true时，该函数返回第二个参数的值，当表达式为false时，返回第三个参数的数值，如果表达式缺失，则返回第四个参数的价值。如果之前没有定义，则返回的变量的长度将为200。
- 语法：`IFC(logical-expression, when-true, when-false <,when-missing>)`  

##### RANK  
- 功能：获取ASCII（或EBCDIC）字符的相对位置。如果您想将每个字符与一个数字相关联，以便ARRAY下标可以指向特定的字符，那么这将非常有用。
- 语法：`RANK(letter)`  
- 示例：
	- RANK("A") : 65
	- RANK("XYZ") : 88
	- RANK("X") : 88
	- RANK("a") : 97

##### REPEAT  
- 功能：复制一个字符串的多个副本
- 语法：`REPEAT(character-value, n)`  
- 注意：n是重复次数。这个函数的结果是原始字符串加上n个重复。

##### REVERSE  
- 功能：颠倒字符值的文本顺序（包括尾部空格）
- 语法：`REVERSE(character-value)`  

##### NLITRAL  
- 功能：如果字符串不是有效的V7变量名，则将该字符串转换为名称文字。
- 语法：`NLITERAL(character-value)`  
- 系统选项VALIDVARNAME设置的有效的V7变量名遵守以下规则：
	- 必须以字母或下划线开头。
	- 剩下的字符是字母、数字或下划线。
	- 长度不超过32个字符
	- 不允许使用诸如\_N\_、\_numeric\_、\_character\_、\_all\_和\_error\_之类的保留名称。

##### NVALID  
- 功能：确定字符值是否符合V7或ANY命名约定。它返回true或false值。
- 语法：`NVALID(character-value <, validvarname>)`  
- 注意：validvarname是一个可选参数，可以是“ANY”、“V7”或“NLITERAL”。如果它设置为“ANY”，并且字符值包含32个或更少的字符（包括空格），则它将返回值“true”。如果设置为“V7”，则只接受符合V7约定的名称作为有效名称（请参见以下段落）。如果设置为“NLITERAL”，则只有V7名称或名称文字才被接受为有效。  