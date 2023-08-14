
*Value Type Notation Used for GTL Statement Options*：用于GTL语句选项的值类型表示法
## 1 布尔值（boolean）
布尔值（*boolean*）：指定解析为true或false的文字值。
| Values That Resolve To True | Values That Resolve to False |
| --------------------------- | ---------------------------- |
| ON                          | OFF                          |
| \_ON\_                      | \_OFF\_                      |
| TRUE                        | FALSE                        |
| YES                         | NO                           |
| \_YES\_                     | \_NO\_                       |
| 1                           | 0                             |

## 2 颜色（color）
颜色（*color*）：指定定义一个颜色的字符串。一个*color*可以是以下其中之一：
- 任何SAS支持的颜色命名（color names），可参见[SAS Help Center: Color-Naming Schemes](https://go.documentation.sas.com/doc/en/vdmmlcdc/8.1/grstatproc/n0h71t919qh9g2n1rhvrpq3e2cgu.htm#:~:text=The%20valid%20color-naming%20schemes%20are%20as%20follows%3A%201,SAS%20Registry%29%207%20SAS%20Color%20Naming%20System%20%28CNS%29)
- 使用样式模板时SAS会话中存在的颜色之一，例如DMSBLACK或DMSCYAN。（只有在窗口环境中运行SAS时，才使用这些颜色规格。）
- 色调（Hue）/亮度（Light）/饱和度（Saturation）（HLS）值的英文描述。这种描述使用单词组合来描述亮度、饱和度和色调（按顺序）。通过执行以下操作之一，可以使用颜色命名系统来形成颜色：
	- 将彩色色调与亮度、饱和度或两者相结合；
	- 将灰调（achromatic hue gray）与亮度相结合；
	- 组合无限定符的黑色调或白色调；
	- 将单词组合成各种各样的颜色，如浅绿色（light vivid green）、深橙色（dark vivid orange）或浅黄色（light yellow）
- 指定介于两种相邻颜色之间的色调。要做到这一点，请将以下形容词之一与其相邻的颜色组合：褐色（brownish）、绿色（greenish）、略带紫色（purplish）或淡黄色（yellowish）（例如，蓝紫色（bluish purple）或红橙色（reddish orange））。

## 3 列（column）
指定包含双精度值（double-precision values）或字符串值（string values）的列变量，或引用此类列的动态变量（dynamic variable）。
另请参见：整数列（integer-column）、数字列（numeric-column）和字符串列（string-column）。

## 4 尺寸（dimension）
[SAS Help Center: Units of Measurement](https://documentation.sas.com/doc/en/vdmmlcdc/8.11/grstatproc/p0sgbhvieekj9cn1wog7owbtguo9.htm)
指定一个非负数（nonnegative number）。数字后面可以跟以下可选计量单位之一：
| unit     | Description                   | 中文                   |
| -------- | ----------------------------- | ---------------------- |
| CM       | centimeters                   | 厘米                   |
| IN       | inches                        | 英寸（1 in = 2.54 cm） |
| MM       | millimeters                   | 毫米                   |
| PCT or % | percentage                    | 百分比                 |
| PT       | point size (72 points = 1 in) | 磅值                   |
| PX         |pixels                               |像素                        |

## 5 表达式（expression）
指定一个选择性（selective）、关系性（relational）或逻辑程序结构（logical program structure），当这些值未存储在数据中时，该结构会计算这些值。表达式必须指定为EVAL()参数。以下显示了EVAL()参数的结构：
```SAS
x = EVAL(expression)
```
表达式返回一个数字，可以由辅音（consonants）、数据列（data columns）、动态变量（dynamic variables）、函数（functions）或其他表达式组成。以下示例使用数据列Time和SGE函数MEAN和ACF：
```SAS
EVAL(MEAN(Time) + ACF(Time, Nlags=10))
```

## 6 填充图案（fill-pattern）
将填充图案指定为两个字符的代码（two-character code），该代码由线条方向前缀（R表示右侧，L表示左侧，或X表示交叉填充）和线条标识号1–5组成。
<font color = #0000ff>fill pattern options</font>参见[Atrributes Avaliable for the Attribute Options](https://github.com/GSJ-SD/Notebook/blob/main/02%20SAS/01%20GTL/00%20Atrributes/Atrributes%20Avaliable%20for%20the%20Attribute%20Options.md)。

## 7 输出格式（format）
指定 SAS 格式或用户定义的格式。

## 8 整数，整数列（integer, inter-column）
指定正整数（positive whole numbers）、负整数（negative whole numbers）和零（zero）集合的成员。
整数列指定包含整数值的列，或引用此类列的动态变量。

## 9 线型名称，线型编码（line-pattern name, line-pattern number）
指定线条图案的字符串值、线条图案的数值、包含此类字符串或数字的动态变量，或者对line pattern的样式引用（style reference）。 选择线条图案是为了可辨别。 由于密度不同，相同粗细的线不可能具有相同的权重。 相反，线条图案被排序以提供权重的连续体，这在显示置信带时非常有用。
<font color = #0000ff>line options</font>可参见[Atrributes Avaliable for the Attribute Options](https://github.com/GSJ-SD/Notebook/blob/main/02%20SAS/01%20GTL/00%20Atrributes/Atrributes%20Avaliable%20for%20the%20Attribute%20Options.md)。

## 10 标记名称（marker-name）
指定标记符号的字符串值、包含标记符号的动态变量或对标记符号（marker symbol）的样式引用（style reference）。
<font color = #0000ff>marker options</font>可参见[Atrributes Avaliable for the Attribute Options](https://github.com/GSJ-SD/Notebook/blob/main/02%20SAS/01%20GTL/00%20Atrributes/Atrributes%20Avaliable%20for%20the%20Attribute%20Options.md)。

## 11 数字，数字列（number, number-column）
指定一个值、包含双精度值（double-precision value）的动态变量、解析为双精度值的表达式或对双精度值的样式引用（style reference）。 numeric-column 指定包含双精度值的列，或引用此类列的动态变量。

## 12 字符串，字符串列（string, string-column）
指定带引号的字符串（a quoted character string）。 字符串列指定包含字符串值的列，或引用此类列的动态变量。
注意：
- 对于 GTL 中带引号的字符串选项，引号（" " 或 ' '）中的空格与空引号（"" 或 ''）不等效。 引号括起来的空格指定空格或缺失的字符串值。
- 空引号等同于不设置该选项。 
- 要在带引号的字符串选项中指定空格或缺失值，请使用用引号括起来的空格（“”或“”）。

## 13 样式引用（style reference）
指定对样式元素（style element）中定义的属性的引用。 
在 SAS 提供的 ODS 图形模板（template）中，绘图要素的选项是通过*style-element-name*:*attribute-name*形式的样式引用指定的，而不是特定值。 例如，散点图标记的符号、颜色和大小在 SCATTERPLOT 语句中指定，如下所示：
```SAS
scatterplot x=X y=Y /
markersymbol=GraphDataDefault:markersymbol
markercolor=GraphDataDefault:contrastcolor
markersize=GraphDataDefault:markersize
```
上述样式参考保证了所有基本散点图中使用的标记的共同外观。 
对于非分组数据，标记外观由您指定的样式模板中的 GraphDataDefault 样式元素控制。 
为了创建您自己的样式模板，或者修改样式模板以与 ODS Graphics 一起使用，您需要了解样式元素和图形功能之间的关系。 更多信息请参见使用指南。