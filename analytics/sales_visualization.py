import pandas as pd
import matplotlib.pyplot as plt


def load_data():
    return pd.read_csv("sales.csv")


def plot_sales(df):
    plt.figure(figsize=(14, 8))
    plt.bar(df["SaleDate"], df["TotalPremium"])
    plt.xticks(rotation=90)
    plt.title("Daily Premium Volume")
    plt.tight_layout()
    plt.show()


def main():
    df = load_data()
    plot_sales(df)


if __name__ == "__main__":
    main()