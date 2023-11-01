
OVERLAYEQUATED 布局中绘图的轴选项通过 LAYOUT OVERLAYEQUATED 语句上的以下选项指定：  
- **COMMONAXISOPTS=_(common-equated-axis-options)_**  
- **XAXISOPTS=_(equated-axis-options)_**  
- **YAXISOPTS=_(equated-axis-options)_**  

## 1 Options That Apply to Both Equated Axes  

本节中记录的选项使用 COMMONAXISOPTS= 选项指定，并应用于 X 轴和 Y 轴。除 VIEWMAX 和 VIEWMIN 之外，其余选项均不能使用 XAXISOPTS= 或 YAXISOPTS= 选项单独应用于 X 或 Y 轴。  

- **INTEGER=TRUE | FALSE**  
	- 指定将均匀间隔的整数值用于刻度线。  
	- default：FALSE
	- interactions：
		- 此选项会被 TICKVALUELIST= 或 TICKVALUESEQUENCE= 选项覆盖。  
		- 此选项会覆盖 TICKVALUEFORMAT= 选项的 MAXDECIMALS= 和 PREFERREDDECIMALS= 子选项。  
		- 当直方图是主图并且在 HISTOGRAM 或 HISTOGRAMPARM 语句中指定 BINAXIS=TRUE 时，X 或 X2 轴将忽略 INTEGER=TRUE。
