📗[SAS Help Center: LAYOUT LATTICE Statement](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/n0n10xwfn3h4hnn10v5joeerd9m8.htm)  
创建图形网格，自动对齐绘图区域并在网格单元格上勾选显示区域，以方便图形之间的数据比较。空单元格可能会从网格中省略。  

## 1 语法（Syntax）  
```SAS
LAYOUTLATTICE </options>;
  GTL-statement(s) | cell-statement-block(s);
  <COLUMNAXES;
    COLUMNAXIS / axis-options;
    <...more-COLUMNAXIS-statements...>
  ENDCOLUMNAXES;>
  <COLUMN2AXES;
    COLUMNAXIS / axis-options;
    <...more-COLUMNAXIS-statements...>
  ENDCOLUMN2AXES;>
  <ROWAXES;
    ROWAXIS / axis-options;
    <...more-ROWAXIS-statements...>
  ENDROWAXES;>
  <ROW2AXES;
    ROWAXIS / axis-options;
    <...more-ROWAXIS-statements...>
  ENDROW2AXES;>
  <COLUMNHEADERS;
    GTL-statement(s);
  ENDCOLUMNHEADERS;
  <...more-header-statement-block(s)...>>
  <SIDEBAR </options>;
    GTL-statement(s);
  ENDSIDEBAR;>
  <...more-sidebar-statement-blocks...>>
ENDLAYOUT;
```

## 2 可选参数（Optional Arguments）  
### 2.1 外观参数（Appearance options）  
- **BACKGROUNDCOLOR=_style-reference_ | _color_**  
	- 指定layout的背景颜色。
- **BORDER=TRUE | FALSE**  
	- 指定是否绘制layout的边框。
- **BORDERATTRS=_style-element_ | _style-element (line-options)_ | _(line-options)_**  
	- 指定layout的边框属性。
- **COLUMNGUTTER=_dimension_**  
	- 指定列之间的空白空间量。
	- default：0
- **OPAQUE=TRUE | FALSE**  
	- 指定layout背景是否透明。
	- default：FALSE
- **OUTERPAD=AUTO | _dimension_ | _(pad-options)_** 
	- 指定在布局边框之外添加的额外空间量。
	- default：AUTO
- **PAD=_dimension_ | _(pad-options)_** 
	- 指定在布局边框内添加的额外空间量。
- **SHRINKFONTS=TRUE | FALSE**  
	- 指定布局中的字体是否按比例缩小。  
	- default：FALSE

### 2.2 单元格选项（Cell options）  
- **COLUMNWEIGHTS=UNIFORM | PREFERRED | _(weight-list)_**  
	- 指定每列相对于整体网格宽度的比例宽度，不包括标题和侧边栏。
	- UNIFORM：将总可用宽度平均分配给所有列。  
	- PREFERRED：指定每列获得其首选宽度。首选宽度确定如下：
		- 包含一个或多个垂直一维图的列从垂直一维图获得最大首选宽度。
		- 不包含垂直一维图的其余列从剩余空间中获得相同的宽度。
		- interaction：如果在首选列中指定一维箱线图，则箱线图的 BOXWIDTH= 选项将被忽略。
		- notes：PREFERRED 选项用于在网格中混合一维和二维图的 LATTICE 布局。它使布局能够自动计算包含一维图的列的权重。
	- _(weight-list)_：该列表应包含每列的权重，可以表示为以下之一：
		- PREFERRED：指定相应的列获得其首选宽度，如前所述。
		- _number_：指定相应列的宽度基于指定数字与权重列表中数字总数的比例。
			- 示例1：`columnweights=(0.2 0.3 0.5)`  
			- 示例2：`columnweights=(2 3 5)`  
- **ROWWEIGHTS=UNIFORM | PREFERRED | _(weight-list)_**  
	- 指定每行相对于整体网格高度的比例高度，不包括标题和侧边栏。  

### 2.3 列选项（Column options）  
- **COLUMN2DATARANGE=DATA | UNION | UNIONALL**  
	- 指定如何缩放lattice内图形的 X2 轴数据范围。
	- ==DATA==：分别缩放lattice中每个单元格的 X 轴数据范围。
	- ==UNION==：分别缩放lattice中每列的 X 轴数据范围。仅当列中的所有图可以共享相同的数据范围和轴类型时才支持此设置。
	- ==UNIONALL==：缩放lattice中所有列的 X 轴数据范围。仅当列中的所有图可以共享相同的数据范围和轴类型时才支持此设置。
	- default：DATA
	- interactions
		- 仅当数据值连续并且图形具有相同方向时，数据范围才会缩放。如果图形不能使用相同的 X 轴范围或者 COLUMNDATARANGE=DATA，则每个图形的 X 轴范围根据数据确定。  
		- 如果任何单元格中的任何绘图语句包含 XAXIS=X2 选项，则每当 COLUMNDATARANGE= 设置为 UNION 或 UNIONALL 时，该绘图的 X 值都会被忽略。
