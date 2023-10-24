[SAS Help Center: BEGINGRAPH Statement](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/n0j696v6yqkb79n12zed3am3omcx.htm)    

定义使用 GTL 语句定义的图形模板的最外层container。   
要求：  
- 所有 STATGRAPH 模板定义必须以 BEGINGRAPH 语句开头并以 ENDGRAPH 语句结束。  
- BEGINGRAPH 块必须包含一个且仅一个布局模块（layout block）。   
- 布局模块及其嵌套布局（如果有）必须至少包含一个绘图（plot）。  

## 1 语法（Syntax）
```SAS
BEGINGRAPH </options>;
  <GTL-global-statements>
  GTL-layout-block
  <GTL-global-statements>
ENDGRAPH;
```

### 1.1 可选参数（Summary of Optional Arguments）
#### 1.1.1 外观选项（Appearance options）
- **ATTRPRIORITY=AUTO | COLOR | NONE**
	- specifies a priority for cycling the group attributes。指定循环组属性的优先级。（？）
	- ==AUTO==：遵循活动样式（active style）或 ODS GRAPHICS 语句中指定的属性优先级轮换模式（attribute rotation pattern）的当前状态。
	- ==COLOR==：通过在保持标记符号、线条图案或填充图案不变的情况下循环颜色列表，将属性优先级旋转模式的当前设置更改为颜色优先级模式。 当所有颜色都用完时，MarkerSymbol、LineStyle 或 FillPattern 属性将递增到下一个元素，然后重复列表中的颜色。 该模式根据需要重复。
	- ==NONE==：将属性优先级轮换模式的当前设置更改为默认模式，该模式在属性列表中逐步循环。
	- tips：如果希望通过颜色、标记和所有使用颜色的 ODS  style的线条更改来区分组，请使用 NONE
	- default：在活动样式或 ODS GRAPHICS 语句中指定的属性优先级模式。
	- interactions：
		- 此选项将覆盖当前样式中指定的属性优先级旋转模式以及 ODS GRAPHICS 语句中的 ATTRPRIORITY= 选项。 数据颜色、对比色、标记符号和线条图案的默认列表在活动样式的 GraphData1–GraphDataN 元素中设置。
		- 这些列表中的各个属性可以使用 BEGINGRAPH 选项 DATACOLORS=、DATACONTRASTCOLORS=、DATALINEPATTERNS= 和 DATASYMBOLS= 覆盖。 
		- ATTRPRIORITY= 选项影响 GROUP=、CYCLEATTRS=TRUE 和显式样式引用（explicit style references）（例如 MARKERATTRS=GraphData2）的样式属性循环。

- **BACKGROUNDCOLOR=_style-reference_ | _color_**
	- specifies the color of the graph background. 指定图形背景颜色。
	- default：the GraphBackground: Color style reference

- **BORDER=TRUE | FALSE**
	- specifies whether a border is drawn around the graph. 指定是否显示图形外边框。
	- default：ODS GRAPHICS语句BORDER=选项设置，默认值为TRUE。
	- interaction：若此选项选择FALSE，则BORDERATTRS=选项将被忽略。

- **BORDERATTRS=_style-element_<(_line-options_)> | (_line-options_)**
	- specifies the attributes of the border line around the graph. 指定图形外边框的属性。
	- default：the GraphBorderLines style element

- **DATACOLORS=(_color-list_)**
	- 指定将替换 GraphData1–GraphDataN  style elements中的图形数据颜色的填充颜色列表。
	- ==*(color-list)*==：以空格分隔的颜色列表，括在括号中。可以使用样式属性引用（例如 GraphData3:color）、颜色名称或 RGB、CMYK、HLS 或 HSV (HSB) 颜色代码来指定颜色。 该列表可以包含样式属性引用、颜色名称和颜色代码的混合。
	- 示例：`datacolors = (CXFF0000 green blue)`
	- 指定此选项后，填充颜色将通过此颜色列表旋转，而不是通过 GraphData1–GraphDataN 样式元素中定义的颜色。
	- default：GraphData1–GraphDataN 样式元素中定义的颜色。
	- interaction：如果适用，FILLATTRS=选项的 COLOR= 子选项会覆盖 DATACOLORS=选项。

- **DATACONTRASTCOLORS=(_color-list_)**
	- 指定将替换 GraphData1–GraphDataN  style elements中的图形数据对比色的对比色列表。
	- 示例：`datacontrastcolors = (red graphdata3:contrastcolor CXFF0000)`
	- default：GraphData1-GraphDataN样式元素中定义的对比颜色。
	- interaction：如果适用，MARKERATTRS= 选项或 LINEATTRS= 选项的 COLOR= 子选项将覆盖 DATACONTRASTCOLORS= 选项。
	- tip：为多个图指定数据属性时，在某些情况下，属性的分配可能不一致。 <font color = #ff0000>为了确保一致的属性分配，请在布局语句中指定选项 CYCLEATTRS=FALSE</font>。

