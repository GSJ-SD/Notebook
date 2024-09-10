
### 1 RISKDIFF  
#### 1.1 基础语法  
语法为：`tables P * C / RISKDIFF <(riskdiff-options)>`  

此选项用于计算 2×2 表的二项式比例的 risk 和 risk difference。  
默认情况下，将计算行 1 的 risk 、行 2 的 risk 、总的 risk 、以及（行 1 - 行 2）的 risk ，及其渐进标准误差和 wald 置信限，并为行 1 和行 2 以及总的 risk 提供精确（clopper-pearson）置信限。  

*CL =*（riskdiff-options） 选项计算风险差值的置信区间。可用的置信区间类型包括：  
- Agresti-Caffo  
- exact unconditional  
- Hauck-Anderson  
- Miettinen-Nurminen (score)  
- Newcombe(注意：在率均为0%或均为100%时SAS无法计算风险差值及其95%CI，但 Newcombe-wilson方法其实是可以计算的，详见[[2023-12-20 有效率差为0%或100%时置信区间的计算]])  
- Wald  
- Continuity-corrected Newcombe  
- Continuity-corrected Wald  
可在同一分析中计算多种类型的置信限。  


*CL=EXACT* （riskdiff-options）选项计算 exact unconditional confidence 。当指定此选项时，还必须在 EXACT 语句中指定 RISKDIFF 选项来请求计算精确的置信限。  


*EQUAL* ，*EQUIV* ，*NONINF* ，和 *SUP* （riskdiff-options）选项分别对风险差值进行等效性、非劣效性、优效性检验。可用的检验方法包括：  
- Farrington-Manning (score)  
- Hauck-Anderson  
- Wald  
此外，Newcombe (hybrid-score) 置信区间可用于等效性、非劣效性和优效性分析（为什么要和上述方法分开写？）。  

*ALPHA=* 选项提供 $100(1-2\alpha)\%$ 的置信区间，例如：*ALPHA=0.05* ，将计算 90% 置信区间（默认值）。  



