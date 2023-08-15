[SAS Help Center: Axis Options for LAYOUT DATALATTICE and LAYOUT DATAPANEL](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/p1ug4om0rekm8vn1asfk7s8qb84g.htm)  

## 1 语法（Syntax）
DATALATTICE和DATAPANEL布局中绘图的X和X2轴的选项由以下选项指定：
```SAS
COLUMNAXISOPTS=(axis-options)
COLUMN2AXISOPTS=(axis-options)
```
Y和Y2轴的选项由以下选项指定：
```SAS
ROWAXISOPTS=(axis-options)
ROW2AXISOPTS=(axis-options)
```

## 2 Layout中坐标轴的通用选项（General Options for All Axes in the Layout）
本节中记录的选项可与 DATALATTICE 或 DATAPANEL 布局中支持的任何轴类型一起使用。 本章的后续部分记录了仅适用于特定轴类型的轴选项：离散轴、线性轴、对数轴或时间轴。 下表提供了常规选项的摘要。
- **ALTDISPLAY=STANDARD | ALL | NONE | _(display-options)_**
	- Controls which axis features are displayed on second, fourth, and other even row or column occurrences of the primary axis. 控制哪些轴特征显示在主轴的第二个、第四个以及其他偶数行或列上。
	- ==STANDARD==：指定显示LABEL, LINE, TICKS和TICKVALUES。
	- ==ALL==：目前与STANDARD一致。
	- ==NONE==：指定不显示轴特征。
	- ==*(display-options)*==：括号中包含以下一个或多个选项的空格分隔列表：
		- LABEL：显示坐标轴标签。会被 DISPLAY= 选项上指定的标签覆盖。
		- LINE：显示坐标轴线
		- TICKS：显示刻度线。
		- TICKVALUES：显示由主要刻度线表示的值。
	- default：The settings on the DISPLAY= option.
	- tip：轴线和轴刻度线的默认线条属性在 GraphAxisLine 样式元素中定义。
- **ALTDISPLAYSECONDARY=NONE | ALL | STANDARD | _(display-options)_**
	- Controls which features are displayed on second, fourth, and other even row or column occurrences of the secondary axis. 控制哪些要素显示在次轴的第二个、第四个以及其他偶数行或列上。
	- ==STANDARD==：指定显示LABEL, LINE, TICKS和TICKVALUES。
	- ==ALL==：目前与STANDARD一致。
	- ==NONE==：指定不显示轴特征。
	- ==*(display-options)*==：括号中包含以下一个或多个选项的空格分隔列表：
		- LABEL：显示坐标轴标签。会被 DISPLAY= 选项上指定的标签覆盖。
		- LINE：显示坐标轴线
		- TICKS：显示刻度线。
		- TICKVALUES：显示由主要刻度线表示的值。
	- default：The settings on the DISPLAYSECONDARY= option.
	- restriction：如果某些绘图语句设置 XAXIS=X，而另一些绘图语句设置 XAXIS=X2，则 X 轴和 X2 轴都是主轴，并且无法显示辅助 X 轴。 在这种情况下，该选项将被忽略。 这同样适用于 Y 轴。
	- tip：轴线和轴刻度线的默认线条属性在 GraphAxisLine 样式元素中定义。 此选项可用于获取 ScatterPlotMatrix 中所示的交替轴信息。
- **DISCRETEOPTS=_(discrete-axis-options)_**
	- Specifies options for a discrete axis. 指定离散轴的选项。
	- 当axis type不是DISCRETE的时候，此选项将被忽略。
- **DISPLAY=STANDARD | ALL | NONE | _(display-options)_**
	- Controls which axis features are displayed on first, third, and other odd row or column occurrences of the primary axis. 控制哪些轴特征显示在主轴的第一、第三和其他奇数行或列上。
	- ==STANDARD==：指定显示LABEL, LINE, TICKS和TICKVALUES。
	- ==ALL==：目前与STANDARD一致。
	- ==NONE==：指定不显示轴特征。
	- ==*(display-options)*==：括号中包含以下一个或多个选项的空格分隔列表：
		- LABEL：显示坐标轴标签。
		- LINE：显示坐标轴线
		- TICKS：显示刻度线。
		- TICKVALUES：显示由主要刻度线表示的值。
	- default：STANDARD.
	- tip：轴线和轴刻度线的默认线条属性在 GraphAxisLine 样式元素中定义。
- **DISPLAYSECONDARY=NONE | ALL | STANDARD | _(display-options)_**
	- Controls which axis features are displayed on first, third, and other odd row or column occurrences the secondary axis. 控制哪些轴特征显示在次轴的第一、第三和其他奇数行或列上。
	- ==STANDARD==：指定显示LABEL, LINE, TICKS和TICKVALUES。
	- ==ALL==：目前与STANDARD一致。
	- ==NONE==：指定不显示轴特征。
	- ==*(display-options)*==：括号中包含以下一个或多个选项的空格分隔列表：
		- LABEL：显示坐标轴标签。
		- LINE：显示坐标轴线
		- TICKS：显示刻度线。
		- TICKVALUES：显示由主要刻度线表示的值。
	- default：NONE.
	- restriction：如果某些绘图语句设置 XAXIS=X，而另一些绘图语句设置 XAXIS=X2，则 X 轴和 X2 轴都是主轴，并且无法显示辅助 X 轴。 在这种情况下，该选项将被忽略。 这同样适用于 Y 轴。
	- tip：使用 GRIDDISPLAY= 和 GRIDATTRS= 选项设置轴网格线。