- **DATAFILLPATTERNS=(_fill-pattern-list_)**
	- 指定填充模式（fill patterns）列表，这些patterns将替换 GraphData1–GraphDataN 样式元素中的图形数据填充模式（如果指定）。
	- 此功能适用于 SAS 9.4M5 及更高版本。
	- 示例：`datafillpatterns = (graphdata4:fillpattern L5 X2)`
	- 指定此选项后，填充图案将通过此填充图案列表旋转（rotate through），而不是通过 GraphData1–GraphDataN 样式元素（如果有）中定义的填充图案。
	- default：GraphData1–GraphDataN 样式元素中定义的填充模式（如果有）。
	- interaction：如果适用，FILLPATTERNATTRS= 选项的 PATTERN= 子选项将覆盖 DATAFILLPATTERNS= 选项。
	- tip：为多个图指定数据属性时，在某些情况下，属性的分配可能不一致。 <font color = #ff0000>为了确保一致的属性分配，请在布局语句中指定选项 CYCLEATTRS=FALSE</font>。

- **DATALINEPATTERNS=(_line-pattern-list_)**
	- 指定将替换 GraphData1–GraphDataN 样式元素中的图形数据线条图案的线条图案列表。
	- 以空格分隔的线条图案列表，括在括号中。可以使用样式属性引用（例如 GraphData3:LineStyle）、线条图案编号或线条图案名称（如果适用）来指定图案。该列表可以包含样式属性引用、线条图案编号和线条图案名称的混合。
	- default：GraphData1–GraphDataN 样式元素中定义的线条图案（line patterns）。
	- interaction：在适用的情况下，LINEATTRS= 选项的 PATTERN= 子选项会覆盖 DATALINEPATTERNS= 选项。
	- tip：为多个图指定数据属性时，在某些情况下，属性的分配可能不一致。 为了确保一致的属性分配，请在布局语句中指定选项 CYCLEATTRS=FALSE。
	- 示例：`datalinepatterns = (solid dash 16 26)`

- **DATASKIN=NONE | CRISP | GLOSS | MATTE | PRESSED | SHEEN**
	- 增强了模板中支持数据皮肤（data skins）的所有绘图的视觉外观。
	- 支持 data skins 的绘图语句包括：BARCHART / BARCHARTPARM / BOXPLOT / BOXPLOTPARM / BUBBLEPLOT / DROPLINE / HIGHLOWPLOT / HISTGRAM / HISTGRAMPARM / LINECHART / NEEDLEPLOT / PIECHART / POLYGONPLOT / REFERENCELINE / SCATTERPLOT / SCATTERPLOTMATRIX / SERIESPLOT / STEPPLOT / VECTORPLOT / WATERFALLCHART
	- default：the GraphSkins : DataSkin style attribute，如果它是在当前样式中指定的。 如果当前样式未指定 GraphSkins:DataSkin 样式属性，则默认为 NONE。
	- 从 SAS 9.4M1 开始，在 OVERLAY 或 PROTOTYPE 布局中，每个绘图的蒙皮图形元素（skinned graphical elements）的最大数量限制为 200 个。 当绘图超出此限制时，指定的数据皮肤不会应用于该绘图。 在这种情况下，请在 ODS GRAPHICS 语句中使用 DATASKINMAX= 选项来增加最大限制。
	- interaction：该选项被各个绘图语句中的 DATASKIN= 选项覆盖。
	- note：将数据皮肤应用于具有大量标记的图表可能会对性能产生负面影响。

- **DATASYMBOLS=(_marker-symbol-list_)**
	- 指定标记符号列表，这些标记符号将替换 GraphData1–GraphDataN 样式元素中定义的标记符号中的图形数据标记符号。
	- default：GraphData1–GraphDataN 样式元素中定义的标记符号（marker symbols）。

- **DESIGNHEIGHT=DEFAULTDESIGNHEIGHT | _dimension_**
	- 指定图形的设计高度。（？）
	- default：DEFAULTDESIGNHEIGHT。
	- restriction：可以设置的最小尺寸值为 2 像素。如果指定更小的设置，则使用默认设计高度。
	- interactions：可以在运行时使用 ODS GRAPHICS 语句（模板外部）中的 HEIGHT= 选项指定的渲染高度覆盖设计高度。 此外，ODS 目标语句的 IMAGE_DPI= 选项也会影响高度。 您可以更改 SAS 注册表中 Design Height 注册表项的值。 但是，这样做会影响所有不包含设计高度的明确尺寸的模板的设计高度。 您还可以更改图表样式中的高度设置，但这样做会影响使用该样式的所有模板的高度。

