

proc import datafile="C:\Users\ashok pc\OneDrive\Desktop\SDTMIG Guidelines\TU.xlsx"
out=raw_tu 
dbms=xlsx
replace;
run;

data TU;
    set raw_tu;
    length DOMAIN $2 TUTESTCD $6 TUTEST $25 TULINKID $12 TULAT $6;
    DOMAIN = "TU";
	USUBJID = catx('',STUDYID,SUBJECTID);

    TUTESTCD = "TUMID";
    TUTEST = "Tumor Identification";
    TULINKID = cats("TU", upcase(TULOC));
    TULAT = ""; 
run;
proc sort data=TU; by USUBJID; run;

data TU1;
    set TU;
    by USUBJID;
    retain TUSEQ;
    if first.USUBJID then TUSEQ = 1;
    else TUSEQ + 1;
run;
