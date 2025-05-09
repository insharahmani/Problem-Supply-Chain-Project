import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Setup
plt.style.use('ggplot')  # Use a widely available matplotlib style
sns.set_palette('pastel')
plt.rcParams['figure.figsize'] = (10, 6)

# Load data
df = pd.read_csv('supply_chain_extended_data.csv')

# Calculate total lead time as sum of lead time and shipping time
df['Total_Lead_Shipping_Days'] = df['Lead_Time_Days'] + df['Shipping_Time_Days']

# Plotting helper
def plot_hist(column, bins=10, color='skyblue'):
    sns.histplot(df[column].dropna(), bins=bins, kde=True, color=color)
    plt.title(f'Distribution of {column}')
    plt.xlabel(column)
    plt.ylabel('Count')
    plt.tight_layout()
    plt.show()

# Identify numeric columns
numeric_columns = df.select_dtypes(include=['number']).columns.tolist()

# Ensure 'Total_Lead_Shipping_Days' is included if not already
if 'Total_Lead_Shipping_Days' not in numeric_columns:
    numeric_columns.insert(0, 'Total_Lead_Shipping_Days')

# Select up to 10 numeric columns for visualization
columns_to_plot = numeric_columns[:10]

# Create histograms for selected columns
for col in columns_to_plot:
    plot_hist(col)



