📗[SAS Help Center: LAYOUT GRIDDED Statement](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/p1h7wd5z8ihewzn1vy7htk5tu7nr.htm)  
将嵌套 GTL 语句的结果组装到网格中，网格中可能会省略空单元格。  

## 1 语法（Syntax）  
```SAS
LAYOUT GRIDDED </options>;
  GTL-statements;
ENDLAYOUT;
```

## 2 可选参数（Summary of Optional Arguments）  
### 2.1 外观选项（Appearance options）
- **BACKGROUNDCOLOR=_style-reference_ | _color_**  
	- 指定layout的背景颜色。
- **BORDER=TRUE | FALSE**  
	- 指定是否绘制layout的边框。
- **BORDERATTRS=_style-element_ | _style-element (line-options)_ | _(line-options)_**  
	- 指定layout的边框属性。
- **COLUMNGUTTER=_dimension_**  
	- 指定列之间的空白空间量。
- **OPAQUE=TRUE | FALSE**  
	- 指定layout背景是否透明。
- **OUTERPAD=AUTO | _dimension_ | _(pad-options)_** 
	- 指定在布局边框之外添加的额外空间量。
- **PAD=_dimension_ | _(pad-options)_** 
	- 指定在布局边框内添加的额外空间量。
- **SHRINKFONTS=TRUE | FALSE**  
	- 指定布局中的字体是否按比例缩小。  

### 2.2 网格选项（Grid options）  
- **COLUMNS=_integer_**  
	- 指定布局的列数。
- **ROWS=_integer_**  
	- 指定布局的行数。  

### 2.3 布局选项（Layout options）  
- **ROWGUTTER=_dimension_**  
	- 指定行之间的空白空间量。  

### 2.4 图例选项（Legend options）
- **LOCATION=INSIDE | OUTSIDE**  
	- 指定当图例嵌套在覆盖类型布局中时，图例是显示在绘图区域内部还是外部。  

### 2.5 位置选项（Location options）  
- **AUTOALIGN=NONE | AUTO | _(location-list)_**  
	- 指定当嵌套在覆盖类型布局中时，此布局是否在其父级中自动对齐。
- **HALIGN=CENTER | LEFT | RIGHT | _number_**  
	- 当嵌套在覆盖类型或 REGION 布局中时，指定此布局在其父级中的水平对齐方式。
- **VALIGN=CENTER | TOP | BOTTOM | _number_**  
	- 当嵌套在覆盖类型或 REGION 布局中时，指定此布局在其父级中的垂直对齐方式。  

### 2.6 面板选项（Panel options）
- **ORDER=ROWMAJOR | COLUMNMAJOR**  
	- 指定数据单元格是按列优先级还是按行优先级填充。  

## 3 程序示例  
### 3.1 示例1  
创建一个2×2的绘图网格：  
```SAS
/* Define the graph template */
proc template;
  define statgraph graphgridded;
    begingraph;
      entrytitle "Automotive Data";
      layout gridded / columns=2 rows=2 rowgutter=5 columngutter=5;
        /* Define graph for row 1 cell 1 */
       layout overlay / border=on pad=5
         xaxisopts=(label="Mean Highway MPG"
           griddisplay=on gridattrs=(color=lightgray pattern=dot))
         yaxisopts=(label="Type" labelposition=top);
         barchart x=type y=Mpg_Highway / stat=mean orient=horizontal
           barlabel=true barlabelformat=5.0;
       endlayout;

       /* Define graph for row 1 cell 2 */
       layout overlay / border=on pad=5
         yaxisopts=(label="Origin" labelposition=top)
         xaxisopts=(label="Models Produced"
           griddisplay=on gridattrs=(color=lightgray pattern=dot));
         barchart x=Origin y=Models / name="cars" stat=freq
           barlabel=true orient=horizontal;
       endlayout;

       /* Define graph for row 2 cell 1*/
       layout overlay / border=on pad=5
         xaxisopts=(label="Curb Weight (lbs)"
           griddisplay=on gridattrs=(color=lightgray pattern=dot)
           linearopts=(tickvaluesequence=(start=2000 end=8000
           increment=1000)))
         yaxisopts=(label="Horsepower" labelposition=top
           griddisplay=on gridattrs=(color=lightgray pattern=dot));
         pbsplineplot x=weight y=horsepower;
         scatterplot x=weight y=horsepower / datatransparency=0.8;
       endlayout;

       /* Define graph for row 2 cell 1*/
       layout overlay / border=on pad=5
         yaxisopts=(label="Drivetrain" labelposition=top 
           linearopts=(tickvaluesequence=(start=2000 end=8000
             increment=1000)))
         xaxisopts=(label="Models Produced"
           griddisplay=on gridattrs=(color=lightgray pattern=dot));
         barchart category=drivetrain / stat=freq
           barlabel=true orient=horizontal;
        endlayout;
      endlayout;
    endgraph;
  end;
run;

proc sgrender data=sashelp.cars template=graphgridded;
run;
```
结果显示如下：  
![Two-by-Two Grid of Plots that Display Automotive Data](https://documentation.sas.com/api/docsets/grstatgraph/v_002/content/images/gal-griddedgraph-odsg.png?locale=en)  

### 3.2 示例2  
LAYOUT OVERLAY语句嵌套使用LAYOUT GRIDDED语句：  
```SAS
proc template;
 define statgraph inset;
  dynamic VAR;
  begingraph;
   entrytitle "Distribution of " VAR;
   layout overlay / yaxisopts=(griddisplay=on);
    histogram VAR / scale=percent;
    layout gridded / columns=2
        autoalign=(topleft topright) border=true
        opaque=true backgroundcolor=GraphWalls:Color;
     entry halign=left "N";
     entry halign=left eval(strip(put(n(VAR),12.0)));
     entry halign=left "Mean";
     entry halign=left eval(strip(put(mean(VAR),12.2)));
     entry halign=left "Std Dev";
     entry halign=left eval(strip(put(stddev(VAR),12.2)));
    endlayout;
   endlayout;
  endgraph;
 end;
run;

proc sgrender data=sashelp.cars template=inset;
   dynamic VAR="Weight";
run;
```
结果显示如下：  
![Example Graph with Layout Gridded](https://documentation.sas.com/api/docsets/grstatgraph/v_002/content/images/layoutgriddedintro.png?locale=en)  