- **COLUMNDATARANGE=DATA | UNION | UNIONALL**  
	- 指定如何缩放lattice内图形的 X 轴数据范围。  
	- default：DATA  

### 2.4 Lattice选项  
- **COLUMNS=_integer_**  
	- 指定lattice中的列数。
	- default
		- 如果 ORDER= ROWMAJOR，则默认值为 1。  
		- 如果 ORDER=COLUMNMAJOR，则根据需要创建尽可能多的列以满足 ROWS= 请求。
- **ROWS=_integer_**  
	- 指定lattice中的行数。
- **SKIPEMPTYCELLS=TRUE | FALSE**  
	- 指定行轴和列轴是否跳过部分填充的lattice中未使用的单元格。
	- default：FALSE

### 2.5 布局选项（Layout options）  
- **ROWGUTTER=_dimension_**  
	- 指定行之间的空白空间量。  
	- dafault：0

### 2.6 位置选项（Location options）  
- **AUTOALIGN=NONE | AUTO | _(location-list)_**  
	- 指定当嵌套在覆盖类型布局中时，此布局是否在其父级中自动对齐。
	- ==NONE==：不会自动对齐其overlay-type父布局中的布局。因此，该布局在其父布局中的位置由 HALIGN= 和 VALIGN= 选项设置。
	- ==AUTO==：在覆盖类型父布局中，尝试将布局置于距离任何周围数据点标记最远的区域的中心。仅当父布局包含散点图时，此选项才可用。 否则会被忽略。
	- ==_(location list)_==：在父布局中，将布局的可能位置限制为指定*location list*中的位置，并使用与父布局的其他图形功能冲突最少的*location list*位置。位置列表（*location list*）是一个以空格分隔的列表，可以包含以下任意位置：TOPLEFT、TOP、TOPRIGHT、LEFT、CENTER、RIGHT、BOTTOMLEFT、BOTTOM 和 BOTTOMRIGHT。
	- default：NONE
	- restriction：如果此布局语句是最外层布局或者父布局不是overlay-type布局，则忽略此选项。
	- interaction：当此选项不是 NONE 并且父布局是overlay-type布局时，HALIGN= 和 VALIGN= 选项将被忽略。
- **HALIGN=CENTER | LEFT | RIGHT | _number_**  
	- 当嵌套在覆盖类型或 REGION 布局中时，指定此布局在其父级中的水平对齐方式。
	- default：CENTER
- **VALIGN=CENTER | TOP | BOTTOM | _number_**  
	- 当嵌套在覆盖类型或 REGION 布局中时，指定此布局在其父级中的垂直对齐方式。 
	- default：CENTER

### 2.7 面板选项（Panel options）  
- **ORDER=ROWMAJOR | COLUMNMAJOR**  
	- 指定数据单元格是按列优先级还是按行优先级填充。  
	- default：ROWMAJOR

### 2.8 行选项（Row options）  
- **ROW2DATARANGE=DATA | UNION | UNIONALL**  
	- 指定如何缩放lattice内图形的 Y2 轴数据范围。
	- dafault：DATA
- **ROWDATARANGE=DATA | UNION | UNIONALL**  
	- 指定如何缩放lattice内图形的 Y 轴数据范围。
	- default：DATA
## 3 SIDEBAR可选参数
- **ALIGN=TOP | BOTTOM | LEFT | RIGHT**  
	- 指定侧边栏的对齐方式。
	- default：BOTTOM
- **SPACEFILL=TRUE | FALSE**  
	- 指定是否用其内容填充侧边栏的所有区域。
	- default：TRUE  
另可参见[SIDEBAR Statement](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/p19ojovpcbvdhtn1dxov5wl9rzfm.htm).  

## 4 Details  
LAYOUT LATTICE 语句创建跨行和列对齐的图形网格。 对于在布局块中指定或嵌套在 LAYOUT OVERLAY 语句中的绘图语句，LATTICE 布局会自动对齐绘图区域和刻度显示区域。  

