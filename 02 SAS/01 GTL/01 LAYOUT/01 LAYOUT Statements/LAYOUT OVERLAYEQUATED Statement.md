
📗[SAS Help Center: LAYOUT OVERLAYEQUATED Statement](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/p1o6jpw47ay3pin0z8jwcckzoxsk.htm)  
从一个或多个 GTL 语句构建复合图形（composite）。复合图形（composite）可以是整个Graph。如果此布局嵌套在另一个布局中（例如 GRIDDED 布局），则复合图形通常会为父布局（parent layout）中的一个单元格提供内容。在 OVERLAYEQUATED 布局中，X 轴的显示单位始终等于 Y 轴的显示单位。  
- Restrictions
	- 所有重叠图共享公共 X 轴和 Y 轴。
	- 不允许使用 3-D 图。
	- X 轴和 Y 轴的轴类型始终是线性的，并且直接从数据导出。
	- 具有离散轴（discrete axes）或分箱轴（binned axes）的绘图类型不能用于此布局。这包括 BOXPLOT、BOXPLOTARM、BARCARTPARM、HISTOGRAM 和 HISTOGRAMPARM。
	- 当至少一个绘图变量为字符类型时，或者选项 DISCRETEX=、DISCRETEY=、XBINAXIS= 和 YBINAXIS= 中至少有一个为TRUE时，HEATMAP 和 HEATMAPPARM也不可用于此布局。
	- 可以将以下一个或多个 X-Y 图添加到 LAYOUT OVERLAYEQUATED 语句创建的图形区域：BANDPLOT、CONTOURPLOTPARM、ELLIPSE、ELLIPSEPARM、LOESSPLOT、NEEDLEPLOT、PBSPLINEPLOT、REGRESSIONPLOT、SCATTERPLOT、SERIESPLOT、STEPPLOT 或 VECTORPLOT。
	- 当两个绘图变量均为数值且选项 DISCRETEX=、DISCRETEY=、XBINAXIS= 和 YBINAXIS 均为FALSE时，可以在LAYOUT OVERLAYEQUATED语句创建的图形区域中添加 HEATMAP 和 HEATMAPPARM绘图。
	- 可以添加 FRINGEPLOT、LINEPARM、MODELBAND、REFERENCELINE、DROPLINE、DISCRETELEGEND、CONTINUOUSLEGEND 和基于文本的语句（例如 ENTRY）。
	- 从数据的角度来看，此布局只有两个独立的轴：X 和 Y。如果任何包含的图使用 X=X2 或 Y=Y2 选项，则该选项将被忽略，数据将映射到 X 或 Y 轴。 但是，可以使用 XAXISOPTS= 和 YAXISOPTS= 选项的 DISPLAY2= 子选项来显示 X2 和 Y2 轴。    
- interaction：当嵌套在另一种布局类型中时，OVERLAYEQUATED 布局定义父布局的一个单元格的图形显示。 为每个单元指定单独的 OVERLAYEQUATED 布局。
- tips：
	- 默认情况下，LAYOUT OVERLAYEQUATED 块中指定的第一个图定义轴特性。如果想要另一个图来定义轴特征，请在该图的语句中指定 PRIMARY=TRUE。
	- 重叠图按照指定的顺序堆叠。 最后指定的图放置在顶部。 当绘图堆叠时，绘图的图形数据可能会掩盖其下方绘图的图形数据。在这种情况下，可以更改绘图顺序或使用透明度使所有图形数据可见。  

## 1 语法（Syntax）
```SAS
LAYOUT OVERLAYEQUATED </options>;
  GTL-statements;
ENDLAYOUT;
```

## 2 可选参数（Summary of Optional Arguments）
### 2.1 外观选项（Appearance options）
- **BACKGROUNDCOLOR=_style-reference_ | _color_**
	- 指定layout的背景颜色。
	- default：The GraphBackground: Color style reference
- **BORDER=TRUE | FALSE**
	- 指定是否绘制layout周围的边框。
	- default：FALSE
- **BORDERATTRS=_style-element_ | _style-element (line-options)_ | _(line-options)_
	- 指定layout周围边框的线条属性。
	- default：The GraphBorderLines style element
