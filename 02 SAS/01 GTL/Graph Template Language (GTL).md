📗参考资料列表
SAS Help Center：[SAS Help Center: REGRESSIONPLOT Statement](https://documentation.sas.com/doc/en/pgmsascdc/v_017/grstatgraph/p0capvje7a9ntmn1gebwnjo1x89k.htm)
📑前置学习：
[[Value Type Notation Used for GTL Statement Options]]

## 1. 图形组成（Components of a Graph）

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