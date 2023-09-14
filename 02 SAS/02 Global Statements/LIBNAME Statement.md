📗[SAS Help Center: LIBNAME Statement](https://documentation.sas.com/doc/en/pgmsascdc/v_042/lestmtsglobal/n1nk65k2vsfmxfn1wu17fntzszbp.htm)  

将 SAS 库与 libref（快捷方式名称）关联或取消关联、清除一个或所有 libref、列出 SAS 库的特征、串联 SAS 库或串联 SAS 目录。  
restriction：默认情况下，SAS 计算服务器处于锁定状态。当 SAS 处于锁定状态时，LIBNAME 语句对于不在锁定路径列表中的文件不可用。处理方式参见[SAS Processing Restrictions in a Locked-Down State](https://documentation.sas.com/doc/en/pgmsascdc/v_042/lepg/p0i4ll0x154tqbn13ogrdoqfk4cc.htm)。  

## 1 语法（Syntax）  
- 格式1  
	```SAS
	LIBNAME libref <engine> 'SAS-library'
	  <libname-options> <engine-host-options>;
	```
- 格式2  
	```SAS
	LIBNAME libref CLEAR | _ALL_ CLEAR;
	```
- 格式3  
	```SAS
	LIBNAME libref LIST | _ALL_ LIST;
	```
- 格式4  
	```SAS
	LIBNAME libref <engine> (library-specification-1 <...library-specification-n>)
	  <libname-options>;
	```

## 2 必要参数（Required Arguments）  
- **_libref_**
	- 是存储 SAS 文件的聚合存储位置（aggregate storage location）的快捷方式名称（shortcut name）或“nickname”。 当您分配新的库引用时，它可以是任何 SAS 名称。当您取消库引用与 SAS 库的关联或列出属性时，请指定先前分配的库引用。  
	- range：1-8 bytes  
	- tip：libref 和 SAS 库之间的关联仅在 SAS 会话期间持续，或者直到您更改它或使用另一个 LIBNAME 语句中断它为止。  
- **_'SAS-library'_**
	- 必须是 SAS 库的物理名称。物理名称是操作环境可识别的名称。将物理名称括在单引号或双引号中。
- **_library-specification_**  
	- 是由物理名称、先前分配的库引用或两者的组合指定的两个或多个 SAS 库。 用空格或逗号分隔每个规范，并将整个列表括在括号中。  
	- _'SAS-library'_：是 SAS 库的物理名称，用引号引起来。  
	- _libref_：是先前分配的 libref 的名称。  
	- restriction：连接库时，您无法指定特定于引擎或操作环境的选项。  
- **CLEAR**
	- 取消关联一个或多个当前分配的库引用。  
	- tip：指定 libref 以解除单个 libref 的关联。指定 _ALL_ 以解除所有当前分配的库引用的关联。  
- **\_ALL\_**
	- 指定 CLEAR 或 LIST 参数适用于所有当前分配的库引用。  
- **LIST**  
	- 将一个或多个 SAS 库的属性写入 SAS 日志。  
	- tip：指定 libref 以列出单个 SAS 库的属性。 指定 _ALL_ 可列出当前会话中具有库引用的所有 SAS 库的属性。  

## 3 可选参数（Optional Arguments）  
- **ACCESS=READONLY | TEMP**  
	- READONLY：为整个 SAS 库分配只读属性。SAS 不允许打开库中的数据集以更新信息或写入新信息。  
	- TEMP：指定将 SAS 库视为临时库。也就是说，系统不会消耗 CPU 周期来确保 Temp 库中的文件不会损坏。（仅当数据可恢复时才使用 ACCESS=TEMP 来节省资源。）  
- **AUTHADMIN=YES | NO**  
	- 指定管理员是否可以访问相应元数据已损坏、配置错误或丢失的元数据绑定库。
	- default：NO
	- restriction：此 LIBNAME 选项只能由元数据绑定库的管理员使用。  
	- interactions
		- 如果管理员在 LIBNAME 语句中指定 AUTHADMIN=YES 并且知道目标数据的密码，则管理员可以通过显式提供该密码来访问该数据。
		- 管理员可以选择在 LIBNAME 语句中指定 AUTHPW= 选项，作为使元数据绑定库密码可供以后请求使用的附加方法。
	- note：使用 AUTHADMIN=YES 的目的是让管理员纠正未对齐的位置和元数据信息。为了确保发出 LIBNAME 语句的用户具有纠正不对齐的管理员权限，该用户必须具有运行 AUTHLIB 过程语句所需的相同权限，并且必须在访问数据集时提供元数据绑定的数据密码。
- **AUTHALTER=_alter-password_**  
	- 指定仅在同时存在这两个条件的数据访问请求中使用 ALTER 密码：
		- AUTHADMIN=YES 在请求中引用的 LIBNAME 语句中指定。
		- 目标元数据绑定数据集或库的正确密码不可用或无效。
- **AUTHPW=_password_**  
	- 指定仅在同时存在这两个条件的数据访问请求中使用的密码：
		- AUTHADMIN=YES 在请求中引用的 LIBNAME 语句中指定或无效。
		- 否则无法获得目标元数据绑定库的正确密码。
- **AUTHREAD=_read-password_**  
	- 指定仅在同时存在这两个条件的数据访问请求中使用的 READ 密码：
		- AUTHADMIN=YES 在请求中引用的 LIBNAME 语句中指定。
		- 目标元数据绑定库的正确密码不可用或无效。 
- **AUTHWRITE=_write-password_**  
	- 为元数据绑定库分配写入密码，以防止用户写入库，除非输入密码。
- **COMPRESS=NO | CHAR | BINARY**  
	- 控制 SAS 库的输出 SAS 数据集中观测值的压缩。
	- NO：指定新创建的 SAS 数据集中的观测值未压缩（固定长度记录）。
	- CHAR：指定 SAS 使用 RLE（Run Length Encoding，运行长度编码）压缩新创建的 SAS 数据集中的观测值（可变长度记录）。 RLE 通过将重复的连续字符（包括空格）减少为两字节或三字节表示来压缩观察结果。（对字符数据使用此压缩算法。）
	- BINARY：指定 SAS 使用 RDC（Ross Data Compression，罗斯数据压缩）对新创建的 SAS 数据集中的观测值进行压缩（可变长度记录）。 RDC 结合游程编码和滑动窗口压缩来压缩文件。
		- tip：此方法对于压缩中型到大型（数百字节或更大）的二进制数据（数字变量）块非常有效。 由于压缩函数一次对单个记录进行操作，因此记录长度需要为数百字节或更大才能有效压缩。
- **CVPBYTES=_bytes_**  
	- 指定处理需要转码的 SAS 数据文件时扩展字符变量长度的字节数。CVP 引擎扩展了长度，以便不会发生字符数据截断。通过将指定值添加到当前长度来增加字符变量的长度。您可以指定 0 到 32,766 之间的值。示例：`libname expand 'SAS data-library' cvpbytes=5`。
	- default：如果您指定 CVPBYTES=，SAS 将自动使用 CVP 引擎根据您的规范扩展字符变量长度。 如果您显式分配 CVP 引擎但未指定 CVPBYTES= 或 CVPMULTIPLIER=，则 SAS 会自动选择乘数 (CVPMULTIPLIER=0) 来增加字符变量的长度。
	- restriction
		- CVP 引擎支持 SAS 数据文件，不支持 SAS 视图、目录、项目存储等。  
		- CVP 引擎仅可用于输入（读取）处理。
		- 对于包含 CVP 引擎的混合引擎的库串联，仅处理 SAS 数据文件。例如，如果执行 COPY 过程，则仅复制 SAS 数据文件。
- **CVPENGINE=_engine_** 
	- 指定用于处理需要转码的 SAS 数据文件的引擎。CVP引擎将字符变量长度扩展为转码，从而不会发生字符数据截断。 然后指定的引擎处理实际的文件。
	- default：SAS 使用默认的 SAS 引擎。
- **CVPFORMATWIDTH=YES | NO**
	 - 指定是否扩展字符格式宽度。
	 - 如果未指定 CVPVARCHAR=，则新格式宽度由 CVPMULTIPILER= 和 CVPBYTES= 选项确定。
	 - 如果指定 CVPVARCHAR=，CVP 引擎会自动调整格式宽度以满足转换后的字符变量的最大字节长度。 例如，在 UTF-8 会话中，格式宽度乘以 4。
- **CVPMULTIPLIER=_multiplier_**
	- 指定在处理需要转码的 SAS 数据文件时扩展字符变量长度的乘数值。CVP 引擎扩展了长度，以便不会发生字符数据截断。通过将当前长度乘以指定值来增加字符变量的长度。 您可以指定 1 到 5 之间的乘数值，也可以指定 0，然后 CVP 引擎会自动确定乘数值。
	- 字符变量长度通过将长度乘以 2.5 来增加。长度为10的字符变量增加到25，长度为100的字符变量增加到250。
	- default：如果您指定 CVPMULTIPLIER= 选项，SAS 将自动使用 CVP 引擎根据您的规范扩展字符变量长度。 如果您显式指定 CVP 引擎，但未指定 CVPMULTIPLIER= 选项或 CVPBYTES= 选项，则 SAS 将使用 CVPMULTIPLIER=0 (AUTO) 来增加长度。AUTO(0) 根据 SAS 会话和输入数据集的编码设置 CVP 引擎的值。
未完待续  

## 4 Engines  
通常，SAS 会自动确定用于访问库中文件的适当引擎。 如果您想使用默认引擎以外的引擎创建库，则可以覆盖自动选择。  