- **TICKSTYLE=OUTSIDE | INSIDE | ACROSS**  
	- 指定刻度线相对于轴线的位置。
	- OUTSIDE：在轴框架之外显示刻度线。
	- INSIDE：在轴框架内显示刻度线。
	- ACROSS：显示穿过轴线的刻度线。
	- default：The GraphAxisLines: TickDisplay style reference
	- restriction：此选项仅适用于主要刻度线，不会影响次刻度线。
	- interaction：如果 DISPLAY= 或 DISPLAYSECONDARY= 选项不显示刻度线，则忽略此选项。  
	- 示例：
		![placement of ticks with each setting](https://documentation.sas.com/api/docsets/grstatgraph/v_002/content/images/axistickstyle.png?locale=en)  
- **TICKVALUELIST=_(numeric-list)_**  
	- 指定线性轴的刻度值列表。
	- default：内部算法根据实际轴数据范围或 VIEWMIN= 和 VIEWMAX= 选项建立的数据范围来确定刻度线。 默认情况下，使用此选项时，显示的唯一刻度值是 numeric-list 中落在显式数据范围（由 VIEWMIN= 和 VIEWMAX= 设置）或隐式数据范围（由实际数据的最小值和最大值确定）。
	- interactions：  
		- 此选项覆盖 INTEGER= 选项。  
		- 如果 LAYOUT OVERLAYEQUATED 语句指定 EQUATETYPE=FIT（默认值），则忽略此选项。  
		- 如果指定了 TICKVALUESEQUENCE= 选项，或者 DISPLAY= 选项或 DISPLAYSECONDARY= 选项不显示刻度值，则忽略此选项。  
		- VIEWMIN= 和 VIEWMAX= 选项更改轴数据范围。 如果 VIEWMIN= 选项设置为最小刻度列表值，并且 VIEWMAX= 选项设置为最大刻度列表值，则显示刻度列表中的所有刻度。这可能会导致某些数据无法显示。 例如，当 VIEWMIN= 值大于实际数据最小值时，或者当 VIEWMAX= 值小于实际数据最大值时，部分数据将可能不会显示。
		- 如果 TICKVALUEPRIORITY= TRUE，则当 VIEWMIN= 和 VIEWMAX= 选项完全被数字列表包围时，它们将被忽略。勾选数字列表可以扩展轴的隐式数据范围，但不能缩小它。  
		- 如果指定 MINORTICKS=TRUE 并且 TICKVALUELIST= 指定非均匀刻度值，例如 3、5、11 和 23，则忽略 MINORTICK=TRUE。 要在这种情况下显示小刻度线，请在 TICKVALUELIST= 选项中指定统一刻度值，例如 0、10、20 和 30。
		- Tip：==列表中的值根据 TICKVALUEFORMAT= 选项的设置进行格式化==。
- **TICKVALUEPRIORITY=TRUE | FALSE**  
	- 指定轴刻度规范（TICKVALUELIST= 或 TICKVALUESEQUENCE=）是否可以扩展轴数据范围。
	- TRUE：扩展轴数据范围（但不减少）以包括由 TICKVALUELIST= 或 TICKVALUESEQUENCE= 选项指定的最小值和最大值。 如果用户指定值的最小值和最大值在数据范围内，则此选项不生效。
	- FALSE：仅显示由 TICKVALUELIST= 选项指定的刻度值，这些刻度值属于 VIEWMIN= 和 VIEWMAX= 选项设置的显式数据范围或由实际数据最小值和数据最大值设置的隐式数据范围。
	- default：FALSE
- **TICKVALUESEQUENCE=(START=_number_ END=_number_ INCERMENT=_number_)**  
	- 指定刻度值的起始值、终点值和间隔。
	- START=_number_：指定首个刻度值
	- END=_number_：指定最后一个刻度值
	- INCREMENT=_number_：指定间隔
	- default：内部算法根据实际轴数据范围或 VIEWMIN= 和 VIEWMAX= 选项建立的数据范围来确定刻度线。默认情况下，使用此选项时，仅显示那些落在显式数据范围（由 VIEWMIN= 和 VIEWMAX= 设置）或隐式数据范围（由实际数据最小值和数据最大值设置）内的刻度值。
- **VIEWMAX=_number_**  
	- 指定当轴长度和主刻度值相等时要包含在 X 轴和 Y 轴上显示中的最大数据值。 该值可能会通过阈值计算进行调整。
	- default：X轴和Y轴数据的最大值。
- **VIEWMIN=_number_**  
	- 指定当轴长度和主刻度值相等时要包含在 X 轴和 Y 轴上显示中的最小数据值。 该值可能会通过阈值计算进行调整。
	- default：X轴和Y轴数据的最小值。  

## 2 Options That Apply Separately to an X or Y Equated Axis  

|Equated Axis Option|Description|
|---|---|
|[DISPLAY](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/n05pxh1t9z177mn16dkhotuweqmv.htm#n1rfjuuygjjhzjn1fvmrbr80q94dc)|Controls which axis features are displayed on the primary axis.|
|[DISPLAYSECONDARY](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/n05pxh1t9z177mn16dkhotuweqmv.htm#p1afmg6q4uja74n179t7us2ab37yb)|Controls which axis features are displayed on the secondary axis.|
|[GRIDATTRS](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/n05pxh1t9z177mn16dkhotuweqmv.htm#p0v37ko62lbs88n1vnptanzgp1m3c)|Specifies the attributes of the grid lines.|
|[GRIDDISPLAY](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/n05pxh1t9z177mn16dkhotuweqmv.htm#n0ldfibleiwu09n1at63mdtkdvdzc)|Specifies when axis grid lines are displayed.|
|[LABEL](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/n05pxh1t9z177mn16dkhotuweqmv.htm#p0uswk5q03vn2ln1mmgrb11kiuxuc)|Specifies the axis label.|
|[LABELATTRS](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/n05pxh1t9z177mn16dkhotuweqmv.htm#n1bsvb9dy1frz9n1daxzhoze0j53c)|Specifies the color and font attributes of the axis label.|
|[LABELFITPOLICY](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/n05pxh1t9z177mn16dkhotuweqmv.htm#n066qj9jxufvm3n19zq3xy9gx76sb)|Specifies a policy for fitting axis labels in the available space.|
|[LABELSPLITCHAR](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/n05pxh1t9z177mn16dkhotuweqmv.htm#n0oqto8mhrkbi0n16q5uj1qqh4vnb)|Specifies one or more characters on which the axis labels can be split, if needed.|
|[LABELSPLITCHARDROP](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/n05pxh1t9z177mn16dkhotuweqmv.htm#n0wfd8d0xphoxpn1kzhftit7tv20b)|Specifies whether the split characters are included in the displayed axis labels.|
|[LINEEXTENT](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/n05pxh1t9z177mn16dkhotuweqmv.htm#p0s95abx8m6c7in1xs7u9l2apzvla)|Specifies the extent of the axis line.|
|[OFFSETMAX](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/n05pxh1t9z177mn16dkhotuweqmv.htm#n1loxdh119l761n170hz4vz6jqz9b)|Reserves an area at the maximum end of the axis. No tick marks are displayed in the reserved area.|
|[OFFSETMIN](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/n05pxh1t9z177mn16dkhotuweqmv.htm#n0m701c9eq3zdfn13eqfrorry1anb)|Reserves an area at the minimum end of the axis. No tick marks are displayed in the reserved area.|
|[REVERSE](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/n05pxh1t9z177mn16dkhotuweqmv.htm#p07moh82qm6ipgn0zycpxmsb1cfzb)|Specifies whether tick values should appear in the reverse order.|
|[SHORTLABEL](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/n05pxh1t9z177mn16dkhotuweqmv.htm#p16nfm3n0yt4gyn1e0pr5wb2a5udb)|Specifies an alternate axis label to use if the default or specified axis label is too long for the axis length.|
|[THRESHOLDMAX](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/n05pxh1t9z177mn16dkhotuweqmv.htm#p1qphh5ukj4t1nn1uwnfczp2y7l0e)|Specifies a bias for including one more tick mark at the maximum end of the axis.|
|[THRESHOLDMIN](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/n05pxh1t9z177mn16dkhotuweqmv.htm#p1l3gvbt9ksmb1n1s374inqmp489e)|Specifies a bias for including one more tick mark at the minimum end of the axis.|
|[TICKVALUEATTRS](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/n05pxh1t9z177mn16dkhotuweqmv.htm#n16tf3nhu7y3r8n1dp88xdn67vihc)|Specifies the color and font attributes of the axis tick values.|
|[TICKVALUEFITPOLICY](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/n05pxh1t9z177mn16dkhotuweqmv.htm#p0vdq8lmgzk7m9n1sgp629w8dfll)|Specifies a policy for avoiding tick value collision. Only the default policy (THIN) is available for a Y or Y2 axis.|
|[TICKVALUEFORMAT](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/n05pxh1t9z177mn16dkhotuweqmv.htm#n1d6a5udy6jhx9n1qt6htjmygxm7c)|Specifies how to format the values for tick marks.|
|[VIEWMAX](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/n05pxh1t9z177mn16dkhotuweqmv.htm#n1bdw14c9jshnbn1a2zw24t4gcf5i)|Specifies the maximum data value to include in the display on the X or Y axis when the axis lengths and major tick values are not equal.|
|[VIEWMIN](https://documentation.sas.com/doc/en/pgmsascdc/v_041/grstatgraph/n05pxh1t9z177mn16dkhotuweqmv.htm#n1cgmb6vr93al6n1f72hd4vrth97i)|Specifies the minimum data value to include in the display on the X or Y axis when the axis lengths and major tick values are not equal.|