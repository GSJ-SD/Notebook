📗[SAS Help Center: LAYOUT DATALATTICE Statement](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/p0rp226kgxokujn128n7sc7jrp24.htm)   
基于一个或两个分类变量和图形原型（graphical prototype）创建图形网格（a grid of graphs）。 默认情况下，为分类变量的每个可能组合创建原型（ptototype）的单独实例（一个data cell）。  
==Restriction==：只能在 LAYOUT DATALATTICE 块中指定一个 LAYOUT PROTOTYPE 块。 如果指定多个原型块（prototype blocks），则仅遵循指定的最后一个原型块。 其余原型块将被忽略。
==Requirement==：必须至少指定一个 ROWVAR= 选项或一个 COLUMNVAR= 选项。 也可以同时指定两者。

## 1 语法（Syntax）
- syntax 1：同时指定ROWVAR= 和COLUMNVAR=选项  
```SAS
LAYOUT DATALATTICE ROWVAR = calss-variable COLUMNVAR = class-variable </options>;
  LAYOUT PROTOTYPE </options>;
    GTL-statements;
  ENDLAYOUT;
  <SIDEBAR </options>;
    GTL-statement;
  ENDSIDEBAR;>
ENDLAYOUT;
```
- syntax 2：指定COLUMNVAR=选项  
```SAS
LAYOUT DATALATTICE COLUMNVAR = class-variable </options>;
  layout-prototype-block;
  <sidebar-block(s)>;
ENDLAYOUT;
```
- syntax 3：指定ROWVAR=选项  
```SAS
LAYOUT DATALATTICE ROWVAR = class-variable </options>;
  layout-prototype-block;
  <sidebar-block(s)>;
ENDLAYOUT;
```

## 2 可选参数（Summary of Optional Arguments）
### 2.1 外观选项（Appearance options）
- **BACKGROUNDCOLOR=_style-reference_ | _color_**
	- specifies the color of the layout background. 指定布局的背景颜色。
	- default：the GraphBackground: Color style reference.
	- interaction：OPAQUE=TRUE此选项生效（默认OPAQUE=FALSE）。
- **BORDER=TRUE | FALSE**
	- specifies whether a border is drawn around the layout. 指定是否绘制布局边框。
	- default：FALSE。
- **BORDERATTRS=_style-element_<(_line-options_)> | (_line-options_)**
	- specifies the attributes of the border line around the layout. 指定布局边框线的属性
	- default：The GraphBorderLines style element.
	- interaction：BORDER=TRUE时生效。
- **CELLHEIGHTMIN=_dimension_**
	- specifies the minimum height of a cell in the grid. 指定网格中单元格的最小高度。
	- default：100px
- **CELLWIDTHMIN=_dimension_**
	- specifies the minimum width of a cell in the grid. 指定网格中单元格的最小宽度。
	- default：100px
- **COLUMNGUTTER=_dimension_**
	- specifies the amount of empty space that is between the columns. 指定列之间的空白空间量。
	- default：0
- **COLUMNHEADERS=TOP | BOTTOM | BOTH**
	- specifies where to position the outside column heading. 指定外部标题的位置。
	- default：TOP
- **HEADERBACKGROUNDCOLOR=_style-reference_ | _color_**
	- specifies the background color of the cell headers. 指定单元格标题的背景颜色。
	- default：The GraphHeaderBackground: Color style reference.
- **HEADERBORDER=TRUE | FALSE**
	- specifies whether a border is drawn around the header cells. 指定是否在标题单元格周围绘制边框（在SAS 9.4M3及更高版本中应用）。
	- default：TRUE.
- **HEADERLABELDISPLAY=NAMEVALUE | VALUE | NONE**
	- specifies the content of the cell headers. 指定单元标题的内容。
	- ==NAMEVALUE==：在每个单元格标题中将分类变量名称和值显示为*name=value*。示例：`Country=CANADA`。
	- ==VALUE==：仅在每个单元格标题中显示分类变量值。示例：`CANADA`。
	- ==NONE==：忽略单元格标题。
	- default：NAMEVALUE.
- **HEADERLABELATTRS=_style-element_<(_text-options_)> | (_text-options_)**
	- specifies the color and font attributes of the data labels. 指定数据标签的颜色和字体属性。
	- default：The GraphValueText style element.
