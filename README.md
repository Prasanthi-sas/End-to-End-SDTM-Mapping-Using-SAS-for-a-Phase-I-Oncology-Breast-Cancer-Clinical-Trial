# 📊 End-to-End SDTM Mapping for a Phase I Oncology Clinical Trial

## 🧪 Project Overview

This project demonstrates the end-to-end transformation of raw clinical trial data into CDISC-compliant SDTM datasets using **Base SAS**.  
It focuses on a **Phase I open-label, multi-center, non-randomized oncology trial** involving subjects with solid tumors.

Key SDTM domains implemented include standard domains like `DM`, `EX`, `LB`, as well as oncology-specific tumor domains `TU`, `TR`, and `RS`.

## 🔍 Study Background

- **Title**: Open-Label, Multi-Center, Non-Randomized Phase I Study  
- **Therapeutic Area**: Oncology  
- **Population**: Patients with solid tumors  
- **Objective**: Evaluate safety and tumor response of an investigational product  

## 🛠️ Tools & Standards

- **Base SAS 9.4** – Data cleaning, transformation, derivation  
- **Microsoft Excel** – Raw data and mapping specifications  
- **CDISC SDTMIG v3.2** – Standard for SDTM compliance  

## 📁 Project Structure
End-to-End-SDTM-Mapping-Oncology/
├── Raw_Datasets/ # Raw mock Excel data (DM.xlsx, TU.xlsx, etc.)
├── Mapping_Specifications/ # Mapping specs for each domain
├── SAS_Code/ # All SAS scripts used for mapping and derivations
├── Output_SDTM/ # Final SDTM datasets (.sas7bdat format)
├── Documentation/ # Project write-up and study overview
└── README.md # Project overview (this file)



## 🧾 SDTM Domains Created

| Domain | Description              | Key Variables                     |
|--------|--------------------------|-----------------------------------|
| DM     | Demographics             | AGE, SEX, RACE, USUBJID           |
| EX     | Exposure                 | EXSTDAT, EXENDAT, EXDOSE          |
| LB     | Laboratory Data          | LBTESTCD, LBORRES, LBDTC          |
| TU     | Tumor Identification     | TUTESTCD, TULINKID, TUSEQ         |
| TR     | Tumor Results            | TRTESTCD, TRORRES, TRSEQ          |
| RS     | Tumor Response           | RSTESTCD, RSSTRESC, RSSEQ         |


## 🔄 Key Derivations

- `USUBJID = STUDYID || "-" || SUBJECT`
- `TUSEQ`, `TRSEQ`, and `RSSEQ` derived using `BY USUBJID` and `RETAIN`
- `RFXSTDTC` derived from first dosing date (SPCPKB1 or EX)
- Controlled terms mapped using conditional SAS logic


## ✅ Validations

- `PROC SORT` to eliminate duplicates and sort by key variables  
- `PROC COMPARE` to validate derived vs raw datasets  
- Manual review of sequencing and controlled terminology


## 📌 Key Learnings

- Implemented oncology-specific SDTM domains (TU, TR, RS)  
- Applied CDISC standards with traceability and linkage (`TULINKID`, `TRLINKID`)  
- Developed macro-driven workflows and improved SAS data step techniques  


## 👩‍💻 Author

**Prasanthi Kata**  
Clinical SAS Programmer (Intern)  
[GitHub Profile](https://github.com/Prasanthi-sas)



