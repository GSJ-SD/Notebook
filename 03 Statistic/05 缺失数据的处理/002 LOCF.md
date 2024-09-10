
**参考资料：**
<font color=blue>[1]陈丽嫦,衡明莉,王骏等.定量纵向数据缺失值处理方法的模拟比较研究[J].中国卫生统计,2020,37(03):384-388.</font>  
https://www.lexjansen.com/nesug/nesug09/po/PO12.pdf  

******

末次访视结转（Last Observation Carried Forward，LOCF）属于单一填补法，可在纵向数据（按时间点对每个受试者进行重复测量）中使用；是使用脱落前观察到的最后一次非缺失值进行填补。  

一个简单的示例：某临床试验共有 `week 2` 、`week 4` 、`week 6` 、`week 8` 、`week 10` 、`week 12` 6次访视，其中 `week 6` 、`week 10` 和 `week 12` 的访视缺失，数据如下：  

| VISIT | VALUE |
| ---- | ---- |
| week 2 | 1.5 |
| week 4 | 2.3 |
| week 6 | . |
| week 8 | 3.2 |
| week 10 | . |
| week 12 | . |
对数据进行 LOCF 填补后，数据集将显示为：  

| VISIT | VALUE |
| ---- | ---- |
| week 2 | 1.5 |
| week 4 | 2.3 |
| week 6 | ==2.3== |
| week 8 | 3.2 |
| week 10 | ==3.2== |
| week 12 | ==3.2== |
