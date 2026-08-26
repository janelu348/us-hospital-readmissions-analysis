# U.S. Hospital Readmissions Analysis

[![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/janelu348/us-hospital-readmissions-analysis/blob/main/notebooks/hospital_readmissions_analysis.ipynb)

This portfolio project examines above-expected 30-day hospital readmissions in the United States. It combines CMS hospital data, patient-experience measures, SQL analysis, machine-learning models, and an interactive Tableau dashboard.

## Interactive Dashboard

[View the U.S. Hospital Readmissions Dashboard in Tableau Public](https://public.tableau.com/app/profile/janeth.garcia.rodriguez/viz/USHospitalReadmissionsAnalysis/HospitalReadmissionsDashboard)

The dashboard includes:

- Readmission results across U.S. states
- Filters for state, medical condition, ownership, and emergency services
- Hospital and readmission KPI cards
- Readmission comparisons by hospital ownership
- Patient-experience comparisons
- Random Forest prediction results

## Research Question

How are hospital characteristics and patient experience related to above-expected 30-day hospital readmissions?

## Data Sources

The project uses public data from the Centers for Medicare & Medicaid Services (CMS):

- [Hospital Readmissions Reduction Program](https://data.cms.gov/provider-data/dataset/9n3s-kdb3)
- [Hospital General Information](https://data.cms.gov/provider-data/dataset/xubh-q36u)
- [Patient Survey (HCAHPS) - Hospital](https://data.cms.gov/provider-data/dataset/dgck-syfz)
- [CMS Hospital Data Archives](https://data.cms.gov/provider-data/archived-data/hospitals)

### Measurement Periods

- Hospital readmissions: July 2021 to June 2024
- Patient experience: October 2022 to September 2023
- Hospital information snapshot: July 2024

## Dataset

The final modeling dataset contains:

- 11,441 hospital-condition rows
- 2,670 hospitals
- Six medical conditions
- Hospital characteristics
- Six patient-experience measures
- A binary target for above-expected readmissions

The target variable is `high_readmission`:

- `1`: Above the expected readmission level
- `0`: At or below the expected readmission level

## Project Workflow

1. Imported and reviewed three CMS datasets.
2. Cleaned column names, missing values, categories, and percentages.
3. Joined the datasets using the CMS facility ID.
4. Explored readmissions by state, condition, ownership, and patient experience.
5. Created SQLite tables and SQL queries.
6. Prepared numerical and categorical features for modeling.
7. Compared Logistic Regression, Decision Tree, and Random Forest models.
8. Evaluated the final model on hospital-based testing data.
9. Used permutation importance to interpret the Random Forest model.
10. Created an interactive Tableau Public dashboard.

## Main Findings

- Approximately 48.3% of hospital-condition rows were above the expected readmission level.
- Proprietary hospitals had the highest percentage of above-expected readmissions among the five ownership groups.
- Hospitals at or below the expected readmission level had slightly higher average patient-experience scores.
- The number of discharges was the most useful feature for the Random Forest model.
- Medical condition and discharge information were also useful predictors.

## Model Results

Random Forest had the strongest overall testing performance:

- Accuracy: approximately 62.4%
- ROC-AUC: approximately 0.675
- F1 score: approximately 0.583

Logistic Regression had the highest recall at approximately 61.5%. The models performed better than the baseline, but the results show that hospital readmissions are difficult to predict with the available hospital-level features.

## SQL Analysis

The SQL section creates and connects three SQLite tables:

- `readmissions`
- `hospitals`
- `patient_experience`

The queries compare readmissions by medical condition and ownership and compare average patient experience between the two readmission groups.

## Tools

- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Scikit-learn
- SQLite and SQL
- Google Colab
- Tableau Public
- GitHub

## Repository Structure

```text
us-hospital-readmissions-analysis/
|-- data/
|   `-- tableau_dashboard_data.csv
|-- notebooks/
|   `-- hospital_readmissions_analysis.ipynb
|-- outputs/
|   |-- cross_validation_results.csv
|   |-- feature_importance.csv
|   |-- testing_results.csv
|   |-- sql_results_by_condition.csv
|   |-- sql_results_by_ownership.csv
|   `-- sql_results_patient_experience.csv
|-- sql/
|   `-- hospital_readmission_analysis.sql
|-- .gitignore
|-- README.md
`-- requirements.txt
```

## Run the Project

1. Clone or download this repository.
2. Install the required Python packages:

```bash
pip install -r requirements.txt
```

3. Open `notebooks/hospital_readmissions_analysis.ipynb` in Google Colab or Jupyter Notebook.
4. Update the project directory in the notebook if the files are stored in a different location.
5. Run the notebook cells in order.

## Limitations

- The data contains hospital-level estimates, not individual patient records.
- The readmission and patient-experience measurement periods overlap but are not identical.
- The number of discharges was missing in about 30% of the rows.
- Patient-experience measures are based on survey responses.
- The dataset does not contain every clinical, staffing, access, or socioeconomic factor that may affect readmissions.
- Model performance was moderate and may change with another time period.

## Author

Janeth Garcia Rodriguez