为了实现对齐，LATTICE 布局自动对齐绘图区域并跨行和列对齐刻度显示区域。 此外，它还会覆盖在这些行和列中指定的 OVERLAY 布局中的轴偏移设置。如果不希望使用这种对齐方式，则可以使用 LAYOUT GRIDDED 代替。 例如，如果您有异构图形面板，例如散点图、箱线图、条形图或其他类型图形的混合，那么您可以考虑使用 LAYOUT GRIDDED 而不是 LAYOUT LATTICE。  

布局可以根据为 COLUMNDATARANGE= 和 ROWDATARANGE= 选项设置的值来统一图中显示的数据范围的比例。 如果模板中的一个或多个绘图使用 XAXIS= 选项生成独立的 X2（顶部）轴，则可以根据为 COLUMN2DATARANGE= 选项设置的值统一 X2 数据比例。 如果模板中的一个或多个绘图使用 YAXIS= 选项生成独立的 Y2（右）轴，则可以根据为 ROW2DATARANGE= 选项设置的值统一 Y2 数据比例。 可以针对每列、每行或两者单独缩放数据范围。 或者它们可以跨所有列、所有行或两者都缩放。  

当数据范围比例统一时，您可以通过仅显示适用于相应列或行的所有图形的行轴和列轴来简化网格。  

