SAS 在 SAS 语言元素的语法文档中使用标准约定。这些约定使您能够轻松识别 SAS 语法的组成部分。 约定可以分为以下几个部分：
- Syntax components
- Style conventions
- Special characters
- Reference to SAS libraries and external files

## 1 Syntax Components 语法组件  
大多数语言元素（language elements）的语法组件包括关键字（keyword）和参数（arguments）。对于某些语言元素，只需要关键字。对于其他语言元素，关键字后跟等号 (=)。参数的语法有多种形式，以便演示多个参数的语法（带或不带标点符号）。
- 关键字keyword
	- 指定在编写程序时使用的 SAS 语言元素的名称。关键字是一个literal，通常是语法中的第一个单词。在 CALL例程（routine）中，前两个单词是关键字。
	- 示例1 - 关键字以粗体显示
		- **CHAR**(_string_, _position_)
		- **CALL RANBIN**(_seed_,_n_,_p_,_x_);
		- **ALTER**(_alter-password_)
		- **BEST** _w._
		- **REMOVE** \<data-set-name\>   
	- 示例2 - CALL routine中前两个单侧为关键字
		- **CALL RANBIN**(_seed_, _n_, _p_, _x_)  
	- 示例3 - 不带参数的单个关键字
		- **DO**; ...SAS code... **END**;  
	- 示例4 - 某些系统选项要求指定两个关键字值之一
		- **DUPLEX** | **NODUPLEX**
	- 示例5 - 某些过程语句在整个语句语法中具有多个关键字
		- **CREATE** \<UNIQUE\> **INDEX** _index-name_ **ON** _table-name_ (_column-1_ \<, _column-2_, ...\>)
- 参数argument
	- 指定数字或字符常量、变量或表达式。参数跟在关键字后面或关键字后面的等号后面。SAS 使用参数来处理语言元素。参数可以是必需的，也可以是可选的。在语法中，可选参数括在尖括号 ( < > ) 中。
	- 示例1 - *string*和*position*跟在**CHAR**后面，这两个参数是CHAR函数的必要参数（required arguments）
		- **CHAR**(_string_, _position_)
		- 每个参数都有一个值，例如：`X=char('summer', 4);`  
	- 示例2 - *string*和*substring*为必要参数（required arguments），*modifiers*和*startpos*为可选参数
		- **FIND**(_string_, _substring_ \<, _modifiers_\> \<, _startpos_\>)
- argument(s)
	- 指定一个参数是必要的，也允许多个参数。参数之间使用空格进行分隔。参数之间不允许使用标点符号，如逗号等。
	- 示例1 - MISSING语句
		- **MISSING** _character(s)_;
- \<LITERAL_ARGUMENT\> _argument-1_ \<\<LITERAL_ARGUMENT\> _argument-2_ ...\>
	- 指定需要一个参数，并且可以将文字参数与该参数关联。可以指定多个文字和参数对。文字和参数对之间不需要标点符号。 省略号 (...) 表示允许使用其他文字和参数。
	- 示例1 - BY语句
		- **BY** \<DESCENDING\> _variable-1_ \<\<DESCENDING\> _variable-2_ ...\>;  
- _argument-1_ \<_options_\> \<_argument-2_ \<_options_\>...\>
	- 指定需要一个参数，并且一个或多个选项可以与该参数关联。您可以指定多个参数和关联的选项。参数和选项之间不需要标点符号。省略号 (...) 表示允许使用带有关联选项的附加参数。
	- 示例1 - FORMAT过程中的PICTURE语句
		- **PICTURE** name \<(_format-options_)\>    \<_value-range-set-1_ \<(_picture-1-options_)\>    \<_value-range-set-2_ \<(_picture-2-options_)\> ... \>\>;
- _argument-1_=_value-1_ \<_argument-2_=_value-2_ ... \>
	- 指定必须为参数分配一个值，并且可以指定多个参数。省略号 (...) 表示允许使用其他参数。 参数之间不需要标点符号。
	- 示例1 - LABEL语句
		- **LABEL** _variable-1_=_label-1_ \<_variable-2_=_label-2_...\>;
- _argument-1_ \<, _argument-2_,...\>
	- 指定需要一个参数，并且可以指定由逗号或其他标点符号分隔的多个参数。省略号 (...) 表示参数的延续，以逗号分隔。
	- 示例1
		- **AUTHPROVIDERDOMAN** (_provider-1:domain-1_ \<, _provider-2:domain-2_, ...\>)
	- 示例2
		- **INTO** : _macro-variable-specification-1_ \<, :_macro-variable-specification-2_, ...\>

## 2 Style Conventions 样式约定  
记录 SAS 语法时使用的样式约定包括大写粗体（uppercase bold）、大写（uppercase）和斜体（italic）：
- **UPPERCASE BOLD**
	- 标识 SAS 关键字，例如函数或语句的名称。
	- 示例1：**ERROR** \<_message_\>
- UPPERCASE
	- 标识文字参数。
	- 示例1：**CMPMODEL**=BOTH | CATALOG | XML
- _italic_
	- 标识由用户提供的参数或值。
	- 示例1 - 非文字参数（nonliteral arguments）
		- **LINK** _label_;
	- 示例2 - 分配给参数的非文字值（nonliteral values）
		- **FORMAT** _variable(s)_ \<_format_\> \<DEFAULT = _default-format_\>;

## 3 Special Characters 特殊字符  
SAS 语言元素的语法可以包含以下特殊字符：
- =
	- 等号（equal sign）标识某些语言元素（例如系统选项）中文字的值。
	- 示例1：**MAPS**=_location-of-maps_
- \< \>
	- 尖括号（angle brackets）标识可选参数。必需的参数不包含在尖括号中。
	- 示例1：**CAT** (_item-1_ \<, _item-2_, ...\>)
- |
	- 垂直条表示您可以从一组值中选择一个值。由竖线分隔的值是互斥的。
	- 示例1：**CMPMODEL**=BOTH | CATALOG | XML
- ...
	- 省略号表示该参数可以重复。如果参数和省略号括在尖括号中，则该参数是可选的。如果重复的参数出现在参数之前或之后，则必须包含标点符号。
	- 示例1：**CAT** (_item-1_ \<, _item-2_, ...\>)
- '_value_' or "_value_"
	- 表示用单引号或双引号括起来的参数必须具有也用单引号或双引号括起来的值。
	- 示例1：**FOOTNOTE** \<_n_\> \<_ods-format-options_ '_text_' | "_text_" \>;
- ;
	- 分号表示语句或 CALL 例程的结束。
