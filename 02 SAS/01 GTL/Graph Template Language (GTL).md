
📗参考资料列表
SAS Help Center：[SAS Help Center: REGRESSIONPLOT Statement](https://documentation.sas.com/doc/en/pgmsascdc/v_017/grstatgraph/p0capvje7a9ntmn1gebwnjo1x89k.htm)  
📑前置学习：
[Value Type Notation Used for GTL Statement Options](https://github.com/GSJ-SD/Notebook/blob/main/02%20SAS/01%20GTL/00%20Atrributes/Value%20Type%20Notation%20Used%20for%20GTL%20Statement%20Options.md)  

## 1 图形组成（Components of a Graph）

![components of a graph](https://documentation.sas.com/api/docsets/grstatgraph/v_001/content/images/anatomy.png?locale=en)

- 图形（Graph） 
	- 数据的视觉表示。 
	- Graph可以包含标题、脚注、图例以及具有一幅或多幅图的一个或多个单元格。 
- 单元格（cell）
	- Graph的一个矩形子区域，可以包含绘图、文本和图例。
- 标题（title）
	- 显示在图表中任何单元格或绘图区域上方的描述性文本。
- 绘图（plot）
	- 数据的直观表示，例如散点图、系列线、条形图或直方图。 多个图可以叠加在一个单元格中。
- 图例（legend） 
	- 统称为legend border，具有一个或多个图例条目（其中每个条目都有一个符号和相应的标签）和一个可选的图例标题。
- 轴（axis）
	- 统称轴线（axis line），包括主刻度（major tick marks）和次刻度（minor tick marks）、主要刻度线值（major tick mark values）和轴标签（axis label）。 每个单元格都有一组由单元格中的所有绘图共享的轴。 在多单元格图中，如果单元格具有相同的数据类型，则单元格的列和行可以共享公共轴。
- 脚注（footnote）
	- 显示在图表中任何单元格或绘图区域下方的描述性文本。
	创建图形语句参见[BEGINGRAPH Statement](https://github.com/GSJ-SD/Notebook/blob/main/02%20SAS/01%20GTL/BEGINGRAPH%20Statement.md)  

## 2 图形布局（Graphical Layouts）
GTL 最强大的功能之一是围绕称为“布局（layouts）”的分层语句块（hierarchical statement blocks）构建的语法。 最外面的布局块（layout blocks）决定：
- Graph的整体组织结构——无论是使用单单元格（single-cell）还是多单元格（multi-cell）显示。
- 块中允许哪些语句（what statements are allowed in the block）。 通常，布局块可以包含绘图（plots）、文本行（lines of text）、图例（legend），甚至其他布局（another layout）。
- 所包含的语句如何相互作用（how the contained statements interact）。
相关笔记参见[[LAYOUT Overview]]。  
### 2.1 GTL中最外层的布局块（outermost layouts in GTL）
- **OVERLAY**
	- 用于在<font color = #ff0055>single-cell</font>中显示二维绘图的通用布局。
- **OVERLAY3D**
	- 用于在<font color = #ff0055>single-cell</font>中显示 3D 绘图的布局。
- **OVERLAYEQUATED**
	- 指定具有等轴（equated axes）的专用 OVERLAY。
- **REGION**
	- 用于显示<font color = #ff0055>不使用轴</font>的<font color = #ff0055>single-cell</font>图形的通用布局。
- **GRIDDED**
	- 绘图（plot）的基本网格。 所有cells都是独立的。
- **LATTICE**
	- 高级的多单元布局（advanced multi-cell layout）。 轴可以跨列或行共享，也可以显示在网格外部。 具有许多网格标记和对齐功能。
- **DATALATTICE**
	- 根据 1 或 2 个分类变量的值生成分类面板（classification panel）。
- **DATAPANEL**
	- 根据 n 个分类变量的值生成分类面板。
- **GLOBALLEGEND**
	- 指定用于创建包含多个离散图例的复合图例的布局。

### 2.2 示例
下图是使用 *LAYOUT LATTICE*语句作为布局中最外层模板生成的两单元图。

![Example Two-cell Graph](https://documentation.sas.com/api/docsets/grstatgraph/v_002/content/images/layoutlattice.png?locale=en)

代码示例如下：
```SAS
proc template;
  define statgraph lattice;
  begingraph;
    entrytitle "Car Performance Profile";
    layout lattice / border=true pad=10 opaque=true
                     rows=1 columns=2 columngutter=3;
      layout overlay;
        scatterplot x=horsepower y=mpg_city /
          group=origin name="cars";
        regressionPlot x=horsepower y=mpg_city / degree=2;
      endlayout;

      layout overlay;
        scatterplot x=weight y=mpg_city / group=origin;
        regressionPlot x=weight y=mpg_city / degree=2;
      endlayout;
      
      sidebar;
        discretelegend "cars";
      endsidebar;
    endlayout;
  endgraph;
  end;
run;
```

LAYOUT LATTICE 语句通常用于创建跨列和行对齐的图的多单元布局。在上述示例中，绘图语句在嵌套（nested）的 LAYOUT OVERLAY 语句中指定。 因此，LATTICE 自动对齐绘图区域和绘图中的刻度显示区域。 当您想要比较相关图的结果时，LATTICE 布局是一个不错的选择。

## 3 绘图（Plots）
GTL 中的图形根据不同的方式进行分类。 
- 在布局块（layout blocks）中，绘图通常根据图形维度（graphical dimension）进行分类：是否以两个或三个视觉维度投影。 因此，GTL 中的图形通常根据其图形维度（graphical dimensions）而不是数据维度（data dimensions）被称为 2-D 或 3-D 图。
- 关于输入数据（input data），图形依据从原始输入数据计算汇总统计量的语句（the statements that calculate summary statistics from raw input data）以及使用计算统计量作为图语句上的输入参数的语句（use calculated statistics as input parameters on the plot statement）进行分类。 ==因此，许多 GTL 绘图语句有两个版本：BARCHART 和 BARCARTPARM、HISTOGRAM 和 HISTOGRAMPARM，等等。 此类图之间的主要区别在于它们接受的输入数据的性质：==
	- **“non-parm”版本**（例如，BARCHART）；根据未汇总的原始数据计算其值。例如，BARCHART计算图表中条形图所需的汇总值。这种绘图通常被称为“<font color=#ff0055>计算绘图（computed plots）</font>”
	- **“parm”版本**（例如，BARCHARTPARM）；不汇总或计算输入数据的值，而是简单地呈现给定的输入数据。因此，输入数据必须预先汇总（pre-summarized）。“parm”版本的绘图，通常被称为“<font color=#ff0055>参数化绘图（parameterized plots）</font>”，产生与non-parm版本相同的结果。然而，它们不执行实现结果所需的计算或数据汇总。

## 4 轴（Axes）
GTL使用各种准则（criteria）来确定图形显示的轴特征。通常，轴特征基于以下准则：
- 布局类型（the layout type）
- 布局中绘图语句的顺序以及在这些语句上指定的选项
- 在绘图上使用“主要（primary）”和“次要（secondary）”轴（支持次要轴时）
- 绘图类型（the plot type）
- 用于定义轴范围的数据列
- 数据列的数据格式
根据布局类型的不同，二维图形最多可以显示四个独立的轴：X、Y、X2和Y2。
X轴和Y轴被视为主轴（primary aces），X2轴和Y2轴被视为次轴（secondary axes）。默认情况下，不显示X2和Y2轴。当需要时，次轴可以显示为主轴的copies，或由数据单独映射。下图为例：
![Example 2D-Graph Identifying Axis Locations](https://documentation.sas.com/api/docsets/grstatgraph/v_002/content/images/ov2daxes.png?locale=en)

所有的3D图形显示标准的X、Y、Z轴：
![Example 3D-Graph Identifying Axis Locations](https://documentation.sas.com/api/docsets/grstatgraph/v_002/content/images/ov3daxes.png?locale=en)

## 5 图例（legends）
许多绘图语句支持 GROUP=选项，该选项将数据划分为唯一值（partitions the data into unique values），执行单独分析（如有必要），并自动为每个组值分配不同的视觉属性。 组值的视觉属性由有效的样式定义。
对于具有组值的图，不会自动显示图例。 相反，必须将适当的图例语句添加到模板中以生成所需的图例。 在以下示例中，添加图例来显示标记（marker）和线条图案（line patterns），这些标记和线条图案显示散点图的组值与相应的线性回归线之间的关联。 该示例显示了 GTL 用于将图例与其相应图关联起来的机制：<font color = #ff0055>为必须在图例中表示的每个图分配一个名称，然后将这些名称用作图例语句的参数</font>（在此例中，示例为MERGEDLEGEND）。
```SAS
proc template;
 define statgraph scatterfit;
  begingraph;
  entrytitle "Linear Regression By Gender";  
   layout overlay; 
     scatterplot x=height y=weight / group=sex name="scat";
     regressionplot x=height y=weight/ group=sex name="reg";
     mergedlegend "scat" "reg" / border=true;
   endlayout;
  endgraph;
 end;
run;
```

![A Legend Must Be Associated with a Named Graph](https://documentation.sas.com/api/docsets/grstatgraph/v_002/content/images/ovlgndgrp.png?locale=en)

## 6 Flexible Templates
GTL 中的几个功能可以使模板定义对输入数据的限制更少，并且本质上更通用。 这些功能使单个编译模板能够产生许多输出变化。
### 6.1 表达式与函数（Expressions and Functions）
在 GTL 中，表达式可用于计算常量和数据列。 <font color = #ff0000>表达式必须包含在 EVAL 构造中</font>。 在表达式中，您可以使用 DATA 步函数（DATA step functions）、算术运算符（arithmetic operators）和 GTL 支持的其他特殊函数。
表达式在 ENTRY 和 ENTRYTITLE 等文本语句中也很有用。 这两个语句都支持富文本并具有特殊的文本命令，例如 {SUP}、{SUB} 和 {UNICODE}，这些命令启用下标、上标和unicode字符。
- 示例：以下template显示了如何使用十六进制 Unicode 值将 ± 符号包含在标题行中。 此外，还会根据输入列 MeanWeight 和 STDERR 计算散点图的上下误差线的新数据列。
```SAS
proc template;
 define statgraph expression;
  begingraph;
  entrytitle "Errorbars show " {unicode "00B1"x} "2 SE";  
   layout overlay;
    scatterplot x=age y=meanweight /
       yerrorlower=eval(meanweight - 2*stderr) /*eval()+表达式生成的新数据列*/
       yerrorupper=eval(meanweight + 2*stderr);
    seriesplot x=age y=meanweight;
   endlayout;
  endgraph;
 end; 
run;
```
### 6.2 动态变量和宏变量（Dynamic Variables and Macro Variables）
通用化模板的一个非常有用的技术是定义动态变量（dynamic varaibles）、宏变量或两者同时定义。动态变量和宏变量在模板执行时解析。以下 PROC TEMPLATE 语句可以在 DEFINE STATGRAPH 模块中使用：
- DYNAMIC
	- 定义一个或多个动态变量（dynamic variables）
	- 通过：（1）FILE PRINT的ODS = 选项的DYNAMIC = 子选项；（2）PROC SGRENDER的DYNAMIC语句赋值
- MVAR
	- 定义一个或多个宏变量（macro variables）
	- %LET或CALL SYMPUT()赋值
- NMVAR
	- 定义一个或多个解析为一个或多个数字的宏变量
	- %LET或CALL SYMPUT()赋值
- NOTES
	- 提供有关图形定义的信息
	- 用户自定义赋值
	示例：
	以下示例定义了一个名为 DYNAMICS 的模板，该模板可以为任何变量创建直方图和密度图。 它定义了宏变量和动态变量以供运行时替换。 模板中没有硬编码（hard code）任何数据相关信息。（可以使用 %LET 语句初始化宏变量，使用 SGRENDER 的 DYNAMIC 语句初始化动态变量。）
```SAS
proc template;
 define statgraph dynamics;
   mvar SYSDATE9 SCALE;
   nmvar BINS;
   dynamic VAR VARLABEL;
   begingraph;
     entrytitle "Histogram of " VAR;
     entrytitle "with Normal Distribution"; 
     layout overlay / xaxisopts=(label=VARLABEL);
       histogram VAR /  scale=SCALE  nbins=BINS; 
       densityplot VAR / normal(); 
     endlayout;
     entryfootnote halign=right "Created: " SYSDATE9 /
       textattrs=GraphValueText;
   endgraph;
 end;
run;

%let bins=6;
%let scale=count;
proc sgrender data=sashelp.class 
              template=dynamics;
  dynamic var="Height" varlabel="Height in Inches";
run;
```

![Graph Generated from Template with Dynamic Variables and Macro Variables](https://documentation.sas.com/api/docsets/grstatgraph/v_002/content/images/ovsgrender.png?locale=en)

### 6.3 条件逻辑（Conditional Logic）
使用条件逻辑（conditional logic），您可以根据现有条件创建具有多个视觉结果或输出表示的模板。 逻辑表达式（logical expression）的求值必须生成一个或多个完整的语句（而不是语句的一部分）。 所有条件逻辑都使用以下结构之一：
- IF Block
	- if (condition) statement(s); endif;
- IF/ELSE Block
	- if (condition) statement(s); else statement(s); endif;
	在 IF 语句中，条件必须用括号括起来。条件（condition）可以是任何涉及算术（arithmetic）、逻辑运算符（logical operators）、比较运算符（comparison oparators）、布尔运算符（boolean operators）或串联运算符（concatenation operators）的标准 SAS 表达式。 该表达式还可以使用 SAS DATA 步骤函数。 <font color = #ff0000>表达式解析为单个数值，即 true 或 false</font>。
	在以下示例中，直方图有条件地与正态分布曲线、核密度估计分布曲线、两者或两者都不重叠：
```SAS
proc template;
  define statgraph conditional;     
   dynamic VAR VARLABEL BINS CURVE;
   begingraph;
    entrytitle "Histogram of " VAR;  
    layout overlay / xaxisopts=(label=VARLABEL);
     histogram VAR /  nbins=BINS; 
	  
     if (upcase(CURVE) in ("ALL"  "KERNEL"))
        densityplot VAR / kernel() name="k" 
                          legendlabel="Kernel"
                          lineattrs=(pattern=dash); 
     endif;	 

     if (upcase(CURVE) in ("ALL" "NORMAL"))
        densityplot VAR / normal() name="n" 
                          legendlabel="Normal";
     endif;

     discretelegend "n" "k"; 
   endlayout;
  endgraph;
 end;
run;
```
<font color = #ff0000>请注意，图例语法不必是有条件的。 在运行时，会检查图例中的每个绘图名称。 如果该图不存在，则其名称将从图例名称列表中删除。</font> 如果 DISCRETELEGEND 语句中没有出现名称，则图例“消失”，并且调整直方图大小以填充剩余空间。

## 7 输出（output）
使用 GTL 时，主要关注定义生成特定图形（specific graphs）并生成特定输出布局（a particular output layout）的模板定义（template definitions）。 最终，您还必须自定义图形环境（customize the graphical environment）以获得您想要的准确输出。<font color = #ff0000> ODS GRAPHICS 语句可用于自定义图形环境，ODS styles使您能够管理输出外观。</font>
### 7.1 ODS GRAPHICS Statement
ODS GRAPHICS 语句用于修改图形模板的执行环境。 ODS GRAPHICS 语句用于控制：
- 是否启用ODS Graphics
- 创建的图像（image）的的类型（type）和名称（name）
- 图像的尺寸
- 是否使用缩放（scaling）和抗锯齿（anti-aliasing）等功能  
以下 ODS GRAPHICS语句使用 HEIGHT= 和 WIDTH= 选项来设置输出图像的长宽比：
```SAS
ods graphics on / height=175px width=200px;
proc sgrender data=sashelp.class template=scatter;
run;
ods graphics off;
```
### 7.2 ODS Styles
执行任何图形模板时，始终存在有效的 ODS  style来控制输出的外观。以下示例中的 ODS 语句使用 Daisy 样式将图形输出发送到 HTML5 输出目标：
```SAS
filename odsout "file-path";
proc template;
   define statgraph heatmapparm;
      begingraph;
         entrytitle "Weight and Height";
         layout overlay / xaxisopts=(offsetmin=0);
            heatmapparm x=height y=weight colorresponse=count /
               name="heatmapparm" xbinaxis=false ybinaxis=false;
            continuouslegend "heatmapparm" / location=outside valign=bottom;
         endlayout;
      endgraph;
   end;
run;
ods _all_ close;
ods graphics / reset width=300px outputfmt=png;
ods html5 path=odsout file="contour.html" style=daisy
   options(bitmap_mode="inline");
proc sgrender data=sashelp.gridded template=heatmapparm;
run;
ods html5 close;
filename odsout clear;
```

![Heat Map with STYLE=DAISY](https://documentation.sas.com/api/docsets/grstatgraph/v_002/content/images/ovdaisy.png?locale=en)

对 ODS style的支持高度集成（highly integrated）到 GTL 语法中。默认情况下，大多数绘图和文本语句的图形外观特征（graphical appearance features）都映射（map）到相应的样式元素（style elements）和关联属性（associated attributes）。因此，您的输出表格和图表始终具有合理的整体外观。 此外，给定 ODS 目标的输出具有一致的外观（例如，表格颜色和图表颜色不冲突）。  
下图中的填充颜色由 ODS 样式中的样式元素 ThreeColorRamp 确定。以下代码显示ThreeColorRamp 样式元素的定义：  
```SAS
style ThreeColorRamp / endcolor = GraphColors("gramp3cend") neutralcolor = GraphColors("gramp3cneutral") startcolor = GraphColors("gramp3cstart");
```

每种style的 ThreeColorRamp 颜色可能有所不同。  
示例1：style = htmlblue  
![Heat Map with STYLE=HTMLBLUE](https://documentation.sas.com/api/docsets/grstatgraph/v_002/content/images/ovhtmlblue.png?locale=en)

示例2：style = journal  
![Heat Map with STYLE=JOURNAL](https://documentation.sas.com/api/docsets/grstatgraph/v_002/content/images/ovjournal.png?locale=en)

