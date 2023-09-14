SQL 过程是结构化查询语言（Structured Query Language）的基本 SAS 实现。PROC SQL 是 Base SAS 软件的一部分，可以将其与任何 SAS 数据集（表）一起使用。通常，PROC SQL 可以替代其他 SAS 过程或 DATA 步骤。可以将 SAS 语言元素（例如全局语句、数据集选项、函数、信息和格式）与 PROC SQL 一起使用，就像使用其他 SAS 过程一样。PROC SQL 使您能够执行以下任务：
- generate reports
- generate summary statistics
- retrieve(取出) data from tables or views
- combine data from tables or views
- create tables, views, and indexes
- update the data values in PROC SQL tables
- update and retrieve data from database management system (DBMS) tables
- modify a PROC SQL table by adding, modifying, or dropping columns  

PROC SQL 可以在交互式 SAS 会话或批处理程序中使用，并且可以包含全局语句，例如 TITLE 和 OPTIONS。  

根据 SQL 的 ANSI 标准，缺失值称为空值（null value）。它与空白值（blank value）或零值（zero value）不同。但是，为了与 SAS 的其余部分兼容，PROC SQL 将缺失值视为空白或零值，并将这三个值都视为空值（null value）。

## 1 Retrieving Data from a Single Table  
### 1.1 Overview of the SELECT Statement  
本章向您展示如何执行以下任务：  
- 使用 SELECT 语句从单个表中检索数据
- 使用 VALIDATE 语句验证 SELECT 语句的正确性  

SELECT 语句是 PROC SQL 的主要工具。可以使用它来识别、检索和操作表中的数据列，还可以在 SELECT 语句中使用多个可选子句来对查询进行限制。

- 🔵<font color=#4857CB>SELECT and FROM Clauses</font>
	SELECT 语句必须包含 SELECT 子句和 FROM 子句，这两个子句在 PROC SQL 查询中都是必需的。
- 🔵<font color=#4857CB>WHERE Clause</font>
	WHERE 子句使您能够通过指定表的每一行必须满足的条件来限制检索的数据。PROC SQL 仅输出包含满足条件的行。
	```SAS
	select name
	  from sql.countries
	  where Population gt 5000000;
	```
- 🔵<font color=#4857CB>ORDER BY Clause</font>
	ORDER BY 子句能够按一列或多列对表的输出进行排序。也就是说，可以按字母升序或降序排列字符值，也可以按升序或降序排列数字值。默认顺序是升序。
- 🔵<font color=#4857CB>GROUP BY Clause</font>
	GROUP BY 子句能够将查询结果分解为行的子集。使用 GROUP BY 子句时，可以在 SELECT 子句或 HAVING 子句中使用聚合函数（aggregate functions）来指示 PROC SQL 如何对数据进行分组。PROC SQL 分别计算每个组的聚合函数。当不使用聚合函数时，PROC SQL 会将 GROUP BY 子句视为 ORDER BY 子句，并且任何聚合函数都将应用于整个表。
- 🔵<font color=#4857CB>HAVING Clause</font>
	HAVING 子句与 GROUP BY 子句配合使用，可根据给定条件限制查询结果中的组。PROC SQL 在对数据进行分组并应用聚合函数后应用 HAVING 条件。
	```SAS
	Select Continent, sum(Population)
	  from sql.countries
	  group by Continent
	  having Continent in ('Asia', 'Europe')
	  order by Continent;
	```

构建SELECT语句时，必须按照以下顺序指定子句：
1. SELECT
2. FROM
3. WHERE
4. GROUP BY
5. HAVING
6. ORDER BY  

### 1.2 Selecting Columns in a Table  
##### 1.2.1 Selecting All Columns in a Table  
在 SELECT 子句中使用星号可选择表中的所有列。  
```SAS
proc sql outobs=12;
  title '';
  select *
    from sql.uscitycoords;
```
注意：OUTOBS= 选项限制输出中的行数（观测值）。  

##### 1.2.2 Selecting Specific Columns in a Table  
要选择表中的特定列，请在 SELECT 子句中列出该列的名称。  
```SAS
proc sql outobs=12;
  title '';
  select city, state
    from sql.uscitycoords;
```

