

# PROC FEDSQL

参考资料：[Anything You Can Do I Can Do Better: PROC FEDSQL VS PROC SQL (sas.com)](https://support.sas.com/resources/papers/proceedings19/3734-2019.pdf)

## 1. 简介

### 1.1 PROC SQL

Structured Query Language （结构化查询语言，SQL）最早开发于20世纪70年代初，其目的是管理存储在Relational Database Management Systems（关系数据库管理系统，RDBMS）中的数据，1986年，SQL成为American National Standards Institute （美国国家标准协会，ANSI）的标准语言，该标准SQL语言经过多年的修订和更新。SQL作为PROC SQL引入SAS，该过程的局限性在于：

1. 每个查询只能建立一个数据库连接（can only make one database connection per query）；
2. 不符合ANSI SQL语法。（PROC SQL不具有处理大于特定大小的整数的精度）

基于此，SAS 9.4引入了一个新的过程PROC FEDSQL，它可以提供更快的性能、在一个查询中连接到多个数据库的能力、更高的安全性、更广泛的数据支持以及完全符合ANSI SQL：1999核心标准等。

### 1.2 PROC FEDSQL

Federated Query Language（FEDSQL）可以在一个查询请求下同时连接到多个数据库，但是，为了实现这种连接和查询，所有数据库都必须在同一标准下进行协调。因此，当SAS在SAS 9.4中引入PROC FEDSQL时，他们使PROC FEDSQL完全符合ANSI SQL 1999标准，并允许以同样符合ANSI 1999标准的所有其他数据源的本地语言处理查询。以前使用PROC SQL的用户仅限于使用字符、整数、小数和日期数据类型。有了PROC FEDSQL和合规性，<font color = #ff0000>用户现在可以访问更多的数据类型</font>，包括但不限于：

- Time(p)
- Timestamp(p)
- Double
- NChar
- Varchar

### 1.3 注意

PROC FEDSQL并不是为了取代PROC SQL而创建的，它是为了执行PROC SQL由于某种原因无法执行或执行不好的任务而创建的。因此，我们看到PROC FEDSQL不能做所有PROC SQL可以做得更好的事情。