下图显示了带有默认轴显示（显示内部轴）的 LATTICE 布局的各个部分：  
![Parts of a Lattice Layout](https://documentation.sas.com/api/docsets/grstatgraph/v_002/content/images/latticeinternaxes.svg?locale=en)  

下图显示了当图形显示被简化为仅显示行轴和列轴时 LATTICE 布局的部分：  
![Parts of a Lattice Layout Displaying Row and Column Axes](https://documentation.sas.com/api/docsets/grstatgraph/v_002/content/images/latticeexternaxes.svg?locale=en)  

## 5 Cell Contents  
以下通用语法用于定义布局lattice中每个单元格的内容：  
`GTL-statement(s) | cell-statement-block(s)`  
一个`cell-statement-block`的语法如下：  
```SAS
CELL;
  <CELLHEADER; GTL-statement(s); ENDCELLHEADER;>
  GTL-statement(s);
ENDCELL;
```
以下准则适用于定义单元格内容：   
- 每个单元格的内容由 GTL 语句生成，可以独立指定或包含在 CELL 块中。
- 独立的GTL语句包括文本语句、绘图语句或布局块。每个独立指定的 GTL 语句或布局块都为一个单元格提供内容。  
- CELL 块可以包含文本语句、绘图语句或布局块。 每个 CELL 块提供一个单元格的内容。  
- 在 CELL 块中，可以使用 CELLHEADER 块在单元格内生成一个或多个标题行。在 CELLHEADER 块内的单独 GTL 语句上指定每个标题行。标头块通常用于指定一个或多个文本语句，但块内允许其他语句。例如，可以指定 LAYOUT GRIDDED 语句来为标题生成文本网格。
- 每个 CELL 块只能使用一个 CELLHEADER 块。 如果指定多个，则仅使用最后一个。  
- 如果不在 CELL 块中指定 CELLHEADER 块，则所包含的 GTL 语句将产生与单独指定它们时产生的结果相同的结果。  
- 如果需要多个绘图语句来生成单元格的内容，则应将绘图语句放置在布局块中，例如 LAYOUT OVERLAY。否则，可能会出现意想不到的结果。这适用于独立的 GTL 语句和 CELL 块中的 GTL 语句。  
如果lattice单元的 CELL 块或独立语句或布局块不产生任何输出，则该单元的空间可能不会保留为lattice中的空单元。 在这种情况下，空单元将被删除，剩余的单元（如果有）填充lattice中的间隙。 当该语句所需的数据无法解析时，该语句不会产生输出。当布局块不包含任何语句或块中包含的任何语句都不产生任何输出时，布局块不会产生输出。  
### 5.1 示例
示例代码显示了一个 LAYOUT LATTICE 块，该块使用一个 GTL 语句和一个 CELL 块来生成两列网格：  
```SAS
proc template;
  define statgraph cellcontents;
    begingraph;
      layout lattice /
        columngutter=5 columns=2;

        /* independent plot statement - defines first cell */
        scatterplot x=age y=height;

        /* cell block - defines second cell */
        cell;
          cellheader;
            entry "Cell Header" / border=true;
          endcellheader;
          /* two plot statements are needed - enclose
             the statements in a LAYOUT OVERLAY block */
          layout overlay;
            scatterplot x=weight y=height;
            referenceline y=53 / lineattrs=(pattern=shortdash)
              curvelabellocation=inside curvelabel="Reference Line";
          endlayout;
        endcell;
      endlayout;
    endgraph;
  end;
run;

proc sgrender data=sashelp.class template=cellcontents;
run;
```
结果显示如下：  
![Lattice Layout with Independent Plot Statements and a CELL Block](https://documentation.sas.com/api/docsets/grstatgraph/v_002/content/images/latticecellcontents.png?locale=en)  

## 6 Row and Column Axis Statements  
参见：[Row and Column Axis Options for LAYOUT LATTICE](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/n1qofxjozey314n10ejp8qm31rru.htm) .  
- 示例1：a lattice with internal axes.  
	![Lattice Layout that Displays Internal Axes](https://documentation.sas.com/api/docsets/grstatgraph/v_002/content/images/latticeaxisinternal.png?locale=en)  
- 示例2：a lattice with row and column axes.  
	![Lattice Layout that Displays Row and Column Axes](https://documentation.sas.com/api/docsets/grstatgraph/v_002/content/images/latticeaxisexternal.png?locale=en)  

## 7 Header Statements  
标题语句用于显示 LATTICE 布局中的行和列的一个或多个标题。每个语句都以statement -ENDstatement 的形式指定为一个块。标题块通常用于指定一个或多个文本语句，但块内允许其他语句。例如，可以指定 LAYOUT GRIDDED 语句来生成标题的文本网格。可以使用以下标题语句：  
- COLUMNHEADERS
- COLUMN2HEADERS
- ROWHEADERS
- ROW2HEADERS  

## 8 程序示例  
### 8.1 示例1  Lattice with Internal Axese
```SAS
/* Create the stock data for Microsoft for the years 2001 and 2002 */
data stockyear1 stockyear2;
  set sashelp.stocks(where=(stock eq "Microsoft" and year(date) in (2001 2002)));
  volume = volume/1000000;
  if year(date) = 2001 then 
    output work.stockyear1;
  else if year(date)=2002 then
    output work.stockyear2;
run;

data msstock;
  merge work.stockyear1(rename=(date=year1date close=year1close volume=year1vol))
    work.stockyear2(rename=(date=year2date close=year2close volume=year2vol));
  format year1date year2date monname3. year1close year2close dollar6.;
run;

/* Create the graph template */
proc template;
  define statgraph graphlattice;
    begingraph;
      entrytitle "Microsoft Stock Performance in 2001 and 2002";
      layout lattice / columns=2 columngutter=5 rowgutter=5;
        /* Column headers */
        column2headers;
          entry textattrs=GraphData1(weight=bold size=9pt) "Year 2001";
          entry textattrs=GraphData2(weight=bold size=9pt) "Year 2002";
        endcolumn2headers;

        /* Row 1 content (cells 1-2) */
        layout overlay /
          xaxisopts=(display=(ticks tickvalues) 
            timeopts=(viewmax='01DEC2001'd tickvalueformat=monname3.))
          yaxisopts=(label="Closing Price");
          seriesplot x=year1date  y=year1close / display=all smoothconnect=true
            lineattrs=GraphData1 markerattrs=GraphData1;
        endlayout;
        layout overlay /
          xaxisopts=(display=(ticks tickvalues) 
            timeopts=(viewmax='01DEC2002'd tickvalueformat=monname3.))
          yaxisopts=(label="Closing Price");
          seriesplot x=year2date  y=year2close / display=all smoothconnect=true
            lineattrs=GraphData2 markerattrs=GraphData2;
        endlayout;

        /* Row 2 content (cells 3-4) */
        layout overlay /
          xaxisopts=(display=(ticks tickvalues) 
            timeopts=(viewmax='01DEC2001'd tickvalueformat=monname3.))
          yaxisopts=(label="Volume (Millions)");
          needleplot x=year1date  y=year1vol / displaybaseline=off
            lineattrs=GraphData1;
        endlayout;
        layout overlay /
          xaxisopts=(display=(ticks tickvalues) 
            timeopts=(viewmax='01DEC2002'd tickvalueformat=monname3.))
          yaxisopts=(label="Volume (Millions)");
          needleplot x=year2date  y=year2vol / displaybaseline=off
            lineattrs=GraphData2;
        endlayout;
      endlayout;
    endgraph;
  end;
run;

proc sgrender data=msstock template=graphlattice;
run;
```
结果显示如下：  
![Lattice with Internal Axes](https://documentation.sas.com/api/docsets/grstatgraph/v_002/content/images/latticeinternalaxisexample.png?locale=en)  

### 8.2 示例2  Lattice with Row and Column Axes
```SAS
/* Create the stock data for Microsoft for the years 2001 and 2002 */
data stockyear1 stockyear2;
  set sashelp.stocks(where=(stock eq "Microsoft" and year(date) in (2001 2002)));
  volume = volume/1000000;
  if year(date) = 2001 then 
    output work.stockyear1;
  else if year(date)=2002 then
    output work.stockyear2;
run;

data msstock;
  merge work.stockyear1(rename=(date=year1date close=year1close volume=year1vol))
    work.stockyear2(rename=(date=year2date close=year2close volume=year2vol));
  format year1date year2date monname3. year1close year2close dollar6.;
run;

/* Create the graph template */
proc template;
  define statgraph graphlattice;
    begingraph;
      entrytitle "Microsoft Stock Performance in 2001 and 2002";
      layout lattice / columns=2 columndatarange=union columngutter=5
        rowdatarange=union rowgutter=5;
        /* Column headers */
        column2headers;
          entry textattrs=GraphData1(weight=bold size=9pt) "Year 2001";
          entry textattrs=GraphData2(weight=bold size=9pt) "Year 2002";
        endcolumn2headers;

        /* Column and row axes */
        columnaxes;
          columnaxis / display=(ticks tickvalues)
            timeopts=(viewmax='01DEC2001'd tickvalueformat=monname3.);
          columnaxis / display=(ticks tickvalues)
            timeopts=(viewmax='01DEC2002'd tickvalueformat=monname3.);
        endcolumnaxes;
        rowaxes;
          rowaxis / label="Closing Price";
          rowaxis / label="Volume (Millions)";
        endrowaxes;

        /* Row 1 content */
        layout overlay;
          seriesplot x=year1date  y=year1close / display=all smoothconnect=true
            lineattrs=GraphData1 markerattrs=GraphData1;
        endlayout;
        layout overlay;
          seriesplot x=year2date  y=year2close / display=all smoothconnect=true
            lineattrs=GraphData2 markerattrs=GraphData2;
        endlayout;

        /* Row 2 content */
        layout overlay;
          needleplot x=year1date  y=year1vol / displaybaseline=off
             lineattrs=GraphData1;
        endlayout;
        layout overlay;
          needleplot x=year2date  y=year2vol / displaybaseline=off
             lineattrs=GraphData2;
        endlayout;
      endlayout;
    endgraph;
  end;
run;

proc sgrender data=msstock template=graphlattice;
run;
```
结果显示为：  
![Lattice with Row and Column Axes](https://documentation.sas.com/api/docsets/grstatgraph/v_002/content/images/latticeexternalaxisexample.png?locale=en)  

### 8.3 示例3 Lattice with Sidebar  
```SAS
proc template;
  define statgraph layoutlattice;
    begingraph;
      entrytitle "Vehicle Gas Mileage";
      entryfootnote "Averages of 428 models from 38 manufactures";
      layout lattice / columns=2 rowdatarange=union;        
        layout overlay / cycleattrs=true;
          barchart x=origin y=mpg_highway / stat=mean barwidth=.8 name="H" ;
          barchart x=origin y=mpg_city / stat=mean barwidth=.5 name="C" ;
        endlayout;
        layout overlay / cycleattrs=true;
          barchart x=type y=mpg_highway / stat=mean barwidth=.8;
          barchart x=type y=mpg_city / stat=mean barwidth=.5;
        endlayout;
        sidebar / align=top; 
          discretelegend "H" "C" / border=false;
        endsidebar;
        rowaxes;
          rowaxis / display=(tickvalues) displaysecondary=(tickvalues)
            griddisplay=on;
        endrowaxes;     
      endlayout;
    endgraph;
  end;
run;
proc sgrender data=sashelp.cars template=layoutlattice;
run;
```
结果显示为：  
![Example Graph in Layout Lattice](https://documentation.sas.com/api/docsets/grstatgraph/v_002/content/images/layoutlatticeintro.png?locale=en)  
