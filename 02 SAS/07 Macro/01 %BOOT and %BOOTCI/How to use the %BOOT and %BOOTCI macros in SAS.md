
参考文献：
[How to use the %BOOT and %BOOTCI macros in SAS - The DO Loop](https://blogs.sas.com/content/iml/2018/07/23/boot-and-bootci-macros-sas.html)  
[24982 - Jackknife and Bootstrap Analyses (sas.com)](https://support.sas.com/kb/24/982.html)  

### 1 简介  

自20世纪90年代末以来，SAS 提供了用于 bootstrap 和 jackknife 分析的宏。本文提供了一个示例，说明如何使用 %BOOT 和 %BOOTCI 。%BOOT 生成bootstrap分布，并计算有关 bootstrap 的基本统计信息，包括偏差、标准误差的估计值，以及采样分布正态分布时适用的置信区间。由于 bootstrap 方法通常用于不希望假设统计数据是正态分布的情况，因此 %BOOTCI 支持几个额外的置信区间，例如基于百分比的区间和偏差调整的区间。

您可以从 SAS 支持网站免费下载宏。该网站包括其他示例、文档和关于宏功能的讨论。  

%BOOT 使用简单的均匀随机采样（带替换）或平衡 bootstrap 采样来生成 bootstrap 采样。然后，它调用用户提供的 %ANALYZE 宏来计算统计数据的 bootstrap 分布。  

### 2 如何安装试用 %BOOT 和 %BOOTCI  

要使用宏，请执行以下操作：

1. 下载宏的源文件，并将其保存在 SAS 可访问的目录中。  
2. 定义一个名为%ANALYZE的宏，该宏根据 bootstrap 样本计算 bootstrap 统计信息。  
3. 调用 %BOOT 。 %BOOT 创建三个主要数据集：
	(1) BootData 是一个数据集视图，其中包含数据的B个 bootstrap 样本。（以下示例中，B=5000）。  
	(2) BootDist 是一个包含 bootstrap 分布的数据集。当 %BOOT 在内部调用 BootData 数据集上的 %ANALYZE 时，会创建它。  
	(3) BootStat 是一个数据集，包含有关 bootstrap 分布的统计信息。例如，BootStat 数据集包含 bootstrap 分布的平均值和标准偏差以及其他统计信息。  
4. 如果需要计算置信区间，请使用 %BOOTCI 计算多达六个不同的区间估计值。 %BOOTCI 创建一个名为 BOOTCI 的数据集，该数据集包含用于构造置信区间的统计信息。（也可以使用 %ALLCI 生成多个区间估计值。）  

### 3 示例  


默认情况下， %BOOT 将分析输出数据集中的所有数值变量，因此下一步定义 %analyze ，并使用DROP=data-set 选项来省略 PROC MEANS 自动生成的一些不重要的变量。

定义 %ANALYZE 时，请确保在引导过程中使用 NOPRINT 选项或以其他方式抑制 ODS 输出。包括 %BYSTMT 宏，它将告诉 %BOOT 使用 BY 语句来有效地实现 bootstrap 分析。 %ANALYZE 与上一次对 PROC MEANS 的调用基本相同，只是添加了 NOPRINT、%BYSTMT 和 DROP= 选项：


尽管 DROP= 语句不是必不可少的，但它减少了引导分析期间读取和写入的数据的大小。<font color=red>不要在 %ANALYZE 中使用 KEEP= 语句，因为 %BOOT 将生成其他几个变量（称为_SAMPLE_和_OBS_）作为重新采样过程的一部分</font>。

现在，您可以使用 %BOOT 生成引导程序样本，并计算有关 bootstrap 分布的基本描述性统计信息：