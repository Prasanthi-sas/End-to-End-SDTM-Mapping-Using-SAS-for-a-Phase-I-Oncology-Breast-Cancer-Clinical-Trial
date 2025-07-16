
*----------------------------------------------------------------------------*
domain:-DM
label:-Demographics
Class:-special purpose
Structure:-one rec per one observation
key variables:-studyid usubjid
Raw datasets:-dm sv ta ds inform actarmcd
programmer:-Prasanthi
qc programmer:-
*----------------------------------------------------------------------------*;


libname raw "C:\Users\ashok pc\OneDrive\Desktop\Raw";


proc copy in=raw out=work memtype=data;
select dm;
run;

data dm1;
set dm;
length usubjid $40.;
studyid=strip(study);
domain='DM';
usubjid=catx('_',study,site,subject);
subjid=left(put(subject,best.));
siteid=strip(site);
invnam=strip(invnam);
brthdtc=strip(birth);
ethnic=left(ethinicity);
sex=strip(upcase(sex));
race=left(race);
country=left(country);
run;

/*rfxstdtc=rfstdtc rfxendtc=rfendtc;*/


proc copy in=raw out=work;
select ex;
run;

proc sort data=ex out=ex1 (keep=subject study startdate where=(subject ne .));
by study subject startdate;
run;

data start (rename=(startdate=rfxstdtc)) end(rename=(startdate=rfxendtc));
set ex1;
by study subject startdate;
if first.subject then output start;
if last.subject then output end;
run;

proc sort data=start;by study subject;run;
proc sort data=end;by study subject;run;
proc sort data=dm1;by study subject;run;

data dm2;
merge dm1(in=a) start(in=b) end(in=c);
by study subject;
rfstdtc=rfxstdtc;
rfendtc=rfxendtc;
if a;
dob=input(birth,yymmdd10.);
rfstdt=input(RFSTDTC,IS8601DA.);
IF ~MISSING (RFSTDT) AND ~ MISSING (DOB)THEN DO;
AGE=INT((RFSTDT-DOB)/365.25);
AGEU='YEARS';
END;
ELSE DO;
AGE=.;
AGEU='';
end;
run;

PROC SORT DATA=RFPENDTC;BY STUDY SUBJECT;RUN;


proc copy in=raw out=work;
select inform;
run;


data icdtc(keep=study subject rficdtc);
set inform;
if term='date consent signed' then rficdtc=collection_date;
run;


/*rfpendtc;*/

proc copy in=raw out=work;
select sv ds;
run;

PROC SORT DATA=SV OUT=SV1;BY STUDY SUBJID ENDDATE;RUN;


DATA RFPENDTC(KEEP=STUDY SUBJID ENDDATE RENAME=(SUBJID=SUBJECT ENDDATE=RFPENDTC));
SET SV1;
BY STUDY SUBJID ENDDATE;
IF LAST.SUBJID;
RUN;

data death(keep=study subject dthdtc dthfl);
set ds;
if index(upcase(term),'DEATH') then do;
dthdtc=put(ons_date,yymmdd10.);
dthfl='Y';
end;
else do;
dthdtc='';
dthfl='N';
end;
run;
proc sort data=dm2;by study subject;run;
proc sort data=icdtc;by study subject;run;
proc sort data=rfpendtc;by study subject;run;
proc sort data=death;by study subject;run;

data dm3;
merge dm2(in=a) icdtc(in=b) rfpendtc(in=c) death(in=d);
by study subject;
if a;
run;

/*armcd arm actarmcd actarm*/

proc copy in=raw out=work;
select ta actarmcd;
run;

proc sort data=ta out=ta1(keep=armcd arm rename=(armcd=actarmcd)) nodupkey;
by armcd;
run;

proc sort data=ta1;by actarmcd;run;
proc sort data=actarmcd;by actarmcd;run;

data ta2(drop=study);
merge ta1(in=a) actarmcd(in=b);
by actarmcd;
if a;
run;