- **GRIDATTRS=_style-element_ | _style-element (line-options)_ | _(line-options)_**
	- Specifies the attributes of the grid lines. 指定网格线的属性。
	- default：The GraphGridLines style element.
	- interaction：如果 GRIDDISPLAY= 选项不显示网格线，则忽略此选项。
	- tip：在对数轴上，此选项仅影响主要网格线的外观。 它不会影响次网格线的外观。 要控制对数轴上次网格线的外观，请使用 MINORGRIDATTRS= 选项。
- **GRIDDISPLAY=AUTO_OFF | AUTO_ON | ON | OFF**
	- Specifies whether axis grid lines are displayed. 指定是否显示轴网格线。
	- ==AUTO_OFF==：指定除非当前样式中的 GraphGridLines 元素包含 DisplayOpts="ON"，否则不显示网格线。
	- ==AUTO_ON==：指定除非当前样式中的 GraphGridLines 元素包含 DisplayOpts="OFF"，否则显示网格线。
	- ==ON==：指定始终显示网格线。当前样式没有覆盖。
	- ==OFF==：指定从不显示网格线。当前样式没有覆盖。
	- default：AUTO_OFF
- **LABEL=_"string"_ | (_"string" ... "string"_)**
	- Specifies the axis label. 指定轴标签。
	- 该字符串可以是字符串文字或动态字符串。列表形式意味着所有包含的字符串文字或动态变量将被连接。
	- default：默认标签源自布局中的主图。
- **LABELATTRS=_style-element_ | _style-element (text-options)_ | _(text-options)_**
	- Specifies the color and font attributes of the axis label. 指定轴标签的颜色和字体属性。
	- default：The GraphLabelText style element.
- **LABELFITPOLICY=AUTO | SPLIT | SPLITALWAYS | STACAKED**
	- Specifies a policy for fitting axis labels in the available space. 指定在可用空间中调整轴标签的策略。
	- ==AUTO==：如果指定，则使用短标签而不是原始标签。如果短标签不合适，则会被剪掉。当未指定短标签时，原始标签将被剪裁。
	- ==SPLIT==：仅在必要时才在分割字符处分割轴标签，以使标签适合可用空间。分割字符由 LABELSPLITCHAR= 选项指定。不使用短标签。如果在该位置不需要分割，则不会在分割字符处发生分割。如果标签不包含任何指定的分割字符，则不会分割。 无法分割或分割后仍不适合可用空间的标签可能会与相邻空间重叠。
	- ==SPLITALWAYS==：始终在每次出现分割字符时分割轴标签，该分割字符由 LABELSPLITCHAR= 选项指定。如果标签无法分割，则会被剪裁。
	- ==STACKED==：将 Y 或 Y2 轴标签垂直显示为堆叠字母（适用于SAS 9.4M5及更高的版本）。
	- default：AUTO
- **LABELPOSITION=CENTER | DATACENTER | TOP | BOTTOM | LEFT | RIGHT**
	- Specifies the position of the axis label. 指定轴标签的位置。
	- default：CENTER
	- restriction：该选项不支持碰撞避免。 在某些情况下，轴区域中可能会发生轴标签冲突。
	- interaction：当 LEFT、RIGHT、TOP 或 BOTTOM 有效时， SHORTLABEL= 选项被忽略。
- **LABELSPLITCHAR="_character-list_"**
	- Specifies one or more characters on which the axis labels can be split, if needed. 如果需要，指定一个或多个可以分割轴标签的字符。
	- default：A blank space
	- requirements：字符列表必须用引号引起来。 必须指定多个字符，字符之间不能有空格。 例如，要指定分割字符 a、b 和 c，如示例：`labelsplitchar="abc"`
- **LABELSPLITCHARDROP=TRUE | FALSE**
	- Specifies whether the split characters should be included in the axis labels that are displayed. 指定分割字符是否应包含在显示的轴标签中。
	- TRUE：从轴标签显示中删除分割字符。
	- FALSE：包括轴标签显示中的分割字符。当在 LABELSPLITCHARDROP=FALSE 有效时分割标签，每个分割字符仍保留为当前行中的最后一个字符。然后，分割字符后面的字符（直到并包括下一个分割字符）将换行到下一行。
	- default：TRUE
- **LABELSPLITJUSTIFY=_justification_**
	- Specifies the justification of the strings that are inside the axis label blocks. 指定轴标签块内字符串的对齐方式。
	- _justification_：
		- X和X2轴：
			- CENTER
			- LEFT
			- RIGHT
		- Y和Y2轴
			- CENTER
			- TOP
			- BOTTOM
	- default：CENTER
