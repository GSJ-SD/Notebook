
/*Z-test unpooled*/
data a;
    pc=0.11;
    pt=0.60;
    pb=(pt+pc)/2;
    d=abs(pt-pc);
    delta=0.25;
    k=3;
    nc=ceil( 
       ( probit(0.975) + probit(0.8) )**2
       *
       ( pt*(1-pt)/k + pc*(1-pc) )
        /
        ( (d-delta)**2 )

);
    nt=3*nc;
run;

/*Z-test pooled*/
data a;
    pc=0.11;
    pt=0.6;
    pb=(pt+pc)/2;
    d=abs(pt-pc);
    delta=0.25;
    k=3;
    nt=ceil( 
       ( probit(0.975)*sqrt(pb*(1-pb) + k*pb*(1-pb)) + probit(0.8)*sqrt(pt*(1-pt)+k*pc*(1-pc))
        )**2
        /
        ( (d-delta)**2 )

);
    nc=ceil(nt/k);
run;
