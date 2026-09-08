import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("ecommerce_sales_cleaned.csv", parse_dates=["Order Date"])

print("Shape:", df.shape)
print("\nMissing values:\n", df.isna().sum())
print("\nDuplicate rows:", df.duplicated().sum())

print("\nKPIs")
print("Total Sales:", df["Sales"].sum())
print("Total Profit:", df["Profit"].sum())
print("Total Orders:", df["Order ID"].nunique())
print("Total Quantity:", df["Quantity"].sum())
print("Average Order Value:", df["Sales"].sum()/df["Order ID"].nunique())
print("Profit Margin:", df["Profit"].sum()/df["Sales"].sum())

category = df.groupby("Category")[["Sales","Profit"]].sum().sort_values("Sales", ascending=False)
print("\nCategory analysis:\n", category)

monthly = df.groupby(df["Order Date"].dt.to_period("M"))["Sales"].sum()
print("\nMonthly sales:\n", monthly)

# Example visualization
monthly.plot(kind="line", marker="o", title="Monthly Sales Trend")
plt.xlabel("Month")
plt.ylabel("Sales")
plt.tight_layout()
plt.show()