- **CYCLEATTRS=TRUE | FALSE**
	- 指定嵌套绘图语句中标记、线条和填充的默认视觉属性是否在绘图之间自动更改。
	- ==FALSE==：不循环多个图的默认视觉属性。 例如，如果叠加三个系列图，则每条系列线都具有相同的默认视觉属性。
	- ==TRUE==：尝试使用 GraphData1–GraphDataN 样式元素为适用的图（散点图和系列图等）分配不同的视觉属性。 布局中的某些图不参与循环（例如参考线和垂线）。
	- default：FALSE
- **OPAQUE=TRUE | FALSE**
	- 指定layout的背景是非透明（TRUE）还是透明（FALSE）。
	- default：FALSE
- **OUTERPAD=AUTO | _dimension_ | _(pad-options)_**
	- 指定在布局边框之外添加的额外空间量。
	- ==AUTO==：指定使用该组件的默认外部填充。
	- ==_dimension_==：指定用于布局边框左侧、右侧、顶部和底部的额外空间的尺寸。
	- ==_(pad-options)_==：一个或多个*name-value*填充选项的空格分隔列表，括在括号中。 该列表可以包含以下一个或多个pad options：
		- LEFT=_dimension_
		- RIGHT=_dimension_
		- TOP=_dimension_
		- BOTTOM=_dimension_
	- tip：未分配填充的边将使用默认量进行填充。
	- default：AUTO
- **PAD=_dimension_ | _(pad-options)_**
	- 指定在布局边框内添加的额外空间量。
	- ==_dimension_==：指定用于布局边框左侧、右侧、顶部和底部的额外空间的尺寸。
	- ==_(pad-options)_==：一个或多个*name-value*填充选项的空格分隔列表，括在括号中。 该列表可以包含以下一个或多个pad options：
		- LEFT=_dimension_；default = 0
		- RIGHT=_dimension_；default = 0
		- TOP=_dimension_；default = 0
		- BOTTOM=_dimension_；default = 0
	- tip：未分配填充的边将使用默认量进行填充。
- **WALLCOLOR=_style-reference_ | _color_**
	- 指定绘图墙区域的填充颜色。
	- default：The GraphWalls: Color style reference
	- interaction：若WALLDISPLAY=NONE或WALLDISPLAY=(OUTLINE)，则该选项将被忽略。
- **WALLDISPLAY=STANDARD | ALL | NONE | _(display-options)_**
	- 指定是否显示绘图的墙（wall）和墙轮廓（wall outline）。
	- STANDARD：显示filled wall。GraphWalls样式元素的FrameBorder属性的设置决定是否显示墙轮廓（wall outline）。
	- ALL：显示filled，outlined wall
	- NONE：displays no wall and no wall outline
	- _(display-options)_：指定一个或多个显示选项的空格分隔列表，括在括号中。该列表可以包含以下一个或多个选项：
		- OUTLINE：显示wall outline
		- FILL：显示filled wall area
	- default：STANDARD
	- tips：使用 WALLCOLOR= 选项控制墙壁的填充颜色。所占用单元格的墙壁填充和轮廓的外观属性由 GraphWalls 样式元素设置。对于空单元格，轮廓颜色由 GraphBorderLines 样式元素的 ContrastColor 属性设置，线条样式为实心，线条粗细为 1 像素。  

