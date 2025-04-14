# 🛳️ Titanic Dataset - Exploratory Data Analysis (EDA)

This project performs Exploratory Data Analysis (EDA) on the Titanic dataset using Python. The goal is to extract meaningful insights and visualize survival patterns using various statistical and graphical tools.

---

## 📌 Objective

To explore the Titanic dataset and uncover patterns related to passenger survival based on features like gender, age, class, and fare.

---

## 🛠️ Tools & Libraries Used

- Python (Pandas, NumPy)
- Matplotlib & Seaborn
- Jupyter Notebook (inside VS Code)

---

## 📁 Dataset

- `train.csv` from the [Kaggle Titanic Challenge](https://www.kaggle.com/c/titanic/data)

---

## 🔍 Steps Performed

1. **Data Loading**
2. **Initial Data Inspection**  
   - `.info()`, `.describe()`, `.head()`, `.value_counts()`
3. **Missing Values Handling**  
   - Filled `Age` with median  
   - Dropped `Cabin` due to high missing data  
   - Filled `Embarked` with mode
4. **Univariate Analysis**  
   - Histograms for Age, Fare  
   - Countplot for Survived, Sex, Pclass
5. **Bivariate Analysis**  
   - Boxplot (Age vs Survived)  
   - Countplot (Pclass vs Survived, Sex vs Survived)
6. **Multivariate Analysis**  
   - Correlation Heatmap  
   - Pairplot
7. **Observations & Insights**

---

## 📊 Key Insights

- Females had higher survival rates than males.
- Passengers in 1st class had the highest survival rates.
- Children under 10 had better chances of survival.
- Higher fare correlated with better survival.

---

## 📎 Output Files

- `Titanic_EDA.ipynb` – Jupyter Notebook with analysis
- `Titanic_EDA_Report.pdf` – PDF summary report of findings

---