##### 1.2.3 Eliminating Duplicate Rows from the Query Results  
可以通过在 SELECT 子句中使用 DISTINCT 关键字从结果中消除重复行。  
```SAS
proc sql;
  title '';
  select distinct continent
    from sql.unitedstates;
```

##### 1.2.4 Determining the Structure of a Table  
要获取表中所有列及其属性的列表，可以使用 DESCRIBE TABLE 语句。  
```SAS
proc sql;
  describe table sql.unitedstates;
```
  
>NOTE: SQL table SQL.UNITEDSTATES was created like:
create table SQL.UNITEDSTATES( bufsize=12288 )
(
Name char(35) format=$35. informat=$35. label='Name',
Capital char(35) format=$35. informat=$35. label='Capital',
Population num format=BEST8. informat=BEST8. label='Population',
Area num format=BEST8. informat=BEST8.,
Continent char(35) format=$35. informat=$35. label='Continent',
Statehood num
);  

### 1.3 Creating New Columns  
除了选择存储在表中的列之外，还可以创建在查询期间存在的新列，这些列可以包含文本或计算。 PROC SQL 写入创建的列，就像它们是表中的列一样。  

##### 1.3.1 Adding Text to Output  
```SAS
proc sql outobs=12;
  title '';
  select 'prstal code for', name, 'is', code
    from sql.postalcodes;
```

要防止打印列标题“Name”和“Code”，可以为每列分配一个以特殊字符开头的标签。 PROC SQL 在分配标签时不写入列名，也不写入以特殊字符开头的标签。例如，可以使用以下查询来隐藏 PROC SQL 在上一个示例中显示的列标题：
```SAS
proc sql outobs=12;
  title '';
  select 'Postal code for', name label='#', 'is', code label='#'
    from sql.postalcodes;
```

##### 1.3.2 Calculating Values  
可以使用从数字列检索的值执行计算。  
```SAS
proc sql outobs=12;
  title '';
  select city, (avglow-32) * 5/9 format=4.1
    from sql.worldtemps;
```

##### 1.3.3 Assigning a Column Alias  
通过指定列别名，可以为 PROC SQL 查询中的任何列分配新名称。新名称必须遵循 SAS 名称规则。 该名称仅针对该查询保留。 当您使用别名来命名列时，您可以在稍后的查询中使用别名来引用该列。
```SAS
proc sql outobs=12;
  title '';
  select city, (avglow-32) * 5/9 as lowcelsius format=4.1
    from sql.worldtemps;
```

##### 1.3.4 Referring to a Calculated Column by Alias  
当使用列别名来引用计算值时，必须将 CALCULATED 关键字与别名一起使用，以通知 PROC SQL 该值是在查询中计算的。  
```SAS
proc sql outobs=12;
  title '';
  select city, (avghigh-32) * 5/9 as highc format=5.1,
               (avglow-32)  * 5/9 as lowc  format=5.1,
               (calculated highc - calculated lowc) as range format=4.1
  from sql.worldtemps;
```

##### 1.3.5 Assigning Values Conditionally  
CASE 表达式能够解释和更改列中的部分或全部数据值，以使数据更有用或更有意义。可以通过使用 CASE 表达式有条件地赋值来在查询中使用条件逻辑。可以在任何可以使用列名的地方使用 CASE 表达式。  
```SAS
proc sql outobs=12;
  title '';
  select city, country, latitude,
    case
      when latitude gt 67 then 'North Frigid'
      when 67 ge latitude ge 23 then 'North Temperate'
      when -23 ge latitude gt -23 then 'Torrid'
      when -23 ge latitude ge -67 then 'South Temperate'
      else 'South Frigid'
    end as climatezone
  from sql.worldcitycoords
  order by city;
```

##### 1.3.6 Using the CASE-OPERAND Form  
可以使用 CASE-OPERAND 形式构造 CASE 表达式，如下例所示。  
```SAS
proc sql outobs=12;
  title '';
  select name, continent,
    case continent
      when 'North America' then 'Continental U.S'
      when 'Oceania'       then 'Pacific Islands'
      else 'None'
    end as Region
  from sql.unitedstates;
```

