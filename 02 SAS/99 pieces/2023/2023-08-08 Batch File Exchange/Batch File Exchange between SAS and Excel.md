参考资料：[Batch File Exchange between SAS and Excel - the Magic of Call Execute](https://support.sas.com/resources/papers/proceedings19/3114-2019.pdf)  

我们经常需要在 SAS 和 MS Excel 之间传输数据。默认情况下，SAS libname engine或 PROC IMPORT/EXPORT 只能在 SAS 和 Excel 之间传输单个文件。在多个文件的情况下，一个一个地传输文件会显得过于繁琐。  

SAS CALL EXECUTE 具有两个功能：  
- 混合 SAS 数据步和 proc 过程；  
- 将 SAS 数据步值传递给 SAS 过程或宏参数。   
这两个功能使其成为动态数据处理和重复任务（例如 SAS 和 Excel 之间的批处理文件交换）的选择。  

### 1 SAS批量读入多个Excel文件
#### 1.1 批量读入多个Excel Sheets
示例程序如下：  
```SAS
/*将需读入文件定义为逻辑库*/
libname myexcel xlsx 'YourPath\YourFile.xlsx';

/*批处理*/
data _null_;
  set sashelp.vmember(where=(libname='MYEXCEL'));/*读取定义的逻辑库中sheet属性*/
  call execute
    ('data work.'||
     dequote(memname)||
    '; set myexcel.'||
    quote(dequote(memname))||
    'n; run;');
run;
```

#### 1.2 批量读入多个Excel文件  
```SAS
filename dirlist pipe 'dir "YourPath\" /b';

data files;
  length fname $20;
  Infile dirlist truncover length= reclen;
  input fname $varying20. reclen;
  fname=scan(fname,1,'.');
run;

data _null_;
  set files;
  call execute('proc import datafile="YourPath\'||strip(fname)||'.xlsx"
                out=work.'||strip(fname)||'
                dbms=xlsx replace;
                run;');
run
```

### 2 SAS批量导出多个Excel文件  
#### 2.1 批量导出多个数据集至一个Excel文件  
```SAS
%let mypath=YourPath;

data _null_;
  set sashelp.vmember(where=(libname='WORK' and memtype="DATA"));
  call execute('proc export data='||memname||'
                outfile="&mypath\combined.xlsx"/*导出至combined文件*/
                dbms=xlsx replace;
                sheet='||memname||';
                run;');
run;
```

#### 2.2 批量导出为多个Excel文件  
```SAS
%let mypath=YourPath;

data _null_;
  length dsn $30;
  do dsn='class','company','cars';/*选择需导出的数据集*/
  call execute('proc export data=sashelp.'||dsn||'
                outfile="&mypath\'||strip(dsn)||'.xlsx"
                dbms=xlsx replace;
                run;');
  end;
run;
```