
## 1 语法简介  

**PROC SURVEYSELECT options;**  

### 1.1 输出数据集和输入数据集命名  

PROC SURVEYSELECT语句调用 SURVEYSELECT 过程。它定义了输入和输出数据集，如果未命名输入数据集（DATA=），则将从最近创建的SAS数据集中选择样本；如果未命名输出数据集（OUT=），则会根据DATAn约定对输出数据集进行命名。  
### 1.2 抽样方法  

如果未指定抽样方法（selection method），PROC SURVEYSELECT默认情况下使用简单随机采样（method=SRS），除非在SAMPLINGUNIT语句中指定SIZE语句或PPS选项。

如果指定SIZE语句（或PPS选项），默认情况下，PROC SURVEYSELECT使用与大小选择成比例的概率而不替换（METHOD=PPS）。有关更多信息，请参阅METHOD=选项的说明。  
### 1.3 samplesize  

可以使用SAMPSIZE=n选项指定样本大小，也可以使用SAMPSI ZE=*SAS-data-set*选项命名包含地层样本大小（stratum sample sizes）的辅助输入数据集（secondary input data set）。您必须指定样本大小或采样率，除非您请求以下操作之一：随机分配（GROUPS=）；平衡bootstrap选择（METHOD=BALBOOTSTRAP）；泊松采样（METHOD=Poisson）；Brewer方法或Murthy方法，其中任一种方法从每个地层中选择两个单元（method=PPS_Brewer或method=PPS_Murthy）；或指定裕度的样本分配（margin=）。



## 2 简单示例  
### 2.1 Bootstrap抽样  

一个简单的 bootstrap 抽样示例如下：从一个有5个样本的数据集中有放回的抽样，一共需要抽取出5个样本，每个样本的样本量为5，程序示例为：  
```SAS
data a;
    set adeff;
    where subjid in ("01001","01002","01003","01004","01005");
run;

proc surveyselect data=a NOPRINT seed=1
     out=test(rename=(Replicate=SampleID))
     method=balboot              /* resample with balance bootstrap */
/*     samprate=0.2  */            /* each bootstrap sample has N observations */
     /* OUTHITS                 option to suppress the frequency var */
     reps=5;       /* generate NumSamples bootstrap resamples */
run;
```  