##### 1.3.7 Replacing Missing Values  
COALESCE 函数能够将列中缺失的值替换指定的新值。对于查询处理的每一行，COALESCE 函数都会检查其每个参数，直到找到非缺失值，然后返回该值。如果所有参数都是缺失值，COALESCE 函数将返回缺失值。  
```SAS
proc sql;
  title '';
  select name, coalesce(lowpoint, 'not available') as lowpoint
    from sql.continents;
```

##### 1.3.8 Specifying Column Attributes  
可以指定以下列属性，这些属性决定 SAS 数据的显示方式：  
- FORMAT=
- INFORMAT=
- LABEL=
- LENGTH=
```SAS
proc sql outobs=12;
  title '';
  select name label='State', area format=comma10.
    from sql.unitedstates;
```

### 1.4 Sorting Data  
可以通过指定表中的任何列（包括未选择的列或计算的列），使用 ORDER BY 子句对查询结果进行排序。 除非 SELECT 语句中包含 ORDER BY 子句，否则即使存在索引，也无法保证输出行的特定顺序（例如查询表中遇到行的顺序）。 如果没有 ORDER BY 子句，输出行的顺序由 PROC SQL 的内部处理、SAS 的默认排序顺序以及操作环境决定。  

计算的统计数据可能略有不同，具体取决于处理观测值的顺序。 这种变化是由于浮点运算引入的数值误差造成的，其结果应被认为是近似的而不是精确的。观察处理的顺序可能会受到多线程或并行处理的非确定性影响的影响。处理顺序还可能受到数据源（例如通过 ACCESS 引擎传递查询结果的 DBMS）生成的观察结果的不一致或不确定顺序的影响。  

##### 1.4.1 Sorting by Column  
```SAS
proc sql outobs=12;
  title '';
  select name, population format=comma10.
    from sql.countries
    order by population;
```

##### 1.4.2 Sorting by Multiple Columns  
可以通过在 ORDER BY 子句中指定以逗号分隔的列名称来按多个列进行排序。  
```SAS
proc sql outobs=12;
  title '';
  select name, continent
    from sql.countries
    order by continent, name;
```

##### 1.4.3 Specifying a Sort Order  
要对结果进行排序，请指定 ASC 进行升序或 DESC 进行降序。可以在 ORDER BY 子句中为每列指定排序顺序。当在 ORDER BY 子句中指定多列时，第一列决定结果的主要行顺序。后续列确定具有相同主要排序值的行的顺序。  
```SAS
proc sql outobs=12;
  title '';
  select name, type
    from sql.features
    order by type desc, name;
```

##### 1.4.4 Sorting by Calculated Column  
可以通过在 ORDER BY 子句中指定计算列的别名来按计算列排序。  
```SAS
proc sql outobs=12;
    title '';
    select name, population format=comma12., area format=comma8.,
         population/area as density format=comma10.
    from sql.countries
    order by density desc;
```

##### 1.4.5 Sorting bu Column Position  
可以通过指定其数字位置来对 SELECT 子句中的任何列进行排序。通过指定位置而不是名称，可以按没有别名的计算列进行排序。  
```SAS
proc sql outobs=12;
    title '';
    select name, population format=comma12., area format=comma8.,
        population/area format=comma10. label='density'
    from sql.countries
    order by 4 desc;
```

##### 1.4.6 Sorting by Columns That Are Not Selected  
可以按查询中未包含的列对查询结果进行排序。   
```SAS
proc sql outobs=12;
    title '';
    select name, continent
        from sql.countries
        order by population;
```

##### 1.4.7 Specifying a Different Sorting Sequance  
SORTSEQ=是一个 PROC SQL 语句选项，指定当查询包含 ORDER BY 子句时 PROC SQL 要使用的排序顺序。仅当需要使用操作环境的默认排序顺序以外的排序顺序时，才使用此选项。可能的值包括 ASCII、EBCDIC 和英语以外的一些语言。   
```SAS
proc sql sortseq=ebcdic;
```

SORTSEQ= 仅影响 ORDER BY 子句。它不会覆盖操作环境中 WHERE 子句的默认比较操作。  

