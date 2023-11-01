
📗[SAS Help Center: REGRESSIONPLOT Statement](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/p0capvje7a9ntmn1gebwnjo1x89k.htm)  

## 程序示例
### 示例1 - 回归图+置信限+预测限+散点图

使用REGRESSIONPLOT语句，叠加MODELBAND语句和SCATTERPLOT语句绘制叠加了散点图，具有置信限和预测限的回归图：  
```SAS
proc template;
  define statgraph RegressionTest1;
    begingraph;
	  entrytitle "回归图测试";
      layout lattice / columngutter=5 columns=1;
	    layout overlay / yaxisopts=(griddisplay=on);
 		  regressionplot x=HEIGHT y=WEIGHT / 
		    alpha = 0.05
			cli = "CLI"
			clm = "CLM"
            name="regression" 
		    curvelabel = "LABEL"
			curvelabellocation = inside;
		  modelband "CLI" / 
            name="cli" 
            display=(outline) 
            outlineattrs=(pattern=shortdash color=CXADD8E6)
			legendlabel="预测限";
		  modelband "CLM" / 
            name="clm"
            display=(outline) 
            outlineattrs=(pattern=solid color=CXADD8E6)
			legendlabel="置信限";
          scatterplot x=HEIGHT y=WEIGHT / 
            name="scatter";
		  discretelegend "cli" "clm" / border=true halign=left valign=top location=inside;
        endlayout;
	  endlayout;
    endgraph;
  end;
run;

proc sgrender data=sashelp.class template=RegressionTest1;
run;
```

结果显示如下：  
![RegressionPlot1](./assets/RegressionPlot1.png)  
