📗[SAS Help Center: LAYOUT PROTOTYPE Statement](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/n1w8znrw5p8g39n1xvg4qfv7mstv.htm)  
由一个或多个*plot-statements*中构建一个复合图形，将该复合图形用作原型（prototype）或“_rubber stamp_”，在父级的 DATALATTICE 或 DATAPANEL 布局的每个单元中重复。  
- restrictions
	- 只能在 LAYOUT DATAPANEL 或 LAYOUT DATALATTICE 块中指定一个 LAYOUT PROTOTYPE 块。如果指定多个原型块（prototype block），则仅遵循指定的最后一个原型块，其余原型块将被忽略。
	- 布局原型块中只能使用以下绘图：BANDPLOT、BARCHART、BARCHARTPARM、BLOCKPLOT、BOXPLOTPARM、COUNTOURPLOTPARM、DROPLINE、ELLIPSEPARM、FRINGEPLOT、HEATMAPPARM、HISTOGRAMPARM、LINECHART、LINEPARM、NEEDLEPLOT、REFERENCELINE、SCATTERPLOT、SERIESPLOT、STEPPLOT、和VECTORPLOT。
	- SCATTERPLOTMATRIX 图、3-D 图和区域图（例如 PIECHART 或 MOSAICPLOTPARM）不能在 LAYOUT PROTOTYPE 块中使用。  
	- ENTRY、DISCRETELEGEND 和 CONTINUOUSLEGEND 语句不能在 LAYOUT PROTOTYPE 块中使用。
	- ==如果绘图语句包含使用 EVAL 表达式定义的列，则无法使用该绘图语句==。
	- 可以将一个或多个二维图和一维图添加到 LAYOUT PROTOTYPE 语句创建的图形区域，前提是所有图形可以共享相同的轴类型。  
	- 如果包含带有 CURVELABEL= 选项的绘图语句（例如 SERIESPLOT），则仅支持 CURVELABELLOCATION=INSIDE。  
	- 如果包含支持 CLIP= 选项的绘图语句（例如 LINEPARM 或 ELLIPSEPARM），则 CLIP 值始终设置为 TRUE。
- requirement：LAYOUT PROTOTYPE 语句必须嵌套在 LAYOUT DATAPANEL 或 LAYOUT DATALATTICE 块中。  

## 1 语法（Syntax）  
```SAS
LAYOUT PROTOTYPE </option(s)>;
  plot-statements;
  <INNERMAGIN </options(s)>;
    block-plot-statement(s); | axis-table statement(s);
  ENDINNERMAGIN;>
  <...more-innermargin-blocks...>>
ENDLAYOUT;
```

## 2 可选参数（Optional Arguments）  
- **ASPECTRATIO=AUTO | _positive-number_**  
	- 指定绘图的墙区域（wall area）的纵横比。
	- ==AUTO==：墙壁面积的大小设置为可以填充整个空间的最大面积 OVERLAY 布局内的可用空间。
	- ==_positive-number_==：0.75 = 3/4 aspect ratio；1.0 = a square aspect ratio.
	- default：AUTO
- **CYCLEATTRS=TRUE | FALSE**  
	- 指定嵌套绘图语句中标记、线条和填充的默认视觉属性是否在绘图之间自动更改。
	- ==FALSE==：不循环多个图的默认视觉属性。 例如，如果叠加三个系列图，则每条系列线都具有相同的默认视觉属性。
	- ==TRUE==：尝试使用 GraphData1–GraphDataN 样式元素为适用的图（散点图和系列图等）分配不同的视觉属性。 布局中的某些图不参与循环（例如参考线和垂线）。
	- default：FALSE
- **WALLCOLOR=_style-reference_ | _color_**  
	- 指定绘图墙区域的填充颜色。
	- default：The GraphWalls: Color style reference
	- interaction：若WALLDISPLAY=NONE或WALLDISPLAY=(OUTLINE)，则该选项将被忽略。
- **WALLDISPLAY=STANDARD | ALL | NONE | _(display-options)_**  
	- 指定是否显示绘图的墙（wall）和墙轮廓（wall outline）。
	- ==STANDARD==：显示filled wall。GraphWalls样式元素的FrameBorder属性的设置决定是否显示墙轮廓（wall outline）。
	- ==ALL==：显示filled，outlined wall
	- ==NONE==：displays no wall and no wall outline
	- ==_(display-options)==_：指定一个或多个显示选项的空格分隔列表，括在括号中。该列表可以包含以下一个或多个选项：
		- OUTLINE：显示wall outline
		- FILL：显示filled wall area
	- default：STANDARD
	- tips：使用 WALLCOLOR= 选项控制墙壁的填充颜色。所占用单元格的墙壁填充和轮廓的外观属性由 GraphWalls 样式元素设置。对于空单元格，轮廓颜色由 GraphBorderLines 样式元素的 ContrastColor 属性设置，线条样式为实心，线条粗细为 1 像素。  

## 3 程序示例  
### 3.1 示例1  