##### 1.4.8 Sorting Columns That Contain Missing Values  
PROC SQL 将空值或缺失值排序在字符或数字数据之前。因此，当指定升序排列时，缺失值首先出现在查询结果中。  
```SAS
proc sql;
    title '';
    select name, lowpoint
        from sql.conyinents
        order by lowpoint;
```

### 1.5 Retrieving Rows That Satisfy a Condition  
WHERE 子句能够从表中检索满足条件的行。WHERE 子句可以包含表中的任何列，包括未选择的列。  

##### 1.5.1 Using a Simple WHERE Clause  
```SAS
proc sql outobs=12;
    title '';
    select name, population format=comma10.
        from sql.countries
        where continent='Europe';
```

##### 1.5.2 Retrieving Rows Based on a Comparison  
可以在 WHERE 子句中使用比较运算符来选择不同的数据子集。下述列出了可以使用的比较运算符：
- = | EQ
	equal to  
	example: `where name='Asia';`  
- ^= | ~= | ¬= | <> | NE
	not equal to  
	example: `where name ne 'Africa';`  
- > | GT
	greater than  
	example: `where area>10000;`  
- < | LT
	less than  
	example: `where Depth<5000;`  
- >= | GE
	greater than or equal to  
	example: `where Statehood>='01jan1860'd;`   
- <= | LE
	less than or equal to  
	example: `where population<=5000000;`  

示例：  
```SAS
proc sql;
    title '';
    select name, population format=comma10.
        from sql.unitedstates
        where population gt 5000000
        order by population desc;
```

##### 1.5.3 Retrieving Rows That Satisfy Multiple Conditions  
可以使用逻辑运算符或布尔运算符来构造包含两个或多个表达式的 WHERE 子句。下述列出了可以使用的逻辑运算符：  
- & | AND
	specifies that both the previous and following conditions must be true  
	example: `continent='Asia' and population>5000000`  
- ! or | or ¦ or OR
	specifies that either the previous or the following condition must be true  
	example: `population<1000000 or population>5000000`  
- ^ or ~ or ¬ or NOT
	specifies that the following condition must be false  
	example: `continent not 'Africa'`  

示例：  
```SAS
proc sql;
    title '';
    select name, population format=comma10.
        from sql.countries
        where continent='Africa' and population gt 20000000
        order by population desc;
```

##### 1.5.4 Using Other Conditional Operators  
可以在 WHERE 子句中使用许多不同的条件运算符。下述列出了您可以使用的其他运算符：  
- ANY
	指定从子查询获得的一组值中至少有一个必须满足给定条件  
	example: `where population>any(select population from sql.countries)`  
- ALL
	指定从子查询获得的所有值必须满足给定条件  
	example: `where population>all(select population from sql.countries)`  
- BETWEEN-AND  
	tests for balues within an inclusive range  
	example: `where population between 1000000 and 5000000`  
- CONTAINS
	tests for values that contain a specified string  
	example: `where continent contains 'America'`  
- EXISTS
	tests for the existence of a set of values obtained from a subquery  
	example: `where exists (select * from sql.oilprod)`  
- IN
	tests for values that match one of a list of values  
	example: `where name in ('Africa', 'Asia')`  
- IS NULL | IS MISSING  
	tests for missing values  
	example: `where population is missing`  
- LIKE  
	tests for values that match a specified pattern  
	example: `where continent like 'A%'`  
- =*
	tests for values that sound like a specified value  
	example: `where name =* 'Tiland'`   

##### 1.5.5 Using Truncated String Comparison Operators  
Truncated string comparison operators用于比较两个字符串。与传统比较运算符的不同之处在于，在执行比较之前，PROC SQL 会将较长的字符串截断为与较短的字符串相同的长度。长度是在消除尾部空格（如果有）后计算的。截断是在内部执行的； 两个字符串不会永久更改。下述列出了截断比较运算符：  
- EQT
	equal to truncated strings  
	example: `where name eqt 'Aust'`  
- GTT
	greater than truncated strings  
	example: `where name gtt 'Bah'`  
- LTT
	less than truncated strings  
	example: `where name ltt 'An'`  
- GET
	greater than or equal to truncated strings  
	example: `where country get 'United A'`  
- LET
	less than or equal to truncated strings  
	example: `where lastname let 'Smith'`  
- NET
	not equal to truncated strings  
	example: `where style net 'TWO'`  

