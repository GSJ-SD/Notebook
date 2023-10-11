
## 1 Special Purpose  

### 1.1 CO  
- comments 注释
- structure: One record per comment per subject
- purpose: tabulation
- keys(eg): STUDYID, USUBJID, IDVAR, COREF, CODTC
- location: co.xpt  
- 定义明晰：[临床试验CRF中Form介绍23：Comments(CO)数据集相关 - 简书 (jianshu.com)](https://www.jianshu.com/p/cb023d38654a)  

### 1.2 DM  
- demographics 人口学资料  
- structure: One record per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID  
- location: dm.xpt  

### 1.3 SE  
- subject elements 受试者元素  
- structure: One record per actual element per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, ETCD, SESTDTC  
- location: se.xpt  
- 参考文献：[Untangling the Subject Elements Domain (lexjansen.com)](https://www.lexjansen.com/phuse-us/2020/ds/DS10.pdf)    

### 1.4 SM  
- subject disease milestones 受试者疾病事件  
- structure: One record per disease nilestone per subject  
- purpose: tabulation   
- keys(eg): STUDYID, USUBJID, MIDS  
- location: sm.xpt  
- 参考文献 
	- [PharmaSUG-2020-SS-045.pdf (lexjansen.com)](https://www.lexjansen.com/pharmasug/2020/SS/PharmaSUG-2020-SS-045.pdf)  
	- [lexjansen.com/pharmasug/2019/DS/PharmaSUG-2019-DS-311.pdf](https://www.lexjansen.com/pharmasug/2019/DS/PharmaSUG-2019-DS-311.pdf)  

### 1.5 SV  
- subject visits 受试者访视  
- structure: One record per actual or planned visit per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, SVTERM  
- location: sv.xpt  


## 2 Interventions  
### 2.1 AG  
- procedure agents 诊疗操作药剂  
- structure: One record per recorded intervention occurrence per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, AGTRT, AGSTDTC  
- location: ag.xpt  
- 定义明晰：[SDTMIG v3.3的变化之 Procedure Agents (AG) - 简书 (jianshu.com)](https://www.jianshu.com/p/434c3f32d3b4)  

### 2.2 CM  
- concomitant/prior medications 伴随/既往用药  
- structure: One record per recorded intervention occurrence or constant-dosing interval per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, CMTRT, CMSTDTC  
- location: cm.xpt  

### 2.3 EC  
- exposure as collected 暴露采集  
- structure: One record per protocol-specified study treatment, collected-dosing interval, per subject, per mood  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, ECTRT, ECSTDTC, ECMOOD  
- location: ec.xpt  
- 定义明晰  
	- [临床试验CRF中Form介绍12：Exposure as Collected (EC) - 简书 (jianshu.com)](https://www.jianshu.com/p/6dc5d60e9a5f)  
	- [关于SDTM编程的一些想法(11)--EC和EX - 简书 (jianshu.com)](https://www.jianshu.com/p/70aa219b6c27)  

### 2.4 EX  
- exposure 暴露  
- structure: One record per protocol-specified study treatment, constant-dosing interval, per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, EXTRT, EXSTDTC  
- location: ex.xpt  

### 2.5 ML  
- meal data 膳食数据  
- structure: One record per food product occurrence or constant intake interval per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, MLTRT, MLSTDTC  
- location: ml.xpt  
- 定义明晰：[SDTMIG v3.3的变化之 Meal Data (ML) - 简书 (jianshu.com)](https://www.jianshu.com/p/dce6e72d9628#Meal%20Data%20(ML)%20%E6%94%B6%E9%9B%86%E4%BB%80%E4%B9%88%E4%BF%A1%E6%81%AF)  

### 2.6 PR  
- procedures 诊疗操作  
- structure: One record per recorded procedure per occurrence per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, PRTRT, PRSTDTC  
- location: pr.xpt  
- 定义明晰：[临床试验CRF中Form介绍16：Procedures (PR) - 简书 (jianshu.com)](https://www.jianshu.com/p/e6c20f18c6f5)  

### 2.7 SU  
- substance use 嗜好品使用  
- structure: One record per substance type per reported occurrence per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, SUTRT, SUSTDTC  
- location: su.xpt  
- 定义明晰：[临床试验CRF中Form介绍21：Substance Use (SU) - 简书 (jianshu.com)](https://www.jianshu.com/p/ab6b9c6b8917)  


## 3 Events  
### 3.1 AE  
- adverse events 不良事件  
- structure: One record per adverse event per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, AEDECOD, AESTDTC  
- location: ae.xpt  

### 3.2 BE  
- biospecimen events 生物标本事件（？）
- structure: One record per instance per biospecimen event per biospecimen identifier per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, BEREFID, BETERM, BESDTC  
- location: be.xpt  
- 参考文献：[lexjansen.com/pharmasug/2020/DS/PharmaSUG-2020-DS-196.pdf](https://www.lexjansen.com/pharmasug/2020/DS/PharmaSUG-2020-DS-196.pdf)  

### 3.3 CE  
- clinical events 临床事件  
- structure: One record per event per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, CETERM, CESTDTC  
- location: ce.xpt  
- 定义明晰：[临床试验CRF中Form介绍07：Clinical Events (CE) - 简书 (jianshu.com)](https://www.jianshu.com/p/059551c2ab4e)  

### 3.4 DS  
- disposition 受试者处置  
- sturcture: One record per disposition status or protocol milestone per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, DSDECOD, DSSTDTC  
- location: ds.xpt  
- 定义明晰：[临床试验CRF中Form介绍06：Disposition (DS) - 简书 (jianshu.com)](https://www.jianshu.com/p/0d97ce708b63)  

### 3.5 DV  
- protocol deviations 方案偏离  
- structure: One record per protocol deviation per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, DVTERM, DVSTDTC  
- location: dv.xpt  
- 定义明晰：[临床试验CRF中Form介绍10：Protocol Deviations (DV) - 简书 (jianshu.com)](https://www.jianshu.com/p/95a5a7e88108)  

### 3.6 HO  
- healthcare encounters  就诊事件  
- structure: One record per healthcare encounter per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, HOTERM, HOSTDTC  
- location: ho.xpt  
- 定义明晰：[临床试验CRF中Form介绍13：Healthcare Encounters (HO) - 简书 (jianshu.com)](https://www.jianshu.com/p/8deb72823fc9)  

### 3.7 MH  
- medical history 病史  
- structure: One record per medical history event per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, MHDECOD  
- location: mh.xpt  


## 4 Findings  
### 4.1 BS  
- biospecimen findings 生物样本发现类
- structure: One record per measurement per biospecimen identifier per subject  
- pupose: tabulation  
- keys(eg): STUDYID, USUBJID, BSREFID, BSTESTCD  
- location: bs.xpt  
- 参考文献：
	- [DS-196 Simplifying PGx SDTM Domains for Molecular biology of Disease data(MBIO)](https://www.lexjansen.com/pharmasug/2020/DS/PharmaSUG-2020-DS-196.pdf)  
- 定义明晰：
	- [SDTM-human clinical trails(临床研究数据模型实施指南)3.4（下）](https://www.cn-healthcare.com/articlewm/20221108/content-1463431.html)  

### 4.2 CP  
- cell phenotype findings 细胞表型发现类  
- structure: One record per test per specimen per timepoint per visit per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, CPTESTID, CPSPEC, VISITNUM, CPTPTREF, CPTRTNUM  
- location: cp.xpt  
- 参考文献：[Pharmasug-China-2023-DS152.pdf (lexjansen.com)](https://www.lexjansen.com/pharmasug-cn/2023/DS/Pharmasug-China-2023-DS152.pdf)  

### 4.3 CV  
- cardiovascular system findings 心血管系统发现  
- structure: One record per finding or result per time point per visit per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, VISITNUM, CVTESTCD, CVTPTREF, CVTPTNUM  
- location: cv.xpt  
- 定义明晰：[SDTM部分发现类域简述 - 简书 (jianshu.com)](https://www.jianshu.com/p/2b4e18720da1)  

### 4.4 DA  
- product accountability 产品责任（？）
- structure: One record per product accountability finding per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, DATESTCD, DADTC  
- location: da.xpt
- 定义明晰：[临床试验CRF中Form介绍08：Drug Accountability (DA) - 简书 (jianshu.com)](https://www.jianshu.com/p/0a8629bf36e0)  

### 4.5 DD  
- death detail 死亡细节（？）
- structure: One record per finding per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, DDTESTCD, DDDTC  
- location: dd.xpt  
- 定义明晰：[临床试验CRF中Form介绍09：Death Details (DD) - 简书 (jianshu.com)](https://www.jianshu.com/p/9d119fe74ed5)  

### 4.6 EG  
- ECG test results ECG检查结果  
- structure: One record per ECG observation per replicate per timepoint or One record per ECG observation per beat per visit per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, EGTESTCD, VISITNUM, EGTPTREF, EGTPTNUM  
- location: eg.xpt  

### 4.7 FT  
- functional tests 功能测试  
- structure: One record per functional test finding per timepoint per visit per subject  
- purpose: tabulation  
- keys(eg): SYUDYID, USUBJID, TESTCD, VISITNUM, FTTPTREF, FTTPTNUM  
- location: ft.xpt  
- 定义明晰：[SDTM部分发现类域简述 - 简书 (jianshu.com)](https://www.jianshu.com/p/2b4e18720da1)  

### 4.8 GF  
- genomics findings  基因组学发现  
- structure: One record per finding per observation per biospecimen per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, GFTESTCD, GFSPEC, VISITNUM, GFTPTREF, GFTPTNUM  
- location: gf.xpt  
- 参考文献：
	- [Challenges and Solutions in Chromosome Aberration Data Mapping to Genomics Findings (GF) Domain for Oncology Studies (lexjansen.com)](https://www.lexjansen.com/pharmasug-cn/2023/DS/Pharmasug-China-2023-DS111.pdf)  
	- [Time to Get in the Genomics Findings (GF) Domain (lexjansen.com)](https://www.lexjansen.com/pharmasug-cn/2022/SR/Pharmasug-China-2022-SR145.pdf)  

### 4.9 IE  
- inclusion/exclusion criteria not met 入选/排除标准不符  
- structure: One record per inclusion/exclusion critetion not met per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, IETESTCD  
- location: ie.xpt  
- 定义明晰：[临床试验CRF中Form介绍05：Inclusion/Exclusion Criteria Not Met (IE) - 简书 (jianshu.com)](https://www.jianshu.com/p/9e1467a4e079)  

### 4.10 IS  
- immunogenicity specimen assessments  免疫原性检验/免疫原性标本评估  
- structure: One record per test per visit per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, ISTESTCD, ISBDAGNT, ISSCMBCL, ISTSTOPO, VISITNUM  
- location: is.xpt  

### 4.11 LB  
- laboratory test results 实验室检查 
- structure: One record per lab test per visit per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, LBTESTCD, LBSPEC, VISITNUM, LBTPTREF, LBTPTNUM  
- location: lb.xpt  

### 4.12 MB  
- microbiology specimen 微生物样本（？）  
- structure: One record per microbiology specimen finding per timepoint per visit per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, MBTESTCD, VISITNUM, MBTPTREF, MBTPTNUM  
- location: mb.xpt  

### 4.13 MI  
- microscopic findings  镜检发现（？）  
- structure: One record per finding per specimen per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, MISPEC, MITESTCD  
- location: mi.xpt  
- 参考文献：[PharmaSUG-2020-DS-110.pdf (lexjansen.com)](https://www.lexjansen.com/pharmasug/2020/DS/PharmaSUG-2020-DS-110.pdf)  
- 定义明晰：[SDTM部分发现类域简述 - 简书 (jianshu.com)](https://www.jianshu.com/p/2b4e18720da1#Mi%EF%BC%88Microscopic%20Findings%EF%BC%89)  

### 4.14  MK  
- musculoskeletal system findings  肌肉骨骼系统研究（？）
- structure: One record per assessment per visit per subject  
- purpose: tabulation
- keys(eg): STUDYID, USUBJID, VISITNUM, MKTESTCD, MKLOC, MKLAT  
- location: mk.xpt  

### 4.15 MS  
- microbiology susceptibility 微生物敏感性检测（？）  
- structure: One record per microbiology susceptibility test (or other organism-related finding) per organism found in MB  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, MSTESTCD, VISITNUM, MSTPTREF, MSTPTNUM  
- location: ms.xpt  

### 4.16 NV  
- nervous system findings 神经系统发现（？）
- structure: One record per finding per location per timepoint per visit per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, VISITNUM, NVTPTNUM, NVLOC, NVTESTCD  
- location: nv.xpt  

### 4.17 OE  
- ophthalmic examinations  眼科检查  
- structure: One record per ophthalmic finding per method per location per timepoint per visit per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, FOCID, OETESTCD, OETSTDTL, OEMETHOD, OELOC, OELAT, OEDIR, VISITNUM, OEDTC, OETPTREF, OETPTNUM, OEREPNUM  
- location: oe.xpt  

### 4.18 PC  
- pharmacokinetics concentrations 药代动力学浓度  
- structure: One record per sample characteristic or timepoint concentration per reference timepoint or per analyte per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, PCTESTCD, VISITNUM, PCTPTREF, PCTPTNUM  
- location: pc.xpt  

### 4.19 PE  
- physical examination  体格检查   
- structure: One record per body system or abnomality per visit per subject  
- purpose: tabulation  
- keys(eg): SYUDYID, USUBJID, PETESTCD, VISITNUM  
- location: pe.xpt  

### 4.20 PP  
- pharmacokinetics parameters  药代动力学参数  
- structure: One record per PK parameter per time concentration profile per modeling method per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, PPTESTCD, PPCAT, VISITNUM, PPRFTDTC  
- location: pp.xpt  

### 4.21 QS  
- questionnaires 问卷调查  
- structure: One record per questionaire per question per timepoint per visit per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, QSCAT, QSSCAT, VISITNUM, QSTESTCD  
- location: qs.xpt  

### 4.22 RE  
- respiratory system findings 呼吸系统检查结果  
- structure: One record per finding or result per timepoint per visit per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, VISITNUM, RETESTCD, RETPTNUM, REREPNUM  
- location: re.xpt  

### 4.23 RP  
- reproductive system findings 生殖系统检查  
- structure: One record per finding or result per timepoint per visit per subject  
- purpose: tabulation  
- keys(eg): STUDYID, DOMAIN, USUBJID, RPTESTCD, VISITNUM  
- location: rp.xpt  
- 定义明晰：[临床试验CRF中Form介绍18：Reproductive System Findings (RP) - 简书 (jianshu.com)](https://www.jianshu.com/p/8503a56acc3a)  

### 4.24 RS  
- disease response and clin classification 疾病反应与临床分类  
- structure: One record per response assessment or clinical calssfication assessment per timepoint per visit per subject per assessor per medical evaluator  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, RSTESTCD, VISITNUM, RSTPTREF, RSTPTNUM, RSEVAL, RSEVALID  
- location: rs.xpt  
- 定义明晰：
	- [(5) 肿瘤常用的三个域TR、TU、RS - 简书 (jianshu.com)](https://www.jianshu.com/p/d946f5071f50)  
	- [临床试验-肿瘤：从RECIST 1.1出发梳理肿瘤相关SDTM数据集 (TU\TR\RS)](https://zhuanlan.zhihu.com/p/582733476)  

### 4.25 SC  
- subject characteristics  受试者特征  
- structure: One record per characteristic per visit per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, SCTESTCD, VISITNUM  
- location: sc.xpt  

### 4.26 SS  
- subject status  受试者状态  
- structure: One record per status per visit per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, SSTESTCD, VISITNUM  
- location: ss.xpt  

### 4.27 TR  
- tumor/lesion results  肿瘤/病灶结果（？）  
- structure: One record per tumor measurement/assessment per visit per subject per assessor  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, TRTESTCD, TREVALID, VISITNUM  
- location: tr.xpt  
- 参考文献：[Why and What Standards for Oncology Studies (Solid Tumor, Lymphoma and Leukemia)?](https://www.lexjansen.com/wuss/2016/56_Final_Paper_PDF.pdf)  
### 4.28 TU  
- tumor/lesion identification 肿瘤/病灶标识  
- structure: One record per identified tumor per subject per assessor  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, TUEVALID, TULNKID  
- location: tu.xpt  

### 4.29 UR  
- urinary system findings 泌尿系统发现  
- structure: One record per finding per location per visit per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, VISITNUM, URTESTCD, UPLOC, URLAT, URDIR  
- location: ur.xpt  

### 4.30 VS  
- vital signs 生命体征  
- structure: One record per vital sign measurement per timepoint per visit per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, VATESTCD, VISITNUM, VSTPTREF, VSTPTNUM  
- location: vs.xpt  

### 4.31 FA  
- findings about events or interventions  
- structure: One record per finding, per object, per timepoint, per visit, per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, FATESTCD, FAOBJ, VISITNUM, FATPTREF, FATPTNUM  
- location: fa.xpt  

### 4.32 SR  
- skin response  皮肤反应  
- structure: One record per finding per object per timepoint per visit per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, SRTESTCD, SROBJ, VISITNUM, SRTPTREF, SRTPTNUM  
- location: sr.xpt  


## 5 Trial Design  
### 5.1 TA  
- trial arms 试验组别  
- structure: One record per planned element per arm  
- purpose: tabulation  
- keys(eg): STUDYID, ARMCD, TAETORD  
- location: ta.xpt  

### 5.2 TD  
- trial disease assessments  试验疾病评估  
- structure: One record per planned constant assessment period  
- purpose: tabulation  
- keys(eg): STUDYID, TDORDER  
- location: td.xpt  
- 参考文献：[TRIAL DESIGN DATASETS IN ONCOLOGY CLINICAL TRIALS](https://www.lexjansen.com/phuse-us/2022/si/PRE_SI04.pdf)  
- 定义明晰：[SDTM介绍（2）-- 试验设计模型 - 简书 (jianshu.com)](https://www.jianshu.com/p/5fe3c83430d9)  

### 5.3 TE  
- trial elements 试验元素  
- structure: One record per planned element 
- purpose: tabulation  
- keys(eg): STUDYID, ETCD  
- location: te.xpt  

### 5.4 TI  
- trial inclusion/exclusion criteria 试验入选/排除标准  
- structure: One record per I/E criterion  
- purpose: tabulation  
- keys(eg): STUDYID, IETESTCD  
- location: ti.xpt  

### 5.5 TM  
- trial disease milestones 试验疾病事件  
- structure: One record per disease milestone type  
- purpose: tabulation  
- keys(eg): STUDYID, MIDSTYPE  
- location: tm.xpt  

### 5.6 TS  
- trial summary 试验概要  
- structure: One record per trial summary parameter value 
- purpose: tabulation  
- keys(eg): STUDYID, TSPARMCD, TSSEQ  
- location: ts.xpt  

### 5.7 TV  
- trial visits 试验访视  
- structure: One record per planned visit per arm  
- purpose: tabulation  
- keys(eg): STUDYID, ARM, VISIT  
- location: tv.xpt


## 6 Relationship  
### 6.1 RELREC  
- related records 关联记录  
- structure: One record per related record, group of records or dataset  
- purpose: tabulation  
- keys(eg): STUDYID, RDOMAIN, USUBJID, IDVAR, IDVARVAL, RELID  
- location: relrec.xpt  

### 6.2 RELSPEC  
- related specimens 关联样本  
- structure: One record per specimen identifier per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, REFID  
- location: relspec.xpt  

### 6.3 RELSUB  
- related subjects 关联受试者  
- structure: One record per relationship per related subject per subject  
- purpose: tabulation  
- keys(eg): STUDYID, USUBJID, RSUBJID, SREL  
- location: relsub.xpt  

### 6.4 SUPP--  
- supplemental qualifiers for (domain name)  
- structure: One record per supplemental qualifier per related parent domain record(s)  
- purpose: tabulation  
- keys(eg): STUDYID, RDOMAIN, USUBJID, IDVAR, IDVARVAL, QNAM  
- location: supp--.xpt  


## 7 Study Reference  
### 7.1 OI  
- non-host organism identifiers  非宿主生物标识符（？）
- structure: One record per taxon per non-host organism  
- purpose: tabulation  
- keys(eg): NHOID, OISEQ  
- location: oi.xpt  
