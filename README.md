# End-to-End-SDTM-Mapping-Using-SAS-for-a-Phase-I-Oncology-Breast-Cancer-Clinical-Trial
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

📂 Raw datasets 
End-to-End-SDTM-Mapping-Using-SAS-for-a-Phase-I-Oncology-Breast-Cancer-Clinical-Trial/
├── Raw_data/
│   ├── dm_synthetic.csv
│   ├── ex_synthetic.csv
│   ├── ae_synthetic.csv
│   ├── lb_synthetic.csv
│   ├── rs_synthetic.csv
│   ├── tr_synthetic.csv
│   └── tu_synthetic.csv
│
├── sas_code/
│   ├── dm_mapping.sas
│   ├── tr_mapping.sas
│   └── (others)
│
├── output/
│   ├── SDTM_DM.xpt
│   ├── SDTM_TR.xpt
│   └── (final SDTM datasets if available)
│
├── specs/
│   └── mapping_spec.xlsx
│
├── README.md
└── LICENSE (optional)