- **DESIGNWIDTH=DEFAULTDESIGNWIDTH | _dimension_**
	- 指定图形的设计宽度。
	- 同DESIGNHEIGHT。

- **DRAWSPACE= GRAPHPERCENT | GRAPHPIXEL | LAYOUTPERCENT | LAYOUTPIXEL | WALLPERCENT | WALLPIXEL | DATAPERCENT | DATAPIXEL | DATAVALUE**
	- 为该 BEGINGRAPH 块中的所有draw statements指定全局绘图空间和绘图单位。
	- default：LAYOUTPERCENT
	- tip：此BEGINGRAPH 块中的各个draw statements可以覆盖此全局设置。

- **OPAQUE=TRUE | FALSE**
	- 指定图形背景是不透明还是透明。

- **PAD=_dimension_ | (_pad-options_)**
	- 指定在图形边框内添加的额外空间量。
	- ==*dimension*==：指定用于布局边框左侧、右侧、顶部和底部的额外空间的尺寸。
	- ==*(pad-options)*==：括号内包含以下一个或多个名称-值对选项的空格分隔列表
		- LEFT = dimension：指定添加到左侧的额外空间量
		- RIGHT = dimension：指定添加到右侧的额外空间量
		- TOP = dimension：指定添加到顶部的额外空间量
		- BOTTOM = dimension：指定添加到底部的额外空间量
	- default：所有侧别10个像素点（pixels）

- **SUBPIXEL=AUTO | OFF | ON**
	- 指定是否使用子像素渲染（subpixel rendering）来绘制平滑的曲线或更精确地绘制间隔条。
	- default：AUTO
	- tips：
		- 如果禁用抗锯齿功能，请使用 ODS GRAPHICS 语句中的 ANTIALIAS=ON 选项来启用它。
		- 当抗锯齿所需的资源超过预设阈值时，抗锯齿会自动禁用。当对全部或部分图形禁用抗锯齿功能时，对整个图形禁用子像素渲染。 SAS 日志中会写入一条注释，提供有关如何在 ODS GRAPHICS 语句中使用 ANTIALIASMAX= 选项来重新启用抗锯齿功能的信息。

#### 1.1.2 坐标轴选项（Axis options）
- **AXISBREAKSYMBOL=BRACKET | NOTCH | SLANTEDLEFT | SLANTEDRIGHT | SQUIGGLE | SPARK | Z**
	- 指定在轴线上指示轴的中断时使用的符号。（此功能适用于 SAS 9.4M3 及更高版本。）
	- default：SQUIGGLE
	- restriction：此选项仅适用于线性轴和时间轴。
	- 要求：
		- AXISBREAKTYPE= 选项必须设置为 AXIS 才能使该选项生效。 
		- 必须使用 INCLUDERANGES= 选项指定轴的范围，此选项才会生效。
		- 轴的 DISPLAY= 选项必须包含轴线，此选项才会生效。
