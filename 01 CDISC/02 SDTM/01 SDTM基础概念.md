SDTM，全称Study Data Tabulation Model，围绕着*observations*的概念构建，*observations*由研究期间收集的一些离散信息组成，通常对应于数据集中的*rows*。  

## 1 Domains  
---
一个*domain*是关于一个特定*topic*的观测的集合。  

SDTM的首要目的是展示关于研究受试者的数据（可能是*humans*，或*animals*，或*medical devices*）。SDTM包括一个*general model*，用于表示3个*general observation*类别中的数据，在这些类别中，数据按照*topic*分组划分到*domains*中，在不同的数据集中展示。这3个*general observation classes*包括：
- Intervations  
- Events
- Findings

关于个体（*individuals*）的*special-purpose*数据集为：*Special-purpose Domains*。  

研究中有时会包括不是研究受试者的*associated persons*的数据，这些数据在基于展示关于研究受试者数据的域的域中展示，可见于：*Associated Persons Data*。  

SDTM也包括一些用于展示研究水平的数据表，可见于：*Study-level Data*。  

最后，SDTM中还有一组描述数据集和记录（*records*）之间的*relationships*的数据集，可见于：*Datasets for Representing Relationships*。  

![RelationshipsBetweenSDTMDomains](RelationshipsBetweenSDTMDomains.png)  


## 2 Roles  
---
SDTM变量可以被划分为5个主要的*roles*：
- *Identifier variables*：例如标志研究、受试者、域、记录顺序的变量；
- *Topic variables*：指定观测的中心点，例如实验室检查的名称；
- *Timing variables*：描述观测的时间，例如开始时间、结束时间；
- *Qualifier variables*：包括描述观察结果或附加特征的附加说明性文本或数值（例如，单位、描述性形容词）；
- *Rule variables*：描述*Trial Design model*中开始、结束、分支或循环的条件。

对于*Qualifier variables*，可再进一步分为5个子类：
- *Grouping Qualifiers*：用于将同一个*domain*中的观测集合组合在一起，如类别（categories）或子类（subcategories）；
- *Result Qualifiers*：描述*Fingdings*数据集中与*topic*变量有关的，并回答*topic*变量剔提出的问题的特定结果；
- *Synonym Qualifiers*：指定观测中一个特定变量的替代名称（*alternative name*），例如逐字记录的主题变量或与测试代码相关联的名称的编码版本（机翻，看原文：coded version of a verbatim topic variable or the name associated with a test code）；
- *Record Qualifiers*：将观测的附加属性（additional attributes）定义为一个整体，而不是在记录内描述特定的变量（怎么理解啊？）；
- *Variable Qualifiers*：用于进一步修改或描述观察中一组特定变量中的一个或多个，并且仅在其限定的变量的上下文中才有意义（例如，数值型检查结果或药物剂量的单位，解剖位置的偏侧性）。  

个人数据和研究数据的所有数据集都包括变量DOMAIN，DOMAIN是数据集名称中应使用的代码。一些*relationship datasets*中包括变量RDOMAIN，用于描述与个人数据域的关系。Comments *special-purpose domain* 包含变量RDOMAIN，但其他*special-purpose domains*不包含。*Device-subject Relationships dataset* 数据集包括变量DOMAIN，但其他*srudy reference datasets*不包括。  

SDTM的数据结构可以在SAS V5 transport文件中展示，这是FDA和其他监管机构接受的格式，这也对数据格式做出了限制。注意在SDTM中，*type*只能是*character*或*numeric*，这是SAS V5唯二支持的*type*。Define-XML中提供了更多描述性的数据类型（例如：*integer*，*float*，*date*，*datetime*）。  


## 3 The General Observation Classes  
---
### 3.1 The Interventions Observation Class  

代表受试者接受或使用的研究（investigational）、治疗（therapeutic）和其他治疗（other treatements）（具有一些实际或预期的生理效果）。这包括研究方案规定的治疗（即“暴露”）。  

### 3.2 The Events Observation Class  

表示计划的方案里程碑，如随机化和研究完成，以及独立于研究期间（如不良事件）或研究之前（如病史）发生的计划研究评估的事件、条件或事件。  

### 3.3 The Findings Observation Class  

表示针对特定测试或问题（如实验室测试、心电图（ECG）测试和问卷上列出的问题）的计划评估产生的观察结果。Findings类还包括一个子类型Findings About，用于记录与*Interventions*或*Events*中的观察结果相关的结果。  


## 4 Special-purpose Domains  
---

### 4.1 Demographics  

每项研究必须在特定结构中包括一组标准化的观察结果；这是此处描述的人口学领域。人口学是受试者所有其他观察的父领域，应使用“DM”的领域代码进行识别。DM域描述了研究受试者的基本特征，并被审查者用于选择受试者子集进行分析。与其他数据集一样，DM域包括标识符、主题变量、时间变量和限定符。 

### 4.2 Comments  

在进行许多研究的过程中收集了*comments*。这些通常由主要研究者提供，但也可能从其他来源收集。收集*comments*时，应在此处定义的单个*Comments Domain*中提交。