示例：  
```SAS
proc sql;
    title '';
    select name
        from sql.unitedstates
        where name eqt 'New ';
```

### 1.6 Summarizing Data  
可以使用*aggregate function*（或summary function）生成表中数据的统计汇总。aggregate function指示 PROC SQL 如何组合一列或多列中的数据。如果指定一列作为aggregate function的参数，则会计算该列中的值。如果指定多个参数，则会计算列出的参数或列。  

❓当 SQL  aggregate function中使用多个参数时，该函数将不再被视为 SQL  aggaregate或summary函数。如果存在类似名称的 Base SAS 函数，则 PROC SQL 会执行 Base SAS 函数，并且返回的结果基于当前行的值。如果不存在类似名称的 Base SAS 函数，则会发生错误。例如，如果对 AVG 函数使用多个参数，则会出现错误，因为 Base SAS 没有 AVG 函数。  

##### 1.6.1 Using Aggregate Functions  
可用的aggregate functions如下所示：  
- AVG, MEAN  
	mean or average of values  
- COUNT, FREQ, N  
	number of <font color=#0000ff>nonmissing values</font>  
- CSS  
	corrected sum of squares  
- CV  
	coefficient of variation (percent)  
- MAX  
	largest value  
- MIN  
	smallest value  
- NMISS  
	number of missing values  
- PRT  
	probability of a greater absolute value of Student's t   
- RANGE  
	range of values  
- STD  
	standard deviation  
- STDERR  
	standard error of the mean  
- SUM  
	sum of values  
- SUMWGT  
	sum of the WEIGHT variable values  
- T
	Student's t value for testing the hypothesis that the population mean is zero  
- USS  
	uncorrected sum of squares  
- VAR  
	variance  

##### 1.6.2 Summarizing Data with a WHERE Clause  
示例：  
```SAS
proc sql outobs=12;
    title '';
    select city, country, mean(avghigh, avglow)
            as meantemp
        from sql.worldtemps
        where calculated meantemp gt 75
	    order by meantemp desc;
```

##### 1.6.3 Remerging Summary Statistics  
只要存在以下任一条件，就会发生remerge：   
- SELECT 子句引用包含aggregate的列以及 GROUP BY 子句中未列出的其他列。  
- ORDER BY 子句引用了 SELECT 子句未引用的列。  

以下示例使用 MAX 函数查找 Sql.Countries 表中的最大人口并将其显示在名为 MaxPopulation 的列中。aggregate function（例如 MAX 函数）可能会导致对每一行重复相同的计算。每当 PROC SQL 重新合并数据时就会发生这种情况。  
```SAS
proc sql outobs=12;
    title '';
    select name, population format=comma20.,
        max(population) as maxpopulation format=comma20.
    from sql.countries
    order by population desc;
```

示例2：  （1）使用SUM函数获取世界总人口；（2）用每个国家的人口除世界总人口。  
```SAS
proc sql outobs=12;
    title '';
    select name, population format=comma14.,
            (population / sum(population) * 100) as percentage
            format=comma8.2
        from sql.countries
        order by percentage desc;
```

##### 1.6.4 Using Aggregate Functions with Unique Values  
###### 1.6.4.1 Counting Unique Values  
您可以将 DISTINCT 与aggregate functions一起使用，以使该函数仅使用列中的唯一值。  
```SAS
proc sql;
    title '';
    select count(distinct continent) as count
        from sql.countries;
```

###### 1.6.4.2 Counting All Rows  
```SAS
proc sql;
    title '';
    select count(*) as number
        from sql.countries;
```

##### 1.6.5 Summarizing Data with Missing Values  
错误示例：  
```SAS
proc sql;
    title '';
    select name, length, avg(length) as avglength
        from sql.features
        where name in ('Angel Falls', 'Amazon', 'Nile');
```

如上例，其中name=Amazon的length缺失，计算avg(length)时将会忽略此行，仅平均除2，实际得到的为‘Angel Falls’和‘Nile’的均值，而非‘Angel Falls’、‘Amazon’和‘Nile’的均值。  