- **HEADERLABELLOCATION=OUTSIDE | INSIDE**
	- indicates whether the cell header is placed within each cell (INSIDE) or as row and column headers external to the lattice (OUTSIDE).  指示单元格标题是否放置在每个单元格内（内部）或作为网格外部的行和列标题（外部）。
	- default：OUTSIDE.
- **HEADEROPAQUE=TRUE | FALSE**
	- specifies whether the background for cell headers is opaque (TRUE) or transparent (FALSE). 指定单元格标题的背景是不透明 (TRUE) 还是透明 (FALSE)。
	- default：TRUE.
- **HEADERPACK=TRUE | FALSE**
	- specifies whether the header cells are consolidated into a comma-separated list in order to save space. 指定是否将标题单元格合并到以逗号分隔的列表中以节省空间（在SAS 9.4M1及更高版本中应用）。
	- default：FALSE.
- **HEADERSEPARATOR="_string_"**
	- specifies one or more characters to place between each value in the cell header when HEADERPACK=TRUE. 当 HEADERPACK=TRUE 时，指定在单元格标题中的每个值之间放置一个或多个字符。
	- default：a comma followed by a space.
- **HEADERSPLITCOUNT=_positive-integer_**
	- specifies the number of headers to consolidate on a header line before splitting the text to the next line. 指定在将文本拆分到下一行之前要合并在标题行上的标题数量（在SAS 9.4M1及更高版本中应用）。
	- default：the cell header text is not split.
- **OPAQUE=TRUE | FALSE**
	- specifies whether the layout background is opaque (TRUE) or transparent (FALSE). 指定布局背景是不透明 (TRUE) 还是透明 (FALSE)。
	- default：FALSE.
- **OUTERPAD=AUTO | _dimension_ | (_pad-options_)**
	- specifies the amount of extra space to add outside the layout border. 指定在布局边框之外添加的额外空间量。
	- ==AUTO==：指定使用该组件的默认外部填充。
	- ==*dimension*==：指定用于布局边框左侧、右侧、顶部和底部的额外空间的尺寸。
	- ==*(pad-options)*==：一个或多个name-value配对填充选项的空格分隔列表，括在括号中。 该列表可以包含以下一个或多个pad-options：
		- LEFT=*dimension*
		- RIGHT=*dimension*
		- TOP=*dimension*
		- BOTTOM=*dimension*
	- default：AUTO
- **PAD=_dimension_ | _(pad-options)_**
	- specifies the amount of extra space that is added inside the layout border. 指定在布局边框内添加的额外空间量。
	- ==*dimension*==：指定用于布局边框左侧、右侧、顶部和底部的额外空间的尺寸。
	- ==*(pad-options)*==：一个或多个name-value配对填充选项的空格分隔列表，括在括号中。 该列表可以包含以下一个或多个pad-options：
		- LEFT=*dimension*, default = 0
		- RIGHT=*dimension*, default = 0
		- TOP=*dimension*, default = 0
		- BOTTOM=*dimension*, default = 0
- **SHRINKFONTS=TRUE | FALSE**
	- specifies whether fonts in the layout are scaled down. 指定布局中的字体是否按比例缩小。
	- default：FALSE
- **SORTORDER=(COLUMNVAR=_sort-order-keyword_ | ROWVAR=_sort-order-keyword_)**
	- specifies the order of the cells along the columns and rows. 指定单元格沿列和行的顺序。  
	- *order-keyword*可取值如下：
		- AUTO：对于字符数据使用 DATA 排序，对于数字数据使用无格式升序排序。
		- DATA：保留数据顺序。
		- ASCENDINGFORMATTED：使用格式值（formatted values），升序排序。
		- DESCENDINGFORMATTED：使用格式值，降序排序。
	- default：AUTO

### 2.2 坐标轴选项（Axis options）
- **COLUMN2AXISOPTS=(_axis-options_)**
	- specifies X2-axis options for all columns. 为所有列指定 X2 轴选项。
	- 仅在使用支持辅助 X2 轴的plot语句时才需要此选项。 如果不使用plot语句的 XAXIS= 选项将数据映射到 X2 轴，则该选项将被忽略。
	- *axis-options*必须被括在括号中，并以空格间隔。
- **COLUMN2DATARANGE=AUTO | UNIONALL | UNION**
	- specifies how the X2-axes of instances of the _graph-prototype_ are scaled. 指定graph-prototype 实例的 X2 轴如何缩放。
