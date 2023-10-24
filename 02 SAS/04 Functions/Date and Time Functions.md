### INTNX  
- 返回经过指定数量的间隔后的日期。  
- 语法：`INTNX('interval', start-date, increment<, 'alignment'>)`  
	- _interval_：时间间隔，用引号括起来  
	- _start-date_：SAS日期  
	- _increment_：函数返回的日期与 *start-date* 之间的 *interval* 的数目。  
	- _alignment_：*alignment* 是一个可选参数，其值为 BEGINNING（B）、MIDDLE（M）、END（E）或 SAMEDAY（S）。默认值为 BEGINNING。例如，如果间隔为 WEEK，则从1960年1月1日起递增1（WEEK），默认情况下返回日期1960年1月份3日（星期日，一周的开始）；当 *alignment* 设置为 MIDDLE 时，则返回日期1960年1月6日（星期三，一周的中间）。  

##### INTCK  
- 返回两个日期、两个时间或两个日期时间值之间的间隔数。更准确地说，INTCK函数计算从第一个值到第二个值的边界经过的时间间隔的次数。  
- 语法1：`INTCK('interval<Multiple><.shift-index>', start-value, end-value<, 'method'>)`  
- 语法2：`INTCK(custom-interval, start-date, end-date<, 'method'>)`  
	- _interval_：时间间隔，用引号括起来。  
	- _nultiple_：指定一个可选的乘数，用于将间隔设置为基本间隔类型的周期的倍数。例如，时间间隔 YEAR2 由 two-year 或 biennial 组成。  
	- _custom-interval_：指定由SAS数据集定义的用户定义的间隔（user-defined interval）。每个观察包含两个变量，*begin* 和 *end*。  
	- _shift-index_：*shift-index* 是一个可选参数，用于确定区间的起点。例如，YEAR.4指定从4月1日开始的年度间隔（yearly intervals）。  
		- 对于除WEEK以外的所有多单位间隔，SAS创建一个从1960年1月1日开始的间隔。多个间隔都与非多个间隔按相同的单位偏移。因此，YEAR4.24指定四年间隔，间隔边界位于第二年年初（1962年1月1日、1966年1月一日等）。MONTH4.2表示四个月间隔，边界为第二个月的第一天。  
	- _'method'_：指定使用离散或连续方法对间隔进行计数。必须使用引号括起来。可选取值如下：  
		- **CONTINUOUS**：指定被的测量连续时间（continuous time is measured）。间隔会根据开始日期进行调整。    
		- **DISCRETE**：指定测量离散时间。离散方法计算区间边界（例如，月末）。示例：2000年1月31日至2000年2月1日之间的月份距离为一个月。  

##### *Intervals* 的取值
🔵Date units  

| Interval  | Description                                                   |
| --------- | ------------------------------------------------------------- |
| DAY       | Day                                                           |
| WEEK      | Week                                                          |
| WEEKDAY   | Each weekday(Monday to Friday, or any set of days you choose) |
| TENDAY    | Ten-day period                                                |
| SEMIMONTH | Two-week period                                               |
| MONTH     | Month                                                         |
| QTR       | Quarter(Jan-Mar=1, Apr-Jun=2, etc)                            |
| SEMIYEAR  | Half year                                                     |
| YEAR      | Year                                                          |


🔵Time units  

| Interval | Description |
| -------- | ----------- |
| SECOND   | Seconds     |
| MINUTE   | Minutes     |
| HOUR     | Hours       |

🔵Datetime units  

| Interval    | Description                        |
| ----------- | ---------------------------------- |
| DTDAY       | Day                                |
| DTWEEK      | Week                               |
| DTWEEKDAY   | Each weekday(Monday to Friday)     |
| DTTENDAY    | Ten-day period                     |
| DTSEMIMONTH | Two-week period                    |
| DTMONTH     | Month                              |
| DTQTR       | Quarter(Jan-Mar=1, Apr-Jun=2, etc) |
| DTSEMIYEAR  | Half year                          |
| DTYEAR      | Year                               |

##### *shift*的取值  

| Interval  | Shift Value |
| --------- | ----------- |
| YEAR      | Month       |
| SEMIYEAR  | Month       |
| QTR       | Month       |
| MONTH     | Month       |
| SEMIMONTH | Semimonth*  |
| TENDAY    | Tenday      |
| WEEKDAY   | Day         |
| WEEK      | Day         |
| DAY       | Day         |
| HOUR      | Hour*       |
| MINUTE    | Minute*     |
| SECOND    | Second*     | 

\*Only multi-intervals of these intervals can be shifted.  

##### Examples  

| Interval   | Interpretation                                          |
| ---------- | ------------------------------------------------------- |
| YEAR       | Each year                                               |
| YEAR2      | Every two years                                         |
| YEAR.4     | Each April                                              |
| YEAR4.11   | November, every four years                              |
| MONTH      | Every month                                             |
| MONTH4     | Every four months                                       |
| MONTH6.3   | Every six months with boundaries at March and Septemper |
| WEEK       | Each week                                               |
| WEEK2      | Every two weeks                                         |
| WEEK.4     | Every week starting with Wednesday                      |
| WEEK2.4    | Every two weeks starting with Wednesday                 |
| WEEKDAY    | Five-day weeks with weekend days, Saturday and Sunday   |
| WEEKDAY1W  | Six-day weeks with weekend day, Sunday                  |
| WEEKDAY12W | Five-day weeks with weekend days, Saturday and Sunday   |
| HOUR       | Every hour                                              |
| HOUR4      | Every four hours                                        |
| HOUR8.7    | Every eight hours with boundaries 6 AM, 2PM, and 10 PM  |
| DTMONTH    | Every month (used with datetime values)                 |


