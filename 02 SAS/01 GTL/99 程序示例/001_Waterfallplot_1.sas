/*�������ݼ�*/
data test;
  input USUBJID $ PCHG responsen response $ @@;
  datalines;
  S01001 2.73   3 SD
  S01002 1.25   3 SD
  S01003 -2.01  3 SD
  S01004 -3.87  3 SD
  S01005 -5.23  3 SD
  S01006 -6.78  3 SD
  S01007 -9.35  3 SD
  S01008 -12.56 3 SD
  S01009 -23.74 2 PR
  S01010 -26.82 3 SD
  S01011 -31.43 2 PR
  S01012 -41.09 3 SD
  S01013 -47.23 2 PR
  S01014 -53.78 2 PR
  S01015 -68.24 2 PR
  S01016 -82.75 2 PR
  S01017 -92.55 2 PR
  S01018 -100   1 CR
  S01019 -100   1 CR
  S01020 -100   1 CR
  S01021 -100   1 CR
  S01022 -100   1 CR
  S01023 -100   1 CR
  S01024 -100   1 CR
  S01025 -100   1 CR
  S01026 -100   1 CR
  S01027 -100   1 CR
  S01028 -100   1 CR
  S01029 -100   1 CR
  S01030 -100   1 CR
;
run;

data test;
  set test;
  format responsen resp.;
run;

/*����ģ��*/
proc template;
  define statgraph waterfall;
  /*���嶯̬����*/
  dynamic title XLABEL YLABEL _VAR _ORDER _PCHG _FILL;
    begingraph / /*designwidth = 960 designheight = 720*/;
      entrytitle title;
	  /*��������ͼ�����ɫ*/
	  discreteattrmap name = "colors" / ignorecase = true;
	    value "CR" / fillattrs=(color = green);
		value "PR" / fillattrs=(color = blue);
		value "SD" / fillattrs=(color = orange);
		value "PD" / fillattrs=(color = red);
	  enddiscreteattrmap;
	  /*��������ͼ����������*/
	  discreteattrvar attrvar = barcolors var = _VAR attrmap = "colors";

	  layout overlay / 
	    xaxisopts = (label = XLABEL griddisplay = on display = (label line))
	    yaxisopts = (label = YLABEL griddisplay = on display = all);
		if (upcase(_FILL) in ("COLORS"))/*��ɫ����response*/
	      barchart x = _ORDER y = _PCHG / group = barcolors name = "bar" barwidth = 0.7;
	      discretelegend 'bar' / opaque=true border=true halign=center 
                               valign=center title=" Best response"
                               sortorder=ascendingformatted;
		endif;
		if (upcase(_FILL) in ("NOCOLORS"))/*������response*/
	      barchart x = _ORDER y = _PCHG / name = "bar" barwidth = 0.7;
		endif;

		/*����ͼ��˵��*/
	    layout gridded / rows=4 order=columnmajor border=false autoalign=(bottomleft);
	      entry textattrs=(size=10pt) halign=left "CR = Complete Response";
		  entry textattrs=(size=10pt) halign=left "PR = Partial Response";
		  entry textattrs=(size=10pt) halign=left "SD = Stable Disease";
		  entry textattrs=(size=10pt) halign=left "PD = Progression Disease";
	    endlayout;
      endlayout;
    endgraph;
  end;
run;

/*ͼ����Ⱦ*/
proc sgrender data=test template=waterfall;
  dynamic title = "Waterfall Plot" XLABEL = "Subjects" YLABEL = "Best Percentage Change from Baseline"
          _VAR = "responsen" _ORDER = "USUBJID" _PCHG = "PCHG" _FILL = "colors";
run;

proc sgrender data=test template=waterfall;
  dynamic title = "Waterfall Plot" XLABEL = "Subjects" YLABEL = "Best Percentage Change from Baseline"
          _ORDER = "USUBJID" _PCHG = "PCHG" _FILL = "nocolors";
run;