各选项值效果展示如下：
![Axis Break Symbols BRACKET, NOTCH, SLANTEDLEFT, SLANTEDRIGHT, SQUIGGLE, SPARK, and Z for Ranges 1–4 and 6–10 On a Horizontal Linear Axes](https://documentation.sas.com/api/docsets/grstatgraph/v_002/content/images/axisbreaksymbolslinear.png?locale=en)

- **AXISBREAKTYPE=FULL | AXIS**
	- 指定是在整个图形中还是仅在轴线上指示轴断点。（此功能适用于 SAS 9.4M3 及更高版本。）
	- default：FULL
	- 要求：
		- 必须使用 INCLUDERANGES= axis 选项来指定此选项产生影响的轴范围。
		- 必须显示轴线或plot wall outline才能使 AXIS 产生任何效果。否则，使用 FULL。
	- interaction：指定 AXIS 时，如果显示次轴线或plot wall outline，则主轴断线符号将同时显示在主轴和次轴上。 否则，断点符号仅显示在主轴上。
	- tip：使用 AXIS 时，请使用 AXISBREAKSYMBOL= 选项更改中断符号。
各选项值效果展示如下：
![Graph With Axis Break Type FULL and a Graph With Axis Break Type AXIS](https://documentation.sas.com/api/docsets/grstatgraph/v_002/content/images/axisbreaktypes.png?locale=en)

- **AXISLINEEXTENT=FULL | DATA | _number_**
	- 指定所有轴的轴线范围。（此功能适用于 SAS 9.4M3 及更高版本。）
	- ==FULL==：指定沿轴的整个长度延伸的轴线。
	- ==DATA==：指定从最小偏移量到最大偏移量延伸穿过数据范围的轴线。
	- ==*number*==：以小数比例指定轴线从 DATA 向 FULL 延伸的距离。 值 0 相当于 DATA，值 1 相当于 FULL。
		- range：0-1
		- tip：当 DATA 在最小和最大条形的中点位置终止轴线时，数值对于条形图很有用。 在这种情况下，您可以指定一个数值来延长轴线（lengthen the axis line），使其延伸到两个条形的整个宽度。
	- default：FULL
	- restriction：该选项仅在 OVERLAY 和 OVERLAYEQUATED 中有效布局。
	- tips：（1）graph wall outline可能看起来是一条轴线。 在这种情况下，请在布局语句中使用 WALLDISPLAY=NONE 或 WALLDISPLAY=(FILL) 选项来忽略wall outline。（2） 使用 LINEEXTENT= axis 选项可以控制每个轴的轴线范围。
各选项值效果示例如下：
![Graph With Axis Lines Spanning Entire Data Area (LINEEXTENT=FULL), Graph With Axis Lines Between Minimum and Maximum Offsets (LINEEXTENT=DATA), and Graph With Axis Lines Between the Midpoints of the Minimum and Maximum Offsets (LINEEXTENT=0.5)](https://documentation.sas.com/api/docsets/grstatgraph/v_002/content/images/axislineextent.png?locale=en)

- **DISCRETEAXISOFFSETPAD=TRUE | FALSE**
	- 指定是否将附加填充添加到离散轴的最小和最大轴偏移。（此功能适用于 SAS 9.4M3 及更高版本。）
	- tip：当您希望热图占据整个绘图区域时，此选项对于热图很有用。 在这种情况下，除了将此选项设置为 FALSE 之外，还将离散轴的 OFFSETMIN= 和 OFFSETMAX= 设置为 0。

#### 1.1.3 标签选项（Label options）
- **LABELPLACEMENT=AUTO | GREEDY | SA**
	- 指定用于在图中定位标签的标签放置算法（label-placement algorithm）。
	- 影响以下标签：
		- data labels for needle plots, scatter plots, series plots, step plots, and vector plots
		- vertex labels for line charts
		- curve labels when the curve label is positioned at the start or end of the curve
	- ==AUTO==：always select GREEDY
	- ==GREEDY（贪婪）==：指定管理标签冲突的贪婪方法。 贪婪方法尝试不同的放置组合，以便找到避免碰撞的最佳近似值。 使用此方法的标签放置通常不如使用模拟退火 (SA) 方法的标签放置最佳。 然而，根据数据点的数量和标签冲突的可能性，贪婪过程可以明显更快。
	- ==SA（退火）==：指定用于管理标签冲突的模拟退火方法。SA方法尝试确定全局成本最小化函数，该函数基于模拟退火算法。生成的标签放置通常比使用贪婪方法的放置更好。然而，根据数据点的数量和标签冲突的可能性，SA 方法可能会慢得多。
	- restriction
		 - 对于 BANDPLOT 和 LINECHART，当 CURVELABELPOSITION= 选项指定 START 或 END 时，SA方法对曲线标签放置不起作用。
		 - 数据标签放置算法不识别bar labels / curve labels / box plot outlier labels / marker characters。 无论 LABELPLACMENT= 设置如何，这些元素和数据标签之间都可能发生冲突。
	- interactions
		- 此选项覆盖 ODS GRAPHICS 语句LABELPLACEMENT=选项。
		- 仅当 DATALABELPOSITION=AUTO 对plot有效时，此选项才会影响图的标签。
		- 数据标签字体大小可能会减小，以避免标签和标记重叠。 从 SAS 9.4M3 开始，当使用断轴时，数据标签字体大小在标签放置期间不会缩放。

- **SAPLACEMENTOPTS=(_placement-options_)**
	- 指定当 LABELPLACMENT=SA 时标签放置算法的选项。
	- ==*(placement options)*==：
		- MAXITERATIONS = *positive-integer* (default = 100)
		- WEIGHTS = *(keyword-number-list)*
			- LABEL：为标签的重叠分配权重
			- MARKER：为标记和标签的重叠分配权重
			- OUTOFBOUND：为越界或剪裁的标签分配权重
			- PRIORITY：为每个潜在标签位置的优先级分配权重
			- OBSTACLE：为带有垂线（drop lines）、针（needles）、参考线（reference lines）、系列线（series lines）、阶梯线（step lines）和矢量线（vector lines）的标签重叠指定权重
			- default：每个关键词的权重为1.0。
			- restriction：动态变量引用或运行时宏变量引用不能用于指定关键字值。
			- 示例：`saplacementopts = (maxiterations = 100 weights = (LABEL=2.0 OBSTACLE=10.0))`
		- SEED = *positive-integer*：指定模拟退火算法的随机数种子
			- default： 1234567

#### 1.1.4 中点选项（Midpoint options）
- **INCLUDEMISSINGDISCRETE=TRUE | FALSE**
	- 指定是否在离散轴上显示缺失值。
	- default：FALSE
	- interaction：此选项影响模板内的所有charts和plots。

