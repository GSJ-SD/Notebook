/*优效*/
data a;
    alpha=0.05;
    beta=0.2;
    pc=0.75;
    pt0=0.8;
    pt1=0.9;
    delta=0.05;
    k=2;
    nc=ceil((((probit(1-alpha/2)+probit(1-beta))**2)*(pc*(1-pc)+pt1*(1-pt1)/k))/(abs(pt1-pc)-delta)**2);
    nt=k*nc;
run;

/*等效-平衡*/
data a;
    alpha=0.05;
    beta=0.2;
    pc=0.55;
    pt=0.55;
    delta=0.15;
    k=1;
    nc=ceil((((probit(1-alpha)+probit(1-beta/2))**2)*(pc*(1-pc)+pt*(1-pt)/k))/(abs(pt-pc)-delta)**2);
    nt=k*nc;
run;

/*等效-平衡*/
data a;
    alpha=0.05;
    beta=0.2;
    pc=0.55;
    pt=0.6;
    delta=0.15;
    k=1;
    nc=ceil((((probit(1-alpha)+probit(1-beta))**2)*(pc*(1-pc)+pt*(1-pt)/k))/(abs(pt-pc)-delta)**2);
    nt=k*nc;
run;

/*等效-平衡*/
data a;
    alpha=0.05;
    beta=0.2;
    pc=0.55;
    pt=0.55;
    delta=0.15;
    k=1;
    nc=ceil((((probit(1-alpha)+probit(1-beta/2))**2)*(pc*(1-pc)+pt*(1-pt)/k))/(abs(pt-pc)-delta)**2);
    nt=k*nc;
run;

/*等效-非平衡*/
data a;
    alpha=0.05;
    beta=0.2;
    pc=0.92;
    pt=0.90;
    delta=0.05;
    k=2;
    nc=ceil((((probit(1-alpha)+probit(1-beta/2))**2)*(pc*(1-pc)+pt*(1-pt)/k))/(abs(pt-pc)-delta)**2);
    nt=k*nc;
run;

/*均数优效*/
data a;
    alpha=0.05;
    beta=0.2;
    mc=.;
    mt=.;
    dtc=8;
    delta=2;
    sigma=12;
    k=2;
    nc=ceil((((probit(1-alpha/2)+probit(1-beta))**2)*(sigma**2)*(1+1/k))/(dtc-delta)**2);
    nt=k*nc;
run;



/*均数等效*/
data a;
    alpha=0.05;
    beta=0.2;
    mc=.;
    mt=.;
    dtc=0;
    delta=5;
    sigma=10;
    k=2;
    nc=ceil((((probit(1-alpha)+probit(1-beta/2))**2)*(sigma**2)*(1+1/k))/(abs(dtc)-delta)**2);
    nt=k*nc;
run;

/*均数等效*/
data a;
    alpha=0.05;
    beta=0.2;
    mc=.;
    mt=.;
    dtc=2;
    delta=5;
    sigma=10;
    k=1;
    nc=ceil((((probit(1-alpha)+probit(1-beta))**2)*(sigma**2)*(1+1/k))/(abs(dtc)-delta)**2);
    nt=k*nc;
run;
