#CMD命令

cmd是command的缩写.即命令行 。

##1. 常用CMD命令

###1.1 CD命令

<font color = #ff0000>什么是CD命令？</font>

````CMD
//进入d盘
D:
//进入F盘
F:

cd /?     //获取使用帮助

cd \       //跳转到硬盘的根目录

cd C:\WINDOWS  //跳转到当前硬盘的其他文件

d:        //跳转到其他硬盘

cd /d e:\software    //跳转到其他硬盘的其他文件夹，注意此处必须加/d参数。否则无法跳转。

cd..      //跳转到上一层目录
````



###1.2 查看当前目录下文件

````CMD
//查看当前目录下的文件，类似于linux下的ls
dir
````

如果是需要查看隐藏文件的或者更多操作的话，可以使用dir /?来查看其它用法。



###1.3 创建目录和删除目录

````CMD
//创建目录
md 目录名（文件夹）
//删除目录
rd 目录名（文件夹）
````

###1.4 查看本机IP

````
ipconfig
````

###1.5 清除屏幕

```text
cls
```

###1.6 复制文件

```text
copy 路径\文件名 路径\文件名 ：把一个文件拷贝到另一个地方。
```

###1.7 移动文件

```text
move 路径\文件名 路径\文件名 ：把一个文件移动（就是剪切+复制）到另一个地方。
```

###1.8 删除文件

```text
//这个是专门删除文件的，不能删除文件夹
del 文件名
```

###1.9 ping

```text
//用来测试网络是否畅通
ping ip(主机名)
```

###1.10 taskkill

列出所有任务及进程号，杀进程

```CMD
taskkill

taskkill /?  获取使用帮助
```

taskkill是用来终止进程的。具体的命令规则如下：

```text
TASKKILL [/S system [/U username [/P [password]]]]
{ [/FI filter] [/PID processid | /IM imagename] } [/F] [/T]
```

**描述:**

这个命令行工具可用来结束至少一个进程。

可以根据进程 id 或映像名（Image）来结束进程。

**参数列表:**

```text
/S system 指定要连接到的远程系统。
/U [domain\]user 指定应该在哪个用户上下文
```

**执行这个命令:**

```text
/P [password] 为提供的用户上下文指定密码。如果忽略，提示输入。
/F 指定要强行终止的进程。
/FI filter 指定筛选进或筛选出查询的的任务。
/PID process id 指定要终止的进程的PID。
/IM image name 指定要终止的进程的映像名称。通配符 '*'可用来指定所有映像名。
/T Tree kill: 终止指定的进程和任何由此启动的子进程。
/? 显示帮助/用法。
```

**例如:**

```text
TASKKILL /S system /F /IM notepad.exe /T
TASKKILL /PID 1230 /PID 1241 /PID 1253 /T
TASKKILL /F /IM QQ.exe
TASKKILL /F /IM notepad.exe /IM mspaint.exe
TASKKILL /F /FI "PID ge 1000" /FI "WINDOWTITLE ne untitle*"
TASKKILL /F /FI "USERNAME eq NT AUTHORITY\SYSTEM" /IM notepad.exe 
```