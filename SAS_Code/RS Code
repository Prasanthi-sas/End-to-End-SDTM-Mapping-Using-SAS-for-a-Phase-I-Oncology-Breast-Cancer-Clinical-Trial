
proc import datafile="C:\Users\ashok pc\OneDrive\Desktop\SDTMIG Guidelines\RS.xlsx"
out=raw_RS
dbms=xlsx
replace;
run;
data raw_rs_clean;
    set raw_rs;
    DOMAIN     = "RS";
    USUBJID    = catx("-", STUDYID, SUBJID);
    RSTESTCD   = "TUMRESP";
    RSTEST     = "Tumor Response";
    RSORRES    = strip(RESPONSE);
    RSSTRESC   = RSORRES;
    RSLAT      = "";  
    RSLINKID   = cats("TU", upcase(RSLOC));
run;

proc sort data=raw_RS; by USUBJID RSDTC RSLINKID; run;

data RS_final;
    set RS;
    by USUBJID;
    retain RSSEQ;
    if first.USUBJID then RSSEQ = 1;
    else RSSEQ + 1;
run;

proc print data=RS_final; run;
