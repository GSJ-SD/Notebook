
📗[SAS Help Center: LAYOUT GLOBALLEGEND Statement](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/p1c2dt1en58r2rn1fbqnrnvylemz.htm)   

创建一个复合图例，其中包含位于图表底部的多个离散图例。  
- restriction：一张图表中只允许使用一个全局图例（global legend）。全局图例内部不支持连续图例（continuous legends）。  
- requirements  
	- 必须将 GLOBALLEGEND 块直接放置在 BEGINGRAPH 块内。不要将其嵌入任何其他 GTL 语句块中。  
	- 使用 LAYOUT GLOBALLEGEND 块时，必须在 LAYOUT GLOBALLEGEND 块中指定模板的所有图例语句。在 LAYOUT GLOBALLEGEND 块之外指定的任何图例语句都将被忽略。  

## 1 语法（Syntax）  
```SAS
LAYOUT GLOBALLEGEND </options>;
  <discretelegend-statement(s) | mergedlegend-statement(s)>;
ENDLAYOUT;
```

## 2 可选参数（Optional Arguments）  
### 2.1 外观选项（Appearance options）  
- **BORDER=TRUE | FALSE**   
	- 指定是否绘制layout边框。 
	- default：FALSE  
- **BORDERATTRS=_style-element_ | _style-element (line-options)_ | _(line-options)_**   
	- 指定layout边框属性。  
	- default：The GraphBorderLines style element  
- **DISPLAYCLIPPED=TRUE | FALSE**   
	- 指定当全局图例的嵌套图例的任何部分由于空间限制而无法完全呈现时是否显示全局图例。  
	- default：FALSE  
- **GUTTER=_dimension_**   
	- 指定嵌套布局之间的间隙。  
	- default：0  
- **OUTERPAD=AUTO | _dimension_ | _(pad-options)_**   
	- 指定在布局边框之外添加的额外空间量。 
	- default：AUTO  
- **PAD=_dimension_ | _(pad-options)_**   
	- 指定在布局边框内添加的额外空间量。 
- **TYPE=ROW | COLUMN**   
	- 指定嵌套图例是否排列成单行或单列。 
	- default：ROW  
- **WEIGHTS=UNIFORM | PREFERRED | _(weight-list)_**   
	- 指定嵌套图例的首选空间分配。  
	- ==UNIFORM==：为所有嵌套图例分配相同的空间。   
	- ==PREFERRED==：为每个嵌套图例分配首选空间量。  
	- ==_(weight-list)_==：以空格分隔的首选空间分配列表，括在括号中。该列表可以将数字与关键字 PREFERRED 组合起来。 每个数字都是相应嵌套图例的比例权重（权重不必总和为 1.0）。关键字 PREFERRED 指定应将首选空间分配给相应的嵌套图例。列表中指定的权重顺序应与嵌套在 GLOBALLEGEND 布局中的图例语句的顺序相对应。  
	- default：UNIFORM  
	- restriction：仅 TYPE=ROW 支持该选项。  
	- tip：当指定权重列表时，所有使用 PREFERRED 的图例都会获得其首选空间。任何剩余空间将按照权重列表中指定的数值按比例在图例之间分配。  

### 2.2 图例标题选项（Legend title options）  
- **LEGENDTITLEPOSITION=LEFT | TOP**   
	- 指定每个嵌套图例标题的位置。  
	- default：LEFT  
- **TITLE = _"string"_**    
	- 指定全局图例的标题。  
	- default：no title  
- **TITLEATTRS=_style-element_ | _style-element (text-options)_ | _(text-options)_**   
	- 指定全局图例标题的颜色和字体属性。  
	- dedault：The GraphLabelText style element  

### 2.3 位置选项（Location options）  
- **HALIGN=CENTER | LEFT | RIGHT**   
	- 指定布局在 BEGINGRAPH 块定义的图形区域内的水平对齐方式。   
	- default：CENTER  

## 3 程序示例  
### 3.1 示例1  
```SAS
proc template;
  define statgraph globallegend;
    begingraph;
      entrytitle "Prediction Ellipses";
      layout overlay;
        scatterplot x=petallength y=petalwidth / group=species name="sp";
        ellipse x=petallength y=petalwidth / type=predicted alpha=0.2
          name="p80" legendlabel="80%" outlineattrs=graphconfidence;
        ellipse x=petallength y=petalwidth / type=predicted alpha=0.05
          name="p95" legendlabel="95%" outlineattrs=graphconfidence2; 
      endlayout;
      layout globalLegend / type=column title="Sample Global Legend";
        discretelegend "sp" / title="Species:";
        discretelegend "p80" "p95" / title="Predictions:";
      endLayout;
    endgraph;
  end;
run;

proc sgrender data=sashelp.iris template=globallegend; 
run;
```
结果显示为：  
![Example Graph with a Global Legend](https://documentation.sas.com/api/docsets/grstatgraph/v_002/content/images/layoutgloballegendintro.png?locale=en)  


