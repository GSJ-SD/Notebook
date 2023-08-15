布局块（layout blocks）总是以Layout关键字开头，后跟一个指示布局用途的关键字。所有布局块都以ENDLAYOUT语句结束。  
以下部分总结了可用的布局。  
## 1 单单元格布局（Single-cell Layouts）
- **OVERLAY (Single Cell)**
	- 2-D (1 cell)
	- 用于叠加二维图的通用布局。
- **OVERLAYEQUATED (Single Cell)** 
	- 2-D (1 cell)
	- 具有等轴的专用OVERLAY。
- **PROTOTYPE (Single Cell)**
	- 2-D (1 cell)
	- 仅用作 DATAPANEL 或 DATALATTICE 的子布局的专用 LAYOUT。
- **REGION (Single Cell)**
	- 2-D (1 cell)
	- 用于显示不使用轴的单单元格图的通用布局。
- **OVERLAY3D (Single Cell)**
	- 3-D (1 cell)
	- 用于叠加 3D 绘图的通用 3D 布局  。

## 2 多单元格布局（Multi-cell Layouts）
- **LATTICE (Advanced Multi-cell)**
	- 2-D (1 or more cells)
	- 所有单元格都必须预先定义。 轴可以跨列或行或位于网格外部。具有许多网格标记和对齐功能。
- **GRIDDED (Simple Multi-cell)**
	- 2-D (1 or more cells)
	- 所有单元格都必须预先定义。每个单元的轴都是独立的。非常简单的多单元容器。  

## 3 数据驱动布局（Data-driven Layouts）
- **DATAPANEL (Classification Panel)**
	- 2-D (1 or more cells)
	- 根据分类变量显示相似图形的面板。 单元格数量基于 n 个分类变量的乘积。
- **DATALATTICE (Classification Panel)**
	- 2-D (1 or more cells)
	- 根据分类变量显示相似图形的面板。单元格数量基于 1 或 2 个分类变量的乘积。
	- 参见[[LAYOUT DATALATTICE Statement]]。

## 4 图例布局（Legend Layout）
- **GLOBALLEGEND**
	- 1 cell for a legend
	- 用于创建包含多个离散图例的复合图例的专用布局。