proc sort data=dm3;
by subject Randomization_Code;
run;
proc sort data=ta2;
by subject Randomization_Code;
run;

data dm4;
merge dm3(in=a) ta2(in=b);
by subject Randomization_Code;
if a;
armcd=actarmcd;
actarm=arm;
run;
/*dmdtc*/

proc copy in=raw out=work;
select dmdtc;
run;
proc sort data=dmdtc;
by study subject;
run;


data dm5;
merge dm4(in=a) dmdtc(rename=(dmdtc=col_dt) in=b);
by study subject;
if a;
dmdtc=put(col_dt,yymmdd10.);

/*dmdy*/

if col_dt >= rfstdt then dmdy=(col_dt-rfstdt)+1;
else if col_dt < rfstdt then dmdy=(col_dt-rfstdt);

run;

options validvarname=upcase;
data DM(label='Demographics');
attrib	studyid 	label='Study Identifier' 					length=$10
        domain		label='Domain Abbreviation'					length=$2
		usubjid 	label='Unique Subject Identifier'			length=$40
		subjid		label='Subject Identifier for the Study'	length=$40
		rfstdtc		label='Subject Reference Start Date/Time'	length=$20
		rfendtc		label='Subject Reference End Date/Time'		length=$20
		rfxstdtc    label='date/time of first study treatment'  length=$20
		rfxendtc    label='date/time of last study treatment'   length=$20
		rfxicdtc    label='date/time of informed consent'       length=$20
		rfpendtc    label='date/time of end participation'      length=$20
		dthdtc      label='date/time of death'                  length=$20
		dthfl       label='death flag'                          length=$10
        siteid      label= 'study site identifier'              length=$20
		invnam      label='investigator name'                   length=$15
		brthdtc     label='date/time of birth'                  length=$20
		age         label='age'                                 length=8
		ageu        label='ageunits'                            length=$10
		sex         label='sex'                                 length=$2
		race        label='race'                                length=$20
		ethnic      label='ethinicity'                          length=$20
		armcd       label='planned arm code'                    length=$20
		arm         label='description armcode'                 length=$20
		actarmcd    label='actual arm code'                     length=$20
		actarm      label='description of actual arm code'      length=$20
		country     label='country'                             length=$20
		dmdtc       label='date/time of collection'             length=$20
		dmdy        label='study day of collection'             length=8;
set dm5;
keep STUDYID DOMAIN USUBJID SUBJID rfstdtc rfendtc rfxstdtc rfxendtc
     rficdtc rfpendtc dthdtc dthfl SITEID invnam BRTHDTC age ageu
	 sex race ethnic armcd ARM  actarmcd  actarm country
	 dmdtc dmdy;
	 run;




proc transpose data=dm5 out=supp;
var RANDOMIZATION_CODE;
by studyid usubjid;
run;

data suppdm;
set supp;
studyid=studyid;
rdomain='dm';
usubjid=usubjid;
idvar='';
idvarval='';
qnam=_name_;
qlabel=_label_;
qval=col1;
qorign='crf';
qeval='investigator';
run;

data suppdm1;
set suppdm;
keep studyid rdomain usubjid idvar idvarval qnam qlabel qval qorign qeval;
run;



libname DM xport "C:\Users\ashok pc\OneDrive\Desktop\SDTM\dm.xpt";

proc copy in=work out=DM;
select DM;
run;

libname SUPPDM xport "C:\Users\ashok pc\OneDrive\Desktop\SDTM\suppdm.xpt";

proc copy in=work out=SUPPDM;
select suppdm1;
run;


filename DM "C:\Users\ashok pc\OneDrive\Desktop\SDTM\dm log.txt";
proc printto log=DM;
run;


filename SuppDM "C:\Users\ashok pc\OneDrive\Desktop\SDTM\SuppDM.txt";

proc printto log=SuppDM;
run;


proc printto log=log;
run;
