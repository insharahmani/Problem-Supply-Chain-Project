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
import pandas as pd
import matplotlib.pyplot as plt

# Load the dataset
df = pd.read_csv('supply_chain_extended_data.csv')

# Show all columns
print("\n✅ Columns in your dataset:")
print(df.columns.tolist())

# Set style to something safe
plt.style.use('ggplot')

# Red and light red
main_color = '#e74c3c'     # Red
border_color = '#f1948a'   # Light red

# Correct column names from your dataset
columns = [
    'Current_Stock',
    'Demand_Forecast',
    'Lead_Time_Days',
    'Shipping_Time_Days',
    'Operational_Cost',
    'Monthly_Sales',
    'Order_Processing_Time',
    'Return_Rate',
    'Backorder_Quantity',
    'Damaged_Goods'
]

# Plot 10 histograms
for i, col in enumerate(columns, 1):
    plt.figure(figsize=(8, 4))
    plt.hist(df[col].dropna(), bins=20, color=main_color, edgecolor=border_color)
    plt.title(f"{i}. Histogram of {col}", fontsize=14)
    plt.xlabel(col, fontsize=12)
    plt.ylabel('Frequency', fontsize=12)
    plt.grid(True, linestyle='--', alpha=0.5)
    plt.tight_layout()
    plt.show()