更改示例：  
```SAS
proc sql;
    title '';
    select name, length, coalesce(length,0) as newlength,
            avg(calculated newlength) as avglength
        from sql.features
        where name in ('Angel Falls', 'Amazon', 'Nile');
```

### 1.7 Grouping Data  
GROUP BY 子句按指定的一个或多个列对数据进行分组。使用 GROUP BY 子句时，还可以在 SELECT 子句或 HAVING 子句中使用aggregate function来指示 PROC SQL 如何汇总每个组的数据。 PROC SQL 为每个组单独计算aggregate function。  

##### 1.7.1 Grouping by One Column  
示例：求每个地区的总人口  
```SAS
proc sql;
    title '';
    select continent, sum(population) format=comma14. as totalpopulation
        from sql.countries
        where continent is not missing
        group by continent;
```

##### 1.7.2 Grouping without Summarizing  
当使用不带aggregate function的 GROUP BY 子句时，PROC SQL 会将 GROUP BY 子句视为 ORDER BY 子句，并在日志中显示一条消息。  

##### 1.7.3 Grouping by Multiple Columns  
要按多个列进行分组，请在 GROUP BY 子句中用逗号分隔列名称。可以对选择的任何列使用aggregate function。  
```SAS
proc sql;
    title '';
    select location, type, sum(area) as totalarea format=comma16.
        from sql.features
        where type in ('Desert', 'Lake')
        group by location, type;
```

##### 1.7.4 Grouping and Sorting Data  
可以使用 ORDER BY 子句对分组结果进行排序。  
```SAS
proc sql;
    title '';
    select location, type, sum(area) as totalarea format=comma16.
        from sql.features
        where type in ('Desert', 'Lake')
        group by location, type
        order by location desc;
```

##### 1.7.5 Grouping with Missing Values  
当列包含缺失值时，PROC SQL 会将缺失值视为一个组别。这有时会带来意想不到的结果。  

### 1.8 Filtering Grouped Data  
可以将 HAVING 子句与 GROUP BY 子句结合使用来过滤分组数据。HAVING 子句影响组的方式与 WHERE 子句影响单个行的方式类似。使用 HAVING 子句时，PROC SQL 仅显示满足 HAVING 表达式的组。  

##### 1.8.1 Using a Simple HAVING Clause  
示例：  
```SAS
proc sql;
    title '';
    select type, count(*) as number
        from sql.features
        group by type
        having type in ('Island', 'Ocean', 'Sea')
        order by type;
```

##### 1.8.2 Choosing between HAVING and WHERE  
HAVING 子句和 WHERE 子句之间的差异如下表所示。由于在处理数据组时使用 HAVING 子句，因此包含 HAVING 子句的查询通常还包含以下内容：  
- a GROUP BY clause  
- an aggregate function 

- <font color=#0000ff>HAVING clause attributes</font>  
	- 通常用于指定在表中包含或排除groups of rows的条件。  
	- 如果与 GROUP BY 子句一起使用，则必须在查询中跟在 GROUP BY 子句后。
	- 受 GROUP BY 子句影响，当没有 GROUP BY 子句时，HAVING 子句被视为 WHERE 子句。
	- <font color=#ff0000>在 GROUP BY 子句和任何aggregate函数之后进行处理</font>。
- <font color=#0000ff>WHERE clause attributes</font>  
	- 用于指定从表中包含或排除各个行的条件。  
	- 如果与 GROUP BY 子句一起使用，则必须位于查询中的 GROUP BY 子句之前。  
	- 不受GROUP BY子句影响。  
	- <font color=#ff0000>在 GROUP BY 子句（如果有）之前以及任何aggregate函数之前进行处理</font>。  

##### 1.8.3 Using HAVING with Aggregate Functions  
示例：  
```SAS
proc sql;
    title '';
    select  continent,
            sum(population) as totalpopulation format=comma16.,
            count(*) as count
        from sql.countries
        group by continent
        having count(*) gt 15
        order by continent;
```

### 1.9 Validating a Query  
VALIDATE 语句能够检查查询语法的正确性，而无需将其提交到 PROC SQL。PROC SQL 在日志中显示一条消息以指示语法是否正确。  
```SAS
proc sql;
    validate
        select name, statehood
            from sql.unitedstates
            where statehood lt '01Jan1800'd;
```

