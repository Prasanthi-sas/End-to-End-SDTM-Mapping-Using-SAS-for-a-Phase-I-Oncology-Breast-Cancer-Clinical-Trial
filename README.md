End-to-End-SDTM-Mapping-Oncology/
├── 📁 Raw_Data/
│ ├── dm_synthetic.csv
│ ├── ex_synthetic.csv
│ ├── ae_synthetic.csv
│ ├── tu_raw.xlsx
│ ├── tr_raw.xlsx
│ └── rs_raw.xlsx
│
├── 📁 Mapping_Specifications/
│ ├── DM_Mapping_Spec.xlsx
│ ├── TU_Mapping_Spec.xlsx
│ ├── TR_Mapping_Spec.xlsx
│ └── RS_Mapping_Spec.xlsx
│
├── 📁 SAS_Code/
│ ├── DM_Mapping.sas
│ ├── TU_Mapping.sas
│ ├── TR_Mapping.sas
│ └── RS_Mapping.sas
│
├── 📁 Output_SDTM/
│ ├── dm.sas7bdat
│ ├── tu.sas7bdat
│ ├── tr.sas7bdat
│ └── rs.sas7bdat
│
├── 📁 Documentation/
│ ├── SDTM_Tumor_Domains_Overview.pdf
│ ├── Project_Summary.docx
│ └── Variable_Derivations.md
│
└── README.md


 End-to-End-SDTM-Mapping-Using-SAS-for-a-Phase-I-Oncology-Breast-Cancer-Clinical-Trial
 This project showcases the complete SDTM mapping workflow for a Phase I **Oncology** clinical trial focused on **Breast Cancer**. Using **Base SAS**, I transformed raw clinical data into **CDISC-compliant SDTM datasets**, including both standard domains (DM, DS, EX, etc.) and oncology-specific domains such as TU, TR &amp;RS
 
 ->>>>About This Project
This project demonstrates the end-to-end SDTM mapping workflow for a Phase I Oncology Clinical Trial, specifically focused on Breast Cancer. It mimics an early-phase real-world trial setup where patient-level raw data is collected, cleaned, transformed, and mapped to CDISC SDTM standards using Base SAS.

The trial aims to evaluate the safety and tumor response to an investigational drug in patients with solid tumors. The datasets include both general and oncology-specific domains such as:

DM: Demographics
EX: Exposure
DEATH: Death-related details
TU: Tumor Identification
TR: Tumor Measurements
RS: Tumor Response

All transformations are done following SDTMIG v3.2 guidelines, especially the oncology tumor domains critical in regulatory submissions for cancer studies.



