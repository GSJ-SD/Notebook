GTL语句中可使用的属性选项（attribute option），包括*fill-color options*，*fill-pattern options*，*line options*，*marker options*，和*text options*。

## 1 Fill Color Options
使用以下一个或多个选项可以指定填充颜色属性。options必须括在括号中，并指定为 *name* = *value*配对的空格分隔列表（space-delimited list）。
- **COLOR = *style-reference* | _color_**
	- 指定填充颜色。
	- *style-reference*必须在*style-element-name:atrribute-name*中指定有效的样式属性，如color、ContrastColor、StartColor、NeutralColor或EndColor。如果未在活动ODS style中定义*style-reference*，则COLOR=选项将被忽略，并使用默认颜色。
	- *color*必须是有效的颜色名称，如RED，或颜色代码，如CXFF0000或#FF0000。<font color=#ff0055>颜色名称不得超过64个字符</font>。颜色代码必须是SAS color-naming scheme中的有效代码，例如RGB、CMYK、HLS或HSV（HSB）。
- **TRANSPARENCY = _number_**
	- 指定填充区域的透明度。通过此设置，可以设置某些图形类型的填充元素的透明度。
	- 可以仅设置此填充透明度，也可以独立于图形中的其他透明元素设置填充。例如，可以使用此设置为条形图的填充条形设置透明度级别，并使用条形图的DATATRANSPARENCY=选项为bar outlines设置不同的透明度级别。
	- ==默认值==：和语句中DATATRANSPARENCY = 选项相同
	- ==取值范围==：0 - 1，其中0代表不透明（opaque），1代表完全透明
	- ==示例==：`fillattrs = (transparency = 0.5)`

## 2 Fill Pattern Options
使用以下一个或多个选项可以指定填充图案属性。options必须括在括号中，并指定为 *name* = *value*配对的空格分隔列表（space-delimited list）。
- **COLOR = *style-reference* | _color_**
	- 指定填充颜色。
	- *style-reference*必须在*style-element-name:atrribute-name*中指定有效的样式属性，如color、ContrastColor、StartColor、NeutralColor或EndColor。如果未在活动ODS style中定义*style-reference*，则COLOR=选项将被忽略，并使用默认颜色。
	- *color*必须是有效的颜色名称，如RED，或颜色代码，如CXFF0000或#FF0000。<font color=#ff0055>颜色名称不得超过64个字符</font>。颜色代码必须是SAS color-naming scheme中的有效代码，例如RGB、CMYK、HLS或HSV（HSB）。
- **PATTERN = *style-reference* | _fill-pattern_**
	- 指定填充样式。
	- *style-reference*从SAS 9.4M5开始有效。它必须在*style-element-name:FILLPATTERN*中指定FILLPATTERN属性。如果未在活动ODS style中定义*style-reference*，则会忽略PATTERN=选项，并使用默认填充样式。
	- *fill-pattern*是一个由两个字符组成的代码，包含一个线条方向前缀（R表示右侧，L表示左侧，X表示交叉填充）和一个线条标识号1–5。下表显示了每种可能组合的模式。
|Pattern Name|Example|Pattern Name|Example|Pattern Name|Example|
|---|---|---|---|---|---|
|L1|![L1 fill pattern](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_fillpattern_l1.svg?locale=en)|R1|![R1 fill pattern](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_fillpattern_r1.svg?locale=en)|X1|![X1 fill pattern](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_fillpattern_x1.svg?locale=en)|
|L2|![L2 fill pattern](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_fillpattern_l2.svg?locale=en)|R2|![R2 fill pattern](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_fillpattern_r2.svg?locale=en)|X2|![X2 fill pattern](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_fillpattern_x2.svg?locale=en)|
|L3|![L3 fill pattern](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_fillpattern_l3.svg?locale=en)|R3|![R3 fill pattern](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_fillpattern_r3.svg?locale=en)|X3|![X3 fill pattern](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_fillpattern_x3.svg?locale=en)|
|L4|![L4 fill pattern](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_fillpattern_l4.svg?locale=en)|R4|![R4 fill pattern](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_fillpattern_r4.svg?locale=en)|X4|![X4 fill pattern](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_fillpattern_x4.svg?locale=en)|
|L5|![L5 fill pattern](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_fillpattern_l5.svg?locale=en)|R5|![R5 fill pattern](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_fillpattern_r5.svg?locale=en)|X5|![X5 fill pattern](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_fillpattern_x5.svg?locale=en)|

