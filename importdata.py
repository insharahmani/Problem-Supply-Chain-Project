# Import necessary libraries
import pandas as pd                    # For DataFrame
import numpy as np                     # For numerical operations
import matplotlib.pyplot as plt        # For plotting
import seaborn as sns                  # For better visualization

# For Machine Learning and modeling (if needed)
# (Install if not available: pip install pandas numpy matplotlib seaborn scikit-learn)
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error, r2_score

# ✅ Provide the correct path to the CSV file (change it according to your location)
file_path = 'C:/Users/insha/OneDrive/Desktop/Supply Chain/supply_chain_extended_data.csv'

# Load the CSV file
df = pd.read_csv(file_path)

# View the first part of the data
print("First 5 rows:")
print(df.head())

# View the structure of the data
print("\nShape of the data:", df.shape)

# View the column names
print("\nColumn names:")
print(df.columns)

# Check for missing values
print("\nMissing values information:")
print(df.isnull().sum())

# View summary statistics
print("\nSummary statistics:")
print(df.describe())
# -----------------------------
# 1. Histogram for numerical columns
# -----------------------------
df.hist(color='lightcoral', edgecolor='black', figsize=(12, 8))
plt.suptitle('Distribution of Numerical Features', fontsize=16, color='darkred')
plt.tight_layout()
plt.show()

# -----------------------------
# 2. Correlation Heatmap (optional but useful)
# -----------------------------
plt.figure(figsize=(10, 6))
sns.heatmap(df.corr(numeric_only=True), annot=True, cmap='Reds', fmt=".2f")
plt.title('Correlation Heatmap', fontsize=16, color='darkred')
plt.show()

# -----------------------------
# 3. Bar Plot of Missing Values (if any)
# -----------------------------
missing_values = df.isnull().sum()
missing_values = missing_values[missing_values > 0]

if not missing_values.empty:
    plt.figure(figsize=(8, 4))
    missing_values.plot(kind='bar', color='indianred', edgecolor='black')
    plt.title('Missing Values per Column', fontsize=14, color='darkred')
    plt.ylabel('Count')
    plt.xticks(rotation=45)
    plt.tight_layout()
    plt.show()