- **COLUMNAXISOPTS=(_axis-options_)**
	- specifies X-axis options for all columns. 指定所有列的 X 轴选项。
	- *axis-options*必须被括在括号中，并以空格间隔。
- **COLUMNDATARANGE=AUTO | UNIONALL | UNION**
	- specifies how the X-axes of instances of the _graph-prototype_ are scaled. 指定graph-prototype实例的 X 轴如何缩放。
	- ==AUTO==：根据 COLUMNWEIGHT= 选项选择 X 轴刻度。 X轴刻度确定如下： 
		- 当 COLUMNWEIGHT=EQUAL（默认）时，选择 UNIONALL。 
		- 当 COLUMNWEIGHT=PROPORTIONAL 且列轴为离散时，选择 UNION。 
		- 否则，选择 UNIONALL。
	- ==UNIONALL==：跨所有布局列和面板缩放 X 轴数据范围（当 PANELNUMBER=选项有效时）。
	- ==UNION==：在每个面板的基础上分别缩放每列的 X 轴数据范围。 缩放不会跨越多个面板。
	- default：AUTO.
- **ROW2AXISOPTS=(_axis-options_)**
	- specifies Y2-axis options for all rows. 为所有行指定 Y2 轴选项。
- **ROW2DATARANGE=AUTO | UNIONALL | UNION**
	- specifies how the Y2-axes of instances of the _graph-prototype_ are scaled. 指定graph-prototype实例的 Y2 轴如何缩放。
	- ==AUTO==：根据 COLUMNWEIGHT= 选项选择 X2 轴刻度。 X2轴刻度确定如下： 
		- 当 COLUMNWEIGHT=EQUAL（默认）时，选择 UNIONALL。 
		- 当 COLUMNWEIGHT=PROPORTIONAL 且列轴为离散时，选择 UNION。 
		- 否则，选择 UNIONALL。
	- ==UNIONALL==：跨所有布局列和面板缩放 X2 轴数据范围（当 PANELNUMBER=选项有效时）。
	- ==UNION==：在每个面板的基础上分别缩放每列的 X2 轴数据范围。 缩放不会跨越多个面板。
	- default：AUTO.
- **ROWAXISOPTS=(_axis-options_)**
	- specifies Y-axis options for all rows. 指定所有行的 Y 轴选项。
- **ROWDATARANGE=AUTO | UNIONALL | UNION**
	- specifies how the Y-axes of instances of the _graph-prototype_ are scaled. 指定graph-prototype实例的 Y 轴如何缩放。  
	- default：AUTO  
*axis-options*参见[[Axis Options for LAYOUT DATALATTICE and LAYOUT DATAPANEL]]。
### 2.3 插入选项（Inset option）
- **INSET=(_variable-list_)**
	- specifies what information is displayed in an inset. 指定在插图中显示什么信息。
	- *variable-list*定义一个或多个变量，其名称和值在数据单元格中显示为一个小表。 变量可以是数字或字符。 变量名称用空格分隔。
