import pandas as pd

df = pd.read_csv("data.csv")

print(df.head())

print(df["price"].mean())

df.to_csv("output.csv", index=False)