# Elevate-Labs
# 🎬 Netflix Movies and TV Shows – Data Cleaning & Preprocessing
##task1
## 📁 Project Overview

This project focuses on cleaning and preprocessing the **Netflix Movies and TV Shows** dataset sourced from Kaggle. The aim is to handle missing values, fix formatting issues, standardize data types, and prepare the dataset for analysis or visualization.

---

## 📊 Data Cleaning Summary

**Dataset**: Netflix Movies and TV Shows (Kaggle)

### 🔧 Cleaning Steps Performed:

- **Missing Values**:
  - Filled missing values in `director`, `cast`, and `country` with `"Unknown"`.
  - Filled missing `rating` values with `"Not Rated"`.
  - Dropped rows with missing values in `date_added` and `duration`.

- **Duplicates**:
  - Removed any duplicate rows using `.drop_duplicates()`.

- **Standardization**:
  - Converted `date_added` to proper `datetime` format.
  - Split `duration` into two new columns:  
    - `duration_int`: Numeric value  
    - `duration_type`: Time unit (e.g., `min`, `Season`)
  - Cleaned column names for readability and uniformity.

- **Data Type Fixes**:
  - Ensured proper data types:
    - `duration_int`: `int`
    - `date_added`: `datetime64[ns]`
    - `release_year`: `int`

---

## ✅ Final Output

- ✅ Cleaned dataset with no nulls  
- ✅ Correct data types  
- ✅ Ready for analysis, modeling, or dashboarding

---

## 🛠️ Tools Used

- **Language**: Python  
- **Libraries**: Pandas, NumPy  
- **Platform**: Jupyter Notebook (.ipynb)

---

## 📂 Files Included

- `Netflix_Cleaning.ipynb` – Jupyter notebook containing the full cleaning process  
- `netflix_cleaned.csv` – Final cleaned dataset (optional to include)  
- `README.md` – Project summary

---

## 🙌 Acknowledgements

- Dataset: [Netflix Movies and TV Shows on Kaggle](https://www.kaggle.com/datasets/shivamb/netflix-shows)

