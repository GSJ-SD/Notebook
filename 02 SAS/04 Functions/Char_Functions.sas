/*UPCASE”ÎLOWCASE*/
data test1;
	a="kg"; output;
	a="Kg"; output;
	a="KG"; output;
run;

data test1;
	set test1;
	b=UPCASE(a);
	c=LOWCASE(a);
	d=put(a,$UPCASE.);
run;

/*compress anyalnum*/
data test2;
	a="a	bbc"; output;
run;

data test2;
	set test2;
	b=compress(a,"c","h");
	c=anyalnum("  abc");
run;