### 2.2 坐标轴选项（Axes options）
- **COMMONAXISOPTS=_(common-axis-options)_**
	- 指定一个或多个应用于 X 和 Y 等轴的选项。
	- requirements：（1）坐标轴选项必须被括号括起来。（2）每个选项由*name = value*对指定。
	- 参见[Options That Apply to Both Equated Axes](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/n05pxh1t9z177mn16dkhotuweqmv.htm#p0y1n4353mwzbmn1bxfqui64ho8u)  
- **EQUATETYPE=FIT | SQUARE | SQUAREDATA | EQUATE**
	- 指定如何绘制坐标轴区域（axis area）。
	- ==FIT==：指定 X 轴和 Y 轴刻度值之间的间隔长度相等。比较两个轴的数据范围以确定公共间隔大小（common increment size）。轴的长度可能不同，刻度线的数量也可能不同。每个轴代表其自己的数据范围。可以扩展一根轴以使用绘图区域中的可用空间。如果在 COMMONAXISOPTS= 中使用 TICKVALUELIST= 或 TICKVALUESEQUENCE= 选项，则该选项将被忽略。
	- ==SQUARE==：指定 X 轴和 Y 轴具有相同的长度和相同的主刻度值。选择轴长度和刻度值，以便 X 和 Y 的最小值和最大值出现在两个轴上出现的值范围内。
	- ==SQUAREDATA==：指定 X 轴和 Y 轴具有相同的数据范围，但它们可以具有不同的刻度值。在这种情况下，不会发生数据范围的 UNION。 例如，如果 X 轴值为 20 到 40（范围为 20），Y 轴值为 200 到 260（范围为 60），则两个轴的范围都是 60 个单位，但 X 轴可以有 刻度值可以为 0、20、40 和 60，Y 轴可以有刻度值 200， 220、240 和 260。
	- ==EQUATE==：与 FIT 相同，只是两个轴都没有扩展以使用绘图区域中的可用空间。
	- 示例：
		![graphs with different EQUATETYPE settings](https://documentation.sas.com/api/docsets/grstatgraph/v_002/content/images/layoutoverlayequated_equatetype.png?locale=en)  
- **XAXISOPTS=_(axis-options)_**
	- 指定一个或多个X轴选项。
	- 参见[Options That Apply Separately to an X or Y Equated Axis](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/n05pxh1t9z177mn16dkhotuweqmv.htm#n0mjy0h99tw5jen139kw3liupbe6)  
- **YAXISOPTS=_(axis-options)_**
	- 指定一个或多个Y轴选项。
	- 参见[Options That Apply Separately to an X or Y Equated Axis](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/n05pxh1t9z177mn16dkhotuweqmv.htm#n0mjy0h99tw5jen139kw3liupbe6)  

## 3 注意事项（Details）
OVERLAYEQUATED 在几个方面与 OVERLAY 不同。对于OVERLAYEQUALD语句：  
- X 轴和 Y 轴的轴类型始终是线性的。因此，具有离散轴或分箱轴（binned axes）的绘图类型不能在此布局中使用。这包括 BOXPLOT、BOXPLOTARM、BARCARTPARM、HISTOGRAM 和HISTOGRAMPARM。 当一个或两个轴are binned时，HEATMAP 和 HEATMAPPARM也不能在此布局中使用。
- 对于两个轴上相等的数据间隔，显示距离是相同的。例如，X 轴上的间隔 2 映射到与 Y 轴上的间隔 2 相同的显示距离。
- 绘图显示的纵横比等于绘图数据的纵横比。换句话说，数据中的 45 度斜率由图形中的 45 度斜率表示。 EQUATETYPE= 选项确定如何绘制轴。
下图说明了在 OVERLAYEQUATED 布局与 OVERLAY 布局中指定时系列图的映射方式有何不同：  
![Comparison of Overlay and OverlayEquated Layouts](https://documentation.sas.com/api/docsets/grstatgraph/v_002/content/images/aspectratio.png?locale=en)  

## 4 程序示例
## 4.1 示例1
```SAS
proc template;
  define statgraph layoutoverlayequated;
    begingraph;
      entrytitle "Gas Mileage for GMC Models";
      layout overlayequated / equatetype=fit;   
        referenceline y=16.2 /
         curvelabel="City Average for Trucks/SUVs"
         curvelabellocation=inside
         curvelabelattrs=GraphReference;
        referenceline x=20.6 /
         curvelabel="Highway Average for Trucks/SUVs"
         curvelabellocation=inside
         curvelabelattrs=GraphReference;
        scatterplot x=mpg_highway y=mpg_city /
         datalabel=model;
      endlayout;
    endgraph;
  end;
run;
proc sgrender data=sashelp.cars
     template=layoutoverlayequated;
  where make="GMC";
run;
```
结果如下：  
![Example Graph in Layout OverlayEquated](https://documentation.sas.com/api/docsets/grstatgraph/v_002/content/images/layoutoverlayequatedintro.png?locale=en)  