- **LINEAROPTS=(_linear-axis-options_)**
	- Specifies options for a standard numeric interval axis. 指定标准数字间隔轴的选项。
	- 当axis type不是LINEAR时，此选项无效。
	- 参见
- **LOGOPTS=_(log-axis-options)_**
	- Specifies options for a log axis. 指定对数轴的选项。
	- 当axis type不是LOG时，此选项无效。
	- 参见
- **NAME="_string_"**
	- Assigns a name to an axis for reference in other statements. 为轴指定名称以供其他语句中参考。
	- restriction：此选项不支持由 DYNAMIC、MVAR 和 NMVAR 模板语句创建的变量。
	- interaction：除非轴是离散的，否则将忽略此选项。 默认情况下，轴可以是离散的，也可以使用 TYPE=DISCRETE 设置显式设置为离散。
- **OFFSETMAX=AUTO | AUTOCOMPRESS | _number_**
	- Reserves an area at the maximum end of the axis. No tick marks are displayed in the reserved area. 在轴的最末端保留一个区域。 保留区域中不显示刻度线。
	- ==AUTO==：保留足够的区域来完全显示轴最大末端附近的标记和其他图形特征。
	- ==AUTOCOMPRESS==：应用自动偏移，防止轴标签和刻度值超出轴长度。
	- ==_number_==：将偏移指定为全轴长度的小数比例。对于连续轴，偏移量遵循最高数据值或最高刻度值（以较大者为准）（range=0-1）。
	- default：AUTOCOMPRESS
- **OFFSETMIN=AUTO | AUTOCOMPRESS | _number_**
	- Reserves an area at the minimum end of the axis. No tick marks are displayed in the reserved area. 在轴的最小端保留一个区域。 保留区域中不显示刻度线。
	- ==AUTO==：保留足够的区域来完全显示轴最大末端附近的标记和其他图形特征。
	- ==AUTOCOMPRESS==：应用自动偏移，防止轴标签和刻度值超出轴长度。
	- ==_number_==：将偏移指定为全轴长度的小数比例。对于连续轴，偏移量遵循最高数据值或最高刻度值（以较大者为准）（range=0-1）。
	- default：AUTOCOMPRESS
- **REVERSE=TRUE | FALSE**
	- Specifies whether the tick values should appear in the reverse order. 指定刻度值是否应以相反的顺序显示。
	- default：FALSE
- **SHORTLABEL="_string_"**
	- Specifies an alternate axis label. 指定备用轴标签。
	- 如果 DISPLAY= 选项或 DISPLAYSECONDARY= 选项不显示轴标签，则忽略此选项。
- **TICKVALUEATTRS=_style-element_ | _style-element (text-options)_ | (_text_options)**
	- Specifies the color and font attributes of the axis tick value labels. 指定轴刻度值标签的颜色和字体属性。
	- default：The GraphValueText style element
- **TICKVALUEHALIGN=LEFT | CENTER | RIGHT**
	- Specifies the horizontal alignment for all of the tick values that are displayed on the Y and Y2 axes. 指定 Y 轴和 Y2 轴上显示的所有刻度值的水平对齐方式。
	- default：RIGHT for a Y axis, LEFT for a Y2 axis
	- 示例：
	![Y-Axis Tick Values Aligned Left, Center, and Right](https://documentation.sas.com/api/docsets/grstatgraph/v_002/content/images/tickvaluehalign.png?locale=en)  
- **TICKVALUEVALIGN=TOP | CENTER | BOTTOM**
	- Specifies the vertical alignment for all of the tick values that are displayed on the X and X2 axes. 指定 X 轴和 X2 轴上显示的所有刻度值的垂直对齐方式。
	- default：TOP for an X axis, BOTTOM for an X2 axis
	- 示例：
	![Multi-Line X-Axis Tick Values Aligned Top, Center, and Bottom](https://documentation.sas.com/api/docsets/grstatgraph/v_002/content/images/tickvaluevalign.png?locale=en)  
- **TIMEOPTS=(_time-axis-options_)**
	- Specifies options for a TIME axis. 指定时间轴的选项。
	- 当axis type不是TIME时此选项不生效。
- **TYPE=AUTO | DISCRETE | LINEAR | TIME | LOG**
	- Specifies the type of axis to use. 指定要使用的轴的类型。
	- default：AUTO  

## 3 特定坐标轴选项
- options for discrete axes only : [Options for Discrete Axes Only](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/p1ug4om0rekm8vn1asfk7s8qb84g.htm#n0802zvq7wgg8jn1eu1mf67wi8e9)
- options for linear axes only : [Options for Linear Axes Only](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/p1ug4om0rekm8vn1asfk7s8qb84g.htm#p0momyelq47gfan1uowz5van50vu)
- options for log axes only : [Options for Log Axes Only](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/p1ug4om0rekm8vn1asfk7s8qb84g.htm#p0nt9drslsknqvn117nv39h5uz7q)
- options for time axes only : [Options for Time Axes Only](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/p1ug4om0rekm8vn1asfk7s8qb84g.htm#p1sv6mxxxtq3x1n1ep9f491ldlse)