## 3 Line Options
使用以下一个或多个选项可以指定线条属性。options必须括在括号中，并指定为 *name* = *value*配对的空格分隔列表（space-delimited list）。
- **COLOR = *style-reference* | _color_**
	- 指定填充颜色。
	- *style-reference*必须在*style-element-name:atrribute-name*中指定有效的样式属性，如color、ContrastColor、StartColor、NeutralColor或EndColor。如果未在活动ODS style中定义*style-reference*，则COLOR=选项将被忽略，并使用默认颜色。
	- *color*必须是有效的颜色名称，如RED，或颜色代码，如CXFF0000或#FF0000。<font color=#ff0055>颜色名称不得超过64个字符</font>。颜色代码必须是SAS color-naming scheme中的有效代码，例如RGB、CMYK、HLS或HSV（HSB）。
- **PATTERN = _style-reference_ | _line-pattern-name_ | _line-pattern-number_ **
	- 指定线型。
	- *style reference*必须在*style-element:LINESTYLE*中指定LineStyle属性。线型图案可以指定为图案名称或图案编号。下表列出了常用的线型。
| Pattern Number | Pattern Name        | Example                                                                                                                                                |
| -------------- | ------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 1              | Solid               | ![Line pattern Solid](https://documentation.sas.com/api/docsets/grstatproc/3.2/content/images/odsg_lp_solid.png?locale=en)                             |
| 2              | ShortDash           | ![Line pattern ShortDash](https://documentation.sas.com/api/docsets/grstatproc/3.2/content/images/odsg_lp_shortdash.png?locale=en)                     |
| 4              | MediumDash          | ![Line pattern MediumDash](https://documentation.sas.com/api/docsets/grstatproc/3.2/content/images/odsg_lp_mediumdash.png?locale=en)                   |
| 5              | LongDash            | ![Line pattern LongDash](https://documentation.sas.com/api/docsets/grstatproc/3.2/content/images/odsg_lp_longdash.png?locale=en)                       |
| 8              | MediumDashShortDash | ![Line pattern MediumDashShortDash](https://documentation.sas.com/api/docsets/grstatproc/3.2/content/images/odsg_lp_mediumdashshortdash.png?locale=en) |
| 14             | DashDashDot         | ![Line pattern DashDashDot](https://documentation.sas.com/api/docsets/grstatproc/3.2/content/images/odsg_lp_dashdashdot.png?locale=en)                 |
| 15             | DashDotDot          | ![Line pattern DashDotDot](https://documentation.sas.com/api/docsets/grstatproc/3.2/content/images/odsg_lp_dashdotdot.png?locale=en)                   |
| 20             | Dash                | ![Line pattern Dash](https://documentation.sas.com/api/docsets/grstatproc/3.2/content/images/odsg_lp_dash.png?locale=en)                               |
| 26             | LongDashShortDash   | ![Line pattern LongDashShortDash](https://documentation.sas.com/api/docsets/grstatproc/3.2/content/images/odsg_lp_longdashshortdash.png?locale=en)     |
| 34             | Dot                 | ![Line pattern Dot](https://documentation.sas.com/api/docsets/grstatproc/3.2/content/images/odsg_lp_dot.png?locale=en)                                 |
| 35             | ThinDot             | ![Line pattern ThinDot](https://documentation.sas.com/api/docsets/grstatproc/3.2/content/images/odsg_lp_thindot.png?locale=en)                         |
| 41             | ShortDashDot        | ![Line pattern ShortDashDot](https://documentation.sas.com/api/docsets/grstatproc/3.2/content/images/odsg_lp_shortdashdot.png?locale=en)               |
| 42             | MediumDashDotDot    | ![Line pattern MediumDashDotDot](https://documentation.sas.com/api/docsets/grstatproc/3.2/content/images/odsg_lp_mediumdashdotdot.png?locale=en)       |

<font color = ff0055>有效线型编号的范围从1到46</font>。并非所有线型编号都有名称。有关所有可能线型的列表，请参见[SAS Help Center: Available Line Patterns](https://documentation.sas.com/doc/en/pgmsascdc/v_017/grstatgraph/n13pm0ndse66l2n1u309543mx2yt.htm)。我们建议您使用已命名的线型，因为它们经过优化，在同一绘图中使用时具有良好的可分辨性。
==注意==：抗锯齿（anti-aliasing）可能会改变一些具有精细细节的线型图案的外观，例如线型图案33到46。例如，如果为一条线指定黑色和图案33，并且启用了抗锯齿，则该线可能显示为灰色。在这种情况下，可以使用ODSGRAPHICS语句禁用抗锯齿，如下例所示：
```SAS
ods graphics / antialias = off;
```
- **THICKNESS = _style-reference_ | _dimension_ **
	- 指定线条厚度。
	- *style-reference*必须在*style-element-name:LINETHICKNESS*中指定LINETHICK属性。可参见[[Value Type Notation Used for GTL Statement Options#4 尺寸（dimension）]]。

## 4 Marker Options
使用以下一个或多个选项可以指定标记属性。options必须括在括号中，并指定为 *name* = *value*配对的空格分隔列表（space-delimited list）。
- **COLOR = *style-reference* | _color_**
	- 指定填充颜色。
	- *style-reference*必须在*style-element-name:atrribute-name*中指定有效的样式属性，如color、ContrastColor、StartColor、NeutralColor或EndColor。如果未在活动ODS style中定义*style-reference*，则COLOR=选项将被忽略，并使用默认颜色。
	- *color*必须是有效的颜色名称，如RED，或颜色代码，如CXFF0000或#FF0000。<font color=#ff0055>颜色名称不得超过64个字符</font>。颜色代码必须是SAS color-naming scheme中的有效代码，例如RGB、CMYK、HLS或HSV（HSB）。
	- ==注意==：此选项对使用SYMBOLIMAGE语句创建的标记符号没有影响。
- **SIZE = _style-reference_ | _dimension_**
	- 指定标记大小（宽度width和高度height）。
	- *style-reference*必须在*style-element-name:MARKERSIZE*中指定MARKERSIZE属性。
- **SYMBOL = _style-reference_ | _marker-name_**
	- 指定标记的名称。
	- *style-reference*必须在*style-element-name:MARKERSYMBOL*中指定MARKERSYMBOL属性。下表列出了SAS支持的符号。
| Symbol Name    | Plot Symbol                                                                                                                                          | Symbol Name         | Plot Symbol                                                                                                                                                    |
| -------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ArrowDown      | ![ArrowDown marker symbol](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_marker_arrowdown.png?locale=en)           | StarFilled          | ![StarFilled marker symbol](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_marker_starfilled.png?locale=en)                   |
| Asterisk       | ![Asterisk marker symbol](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_marker_asterisk.png?locale=en)             | Tack                | ![Tack marker symbol](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_marker_tack.png?locale=en)                               |
| Circle         | ![Circle marker symbol](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_marker_circle.png?locale=en)                 | Tilde               | ![Tilde marker symbol](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_marker_tilde.png?locale=en)                             |
| CircleFilled   | ![CircleFilled marker symbol](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_marker_circlefilled.png?locale=en)     | Triangle            | ![Triangle marker symbol](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_marker_triangle.png?locale=en)                       |
| Diamond        | ![Diamond marker symbol](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_marker_diamond.png?locale=en)               | TriangleFilled      | ![TriangleFilled marker symbol](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_marker_trianglefilled.png?locale=en)           |
| DiamondFilled  | ![DiamondFilled marker symbol](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_marker_diamondfilled.png?locale=en)   | TriangleDown        | ![TriangleDown marker symbol](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_marker_triangledown.png?locale=en)               |
| GreaterThan    | ![GreaterThan marker symbol](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_marker_greaterthan.png?locale=en)       | TriangleDownFilled  | ![TriangleDownFilled marker symbol](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_marker_triangledownfilled.png?locale=en)   |
| Hash           | ![Hash marker symbol](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_marker_hash.png?locale=en)                     | TriangleLeft        | ![TriangleLeft marker symbol](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_marker_triangleleft.png?locale=en)               |
| HomeDown       | ![HomeDown marker symbol](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_marker_homedown.png?locale=en)             | TriangleLeftFilled  | ![TriangleLeftFilled marker symbol](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_marker_triangleleftfilled.png?locale=en)   |
| HomeDownFilled | ![HomeDownFilled marker symbol](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_marker_homedownfilled.png?locale=en) | TriangleRight       | ![TriangleRight marker symbol](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_marker_triangleright.png?locale=en)             |
| IBeam          | ![IBeam marker symbol](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_marker_ibeam.png?locale=en)                   | TriangleRightFilled | ![TriangleRightFilled marker symbol](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_marker_trianglerightfilled.png?locale=en) |
| LessThan       | ![LessThan marker symbol](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_marker_lessthan.png?locale=en)             | Union               | ![Union marker symbol](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_marker_union.png?locale=en)                             |
| Plus           | ![Plus marker symbol](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_marker_plus.png?locale=en)                     | X                   | ![X marker symbol](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_marker_x.png?locale=en)                                     |
| Square         | ![Square marker symbol](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_marker_square.png?locale=en)                 | Y                   | ![Y marker symbol](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_marker_y.png?locale=en)                                     |
| SquareFilled   | ![SquareFilled marker symbol](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_marker_squarefilled.png?locale=en)     | Z                   | ![Z marker symbol](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_marker_z.png?locale=en)                                     |
| Star           | ![Star marker symbol](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/odsg_marker_star.png?locale=en)                     |                     | 

还可以指定由SYMBOLCHAR和SYMBOLIMAGE语句创建的符号的名称。
- **TRANSPARENCY = _number_**
	- 指定填充区域的透明度。通过此设置，可以设置某些图形类型的填充元素的透明度。
	- 可以仅设置此填充透明度，也可以独立于图形中的其他透明元素设置填充。例如，可以使用此设置为条形图的填充条形设置透明度级别，并使用条形图的DATATRANSPARENCY=选项为bar outlines设置不同的透明度级别。
	- ==默认值==：和语句中DATATRANSPARENCY = 选项相同
	- ==取值范围==：0 - 1，其中0代表不透明（opaque），1代表完全透明
	- ==示例==：`fillattrs = (transparency = 0.5)`
- **WEIGHT = NORMAL | BOLD
	- 指定标记权重。
	- 此选项对使用SYMBOLCHAR和SYMBOLIMAGE语句创建的标记符号没有影响。

## 5 Text Options
使用以下一个或多个选项可以指定文本属性。options必须括在括号中，并指定为 *name* = *value*配对的空格分隔列表（space-delimited list）。
- **COLOR = *style-reference* | _color_**
	- 指定填充颜色。
	- *style-reference*必须在*style-element-name:atrribute-name*中指定有效的样式属性，如color、ContrastColor、StartColor、NeutralColor或EndColor。如果未在活动ODS style中定义*style-reference*，则COLOR=选项将被忽略，并使用默认颜色。
	- *color*必须是有效的颜色名称，如RED，或颜色代码，如CXFF0000或#FF0000。<font color=#ff0055>颜色名称不得超过64个字符</font>。颜色代码必须是SAS color-naming scheme中的有效代码，例如RGB、CMYK、HLS或HSV（HSB）。
	- ==注意==：此选项对使用SYMBOLIMAGE语句创建的标记符号没有影响。
- **FAMILY = _style-reference_ | _"string"_**
	- 指定文本的字体样式族。
	- *style-reference*必须在*style-element-name:FONTFAMILY*中指定一个FONTFAMILY属性。
- **SIZE = _style-reference_ | _dimension_**
	- 指定文本大小。
	- *style-reference*必须在*style-element-name:FONTSIZE*中指定FONTSIZE属性。
	- ==注意==：字体大小不能小于SAS中的最小字体大小，该最小字体大小由SAS系统确定。如果指定的字体大小小于最小字体大小，则使用最小字体大小。
- **STYLE = _style-reference_ | NORMAL | ITALIC**
	- 指定文本的字体样式。
	- *style-reference*必须在*style-element-name:FONTSTYLE中指定一个FONTSTYLE属性。
- **WEIGHT = NORMAL | BOLD**
	- 指定字体权重。
	- *style-reference*必须在*style-element-name:FONTWEIGHT*中指定FONTWEIGHT属性。