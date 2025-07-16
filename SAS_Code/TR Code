

proc import datafile="C:\Users\ashok pc\OneDrive\Desktop\SDTMIG Guidelines\TR.xlsx"
out=raw_TR
dbms=xlsx
replace;
run;

data TR;
    set raw_tr;
    length DOMAIN $2 USUBJID $25 TRTESTCD $10 TRTEST $25
           TRORRES $10 TRSTRESC $10 TRLOC $20 TRLAT $10
           TRDTC $10 TRLINKID $15 TRGRPID $20;

    DOMAIN     = "TR";
    USUBJID    = catx("-", STUDYID, SUBJID);
    TRTESTCD   = "TUMDIA";
    TRTEST     = "Tumor Diameter";
    TRORRES    = strip(put(DIAM, best.));
    TRSTRESC   = TRORRES;
    TRLAT      = "";  
    TRLINKID   = cats("TU", upcase(TRLOC));
run;
proc sort data=TR; by USUBJID TRDTC TRLINKID; run;

data TR_final;
    set TR;
    by USUBJID;
    retain TRSEQ;
    if first.USUBJID then TRSEQ = 1;
    else TRSEQ + 1;
run;

proc print data=TR_final; run;