### 4.3 Subject Summary Domains  

##### 4.3.1 Subject Elements  
描述了主题遍历的元素的实际顺序，以及每个元素的开始日期或开始日期和时间以及结束日期/时间。*Trial Design Model*中描述了*Planned elements*。由于实际数据并不总是遵循计划，SDTM允许对受试者的计划外因素进行描述（SEUPDES）。
Domain：SE

##### 4.3.2 Subject Repro Stages  
受试者再编程阶段（不用于人类临床试验）描述了受试者经历的再编程阶段的实际顺序，以及每个阶段的开始日期或开始日期和时间以及结束日期/时间。由于实际数据并不总是遵循计划，SDTM允许描述受试者的计划外再治疗阶段（SJUPDES）。
Domain：SJ

##### 4.3.3 Subject Visits  
受试者访视描述了每个受试者每次访视的实际开始和结束日期/时间。由于实际数据并不总是遵循计划，SDTM允许对受试者的计划外访视进行描述（SVUPDES）。  
Domain：SV

##### 4.3.4 Subject Disease Milestones  
受试者疾病里程碑旨在记录每个受试者确定的试验疾病里程碑的时间。  
Domain：SM


## 5 Associated Persons Data  
---

*Associated Persons*是指除研究对象之外的个人，他们可以与研究（*study*）、特定研究对象（*particular study subject*）或研究中使用的设备（*device used in the study*）相关联。表示关联人员数据的SDTM数据集的结构基于研究对象数据的结构：*general observation class structures*或*special-purpose domain structures*。AP域使用SDTM变量创建，并应用特定的AP规则，包括：

- 创建AP域的实施者将遵循Identifier variables的AP假设。
- AP将是域和数据集名称的前缀，并将数据集标识为AP数据。
- 所有AP数据集中都需要*associated persons identifier*（APID），并将记录标识为AP数据。

除非SDTMIG-AP中描述了例外情况，否则关于SDTM和SDTMIG变量和域的所有其他一般假设都适用于AP数据。


## 6 Study-level Data  
---
### 6.1 The Trial Design Model  

The Trial Design Model 定义了用于展示试验中行动和治疗计划的计划顺序的标准结构，包括：

- 计划治疗组别（planned treatment arms）
- 计划受试者分组（planned groups of subjects）
- 生殖阶段的计划顺序（planned sequences of reproductive stages，动物发育和生殖毒理学研究\[animal developmental and reproductive toxicology studies\]）
- 行动和数据收集得计划时间安排（planned schedules for activities and data collection）
- 试验入排标准（study eligibility criteria）
- 研究的其他方面，用一系列参数表示（other aspects of a study, expressed as a series of parameters）
- characteristics of a study challenge agent（？）

##### 6.1.1 Trial Arms and Trial Elements  

Trial Arms 数据集将arms描述为trial elements的顺序，trial elements 在Trial Elements数据集中描述。  

- Trial Elements  
	- Trial Elements 描述了受试者在试验过程中经过的时间段（periods of times）。域代码为“TE”。
	- Trial Elements - One record per Trial Element
	- Domain：TE

- Trial Arms  
	- Trial Arms 描述试验中每个计划计划组别
	- 一个*arm*是一个*elements*的有序序列（ordered sequence），在给定的*arm*中相同的*element*可能多次出现。
	- 为了适应复杂的试验设计，该数据集允许在有选择时从一个*element*分支到另一个*element*的规则，以及允许受试者跳到另一*element*而不是线性进行的过渡规则。
	- 需注意：尽管同一*element*可能在一个*arm*中多次出现，但其每次出现时都将在TAETORD和EPOCH中有不同的取值，也可能在TABRANCH和TATRANS中有不同的取值。
	- Trial Arms - One Record per Planned Element per Arm
	- Domain：TA

##### 6.1.2 Trial Sets  

- Trial Sets 允许提交有受试者计划分组（planned groups）的详细信息，这些信息是研究感兴趣的实验因素的组合（包括实验参数（experimental parameters）、固有特征（inherent characteristics）和申办方定义的属性（sponsor-defined atrributes））。
- “Set” 可以是*arm*的计划细分（planned subdivision），也可以包括1个或多个*arm*。这些数据集对于确定不同研究之间的数据比较是否可行至关重要。
- Trial Sets - One Record per Trial Set Parameter
- Domain：TX

##### 6.1.3 Trial Repro Stages and Trial Repro Paths  

注意：不用于人类临床试验（Not for use with human clinical trials）

Reproductive Stages：生育阶段；生长阶段  

- Trial Repro Stages
	- Trial Repro Stages使用stage描述，编码（code, short name）依据开始和结束的规则来描述研究中的unique的repro stages
	- Trial Repro Stages - One Record per Planned Repro Stage
	- Domain：TT

- Trial Repro Paths  
	- Trial Repro Paths 描述repro研究中的每个计划repro path，使用由每个repro path组成的有序的repro stages，和repro path中repro phase的规范以及应用于repro stage的repro phase的参考开始日期（reference start day of the repro phase applicable to the repro stage）
	- Trial Repro Paths - One Record per Planned Repro Stage per Repro Path
	- Domain：TP