- **INSETOPTS=(_appearance-options_)**
	- specifies location and appearance options for the inset information. 指定插入信息的位置和外观选项。  
	- 具体选项定义，参见[INSETOPTS=(_appearance-options_)](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/p0rp226kgxokujn128n7sc7jrp24.htm#n1gnv1qxrgxe0dn1ji408dn8perk)。

### 2.4 布局选项（Layout options）
- **COLUMNS=_integer_**
	- specifies the number of columns in the layout. 指定布局中的列数。
	- 未指定时，列数将调整为COLUMNVAR=选项指定的变量的分类值。
- **COLUMNWEIGHT=EQUAL | PROPORTIONAL**
	- specifies how weights are assigned to the columns widths. 指定如何将权重分配给列宽。
	- ==EQUAL==：所有列具有相同的列宽。
	- ==PROPORTIONAL==：每列的宽度与其包含的离散中点值的数量成正比。
	- restriction：为了使 PROPORTIONAL 发挥作用，至少有一个列轴必须是离散的。 否则，使用 EQUAL。
	- default：EQUAL.
- **HEADERLABELDISPLAY=NAMEVALUE | VALUE | NONE**
	- specifies the content of the cell headers. 指定单元格标题的内容。
- **INCLUDEMISSINGCLASS=TRUE | FALSE**
	- specifies whether to include grid cells for crossings of the ROWVAR and COLUMNVAR variables that contain a missing value. 指定是否包含包含缺失值的 ROWVAR 和 COLUMNVAR 变量交叉的网格单元。
	- default：TRUE
- **PANELNUMBER=_positive-integer_**
	- specifies the number of the panel to produce. 指定要生成的面板数。
	- default：1
	- 示例：假设 ROWVAR=R（R 有 10 个唯一值）并且 COLUMNVAR=C（C 有 11 个唯一值）。 动态网格有 10 行和 11 列，您必须使 HEIGHT= 和 WIDTH= 相当大才能显示 110 个图。 通过设置一些较小的网格大小，例如 ROWS=3 和 COLUMNS=4，并通过将 PANELNUMBER= 的值设置为动态变量或宏变量，您可以创建 10 个面板（9 个面板有 12 个数据单元格，1 个面板有 2 个数据单元格） 显示所有 110 个可能的交叉点。 您只需调用 PROC SGRENDER 或 DATA 步骤 10 次，每次增加 PANELNUMBER 的动态值。
- **ROWGUTTER=_dimension_**
	- specifies the amount of empty space between the rows. 指定行之间的空白空间量。
	- default：0
- **ROWHEADERS=RIGHT | LEFT | BOTH**
	- specifies where to position the outside row heading. 指定外部行标题的位置。
	- default：RIGHT
- **ROWS=_integer_**
	- specifies the number of rows in the layout. 指定布局中的行的数量。
	- 未指定时，列数将调整为ROWVAR=选项指定的变量的分类值。
- **ROWWEIGHT=EQUAL | PROPORTIONAL**
	- specifies how weights are assigned to the row heights. 指定如何将权重分配给行高。
	- ==EQUAL==：所有列具有相同的行高。
	- ==PROPORTIONAL==：每行的高度与其包含的离散中点值的数量成正比。
	- restriction：为了使 PROPORTIONAL 发挥作用，至少有一个行轴必须是离散的。 否则，使用 EQUAL。
	- default：EQUAL.
- **SKIPEMPTYCELLS=TRUE | FALSE**
	- specifies whether the external axes skip the empty cells in a partially filled grid. 指定外轴是否跳过部分填充的网格中的空单元格。
- **START=TOPLEFT | BOTTOMLEFT**
	- indicates whether to start populating the grid from the top left or bottom left corner. 指示是否从左上角或左下角开始填充放置网格。  
	- default：TOPLEFT  
	- 示例1：START=BOTTOMLEFT
	![start set to bottomleft](https://documentation.sas.com/api/docsets/grstatgraph/v_002/content/images/bottomleft.png?locale=en)  
	- 示例2：START=TOPLEFT
	![start set to topleft](https://documentation.sas.com/api/docsets/grstatgraph/v_002/content/images/topleft.png?locale=en)


关于LAYOUT PROTOTYPE模块，参见。
关于SIDEBAR模块，参见。

## 3 程序示例
- 示例1
```SAS
proc template;
 define statgraph layoutdatalattice;
  begingraph;
    entrytitle "Annual Furniture Sales Comparisons";    
    layout datalattice rowvar=country columnvar=year / 
      rowdatarange=union
      headerlabeldisplay=value 
      headerbackgroundcolor=GraphAltBlock:Color
      rowaxisopts=(display=(tickvalues) griddisplay=on
        linearopts=(tickvalueformat=dollar12.))
      columnaxisopts=(display=(tickvalues)  
        timeopts=(tickvalueformat=monname3.));
      layout prototype / cycleattrs=true;
        seriesplot x=month y=TotalActual / name="Actual";
        seriesplot x=month y=TotalPredict / name="Predict";		   
      endlayout;
      sidebar / align=bottom;        
        discretelegend "Actual" "Predict" / border=false;
      endsidebar;
    endlayout;
  endgraph;
 end;
run;

proc summary data=sashelp.prdsal2 nway;
  class country year month;
  var actual predict;
  output out=prdsal2 sum=TotalActual TotalPredict;
run;

proc sgrender data=prdsal2 template=layoutdatalattice;
run;
```
结果：
![Example Layout DataLattice](https://documentation.sas.com/api/docsets/grstatgraph/v_002/content/images/layoutdatalatticeintro.png?locale=en)  