##### 6.1.4 Trial Planned Data Collection  

- Trial Visits
	- Trial Visits描述研究中计划的访视顺序和数目。
	- Trial Visits描述试验中VISIT，VISITNUM，和VISITDY的允许取值或计划取值（随后用作收集的研究数据的timing variables），以及每个visit的开始和结束规则。
	- 在大多数盲法试验中，所有arms中所有受试者的访视时间都是相同的。在每个arm的visits不同的情况下，每个arm每次visit都会有单独的记录。
	- Trial Visits - One Record per Planned Trial Visit
	- Domain：TV

- Trial Disease Assessments  
	- 当无法使用试验访视表达疾病评估时，试验疾病评估（Trial Disease Assessments）提供有关计划方案指定的疾病评估时间表的信息。
	- 在肿瘤研究中，遵循disease-assessment schedule对减少评估时间偏倚（assessment time bias）的风险来说是必要的。TD域允许将计划的评估时间表与疗效评估的实际发生情况进行比较，以确定依从程度，从而可以评估基于SDTM的数据集的评估时间偏差。
	- TD在肿瘤学之外的效用有限（实际上在肿瘤学研究中的效用也有限）。它是专门根据实体瘤反应评估标准（RECIST）开发的，特别是针对无进展生存期（PFS）终点的研究，其中评估时间偏差分析是合适的。
	- Domain：TD

- Trial Disease Milestones  
	- Trial Disease Milestones用于描述在所研究的疾病过程中预期会发生的observations或activities，其时间是研究感兴趣的。
	- Trial Disease Milestones - One Record per Disease Milestone Type
	- Domain：TM

##### 6.1.5 Trial Inclusion/Exclusion Criteria

Trial Inclusion/Exclusion包含用于试验的每个纳入和排除标准的1条记录。如果入排标准在试验期间发生了变化，那么入排标准的每个版本都可能被展示。  

- Trial Inclusion/Exclusion - One Record per Trial Inclusion or Exclusion Criteria
- Domain：TI

##### 6.1.6 Trial Summary Information 

Trial Summary Information（试验概要信息）包含用于试验总结/摘要特征（summary characteristic）的一条记录。Trial Summary用于记录试验的基础信息，如试验阶段（trial phase），方案标题（protocol title），设计目标（design objectives）等。  

- Trial Summary - One Record per Trial Summary Parameter  
- Domain：TS

##### 6.1.7 Challenge Agent Characterization  

Challenge Agent Characterization（刺激剂特征）数据集允许申办方以结构化的格式提供试验中使用的刺激剂的信息。刺激剂特征数据集（AC）中的每个记录都包含一个参数（刺激剂的一个特征）和其取值。  

### 6.2 Study Reference  

有时需要创建将在受试者数据中使用的study-specific identifiers。目前为止，已经确定两种这样的情况：

- Identifiers for Device 用于器械的标识符
- Identifiers for non-host organisms 用于非宿主生物的标识符  

##### 6.2.1 Device Identifiers Dataset  

Device的标识（identity）是通过一系列参数建立的，然后为其分配一个标识符（identifier）。用于识别device的参数取决于device的类型和在device间进行区分的研究需要。

- Device Identifiers Dataset：DI

![cocept map1](RelationshipsBetweenDeviceIdentifierVariables.png)  

##### 6.2.2 Non-host Organism Identifiers Dataset  

non-host organism（非宿主生物）的身份是通过一系列分类群（*taxa*，用于对生物进行分类）来确定的，然后为其分配一个标识符。用于识别non-host organism的分类群取决于生物的类别和区分生物的研究需要。  

- Non-host Organism Identifiers Dataset：OI  

![Concept map2](RelationshipsBetweenNon-hostOrganismIdentifierVariables.png)  


## 7 Datasets for Representing Relationships  

在许多情况下，有必要或希望展现数据集或记录之间的关系。SDTM包括以下的关系数据集（relationship datasets）：

- Related Records Dataset，用于标识两种类型的relationships：
	- 受试者的独立记录（通常在不同的数据集中）之间的关系（例如，用于治疗某个不良事件的合并用药）
	- 两个或多个数据集之间的关系，其中1个或多个数据集的记录域另1个或几个数据集中的记录相关。  

- Supplemental Qualifiers Dataset 补充限定符数据集
	- 表示依赖关系，不能由general-observation类的数据集的一个或多个记录中的标准变量（standard variable）表示的数据可以关联回该记录。
	- Domain：SUPP--

- Pool Definition Dataset 
	- 表示一个受试者与一组受试者之间的关系。  

- Related Subjects Dataset  
	- 表示除pool中的成员之外的研究受试者之间的关系。

- Associated Persons Relationships Dataset  
	- 表示相关人员（associated person）和研究对象之间的关系。  

- Device-subject Relationships Dataset  
	- 表示device与研究受试者之间的关系。  
	- Domain：DR

- Related Specimens Dataset  
	- 表示采集的样本和从中提取的样本之间的关系。  
