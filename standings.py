import pandas as pd


def standings_long_to_wide():
    data = pd.read_csv("data/standings_ham_vs_bot.csv")
    data = data.pivot(index=["round", "year"], columns="code", values="points").reset_index()
    data.to_csv("hamilton-vs-bottas/standings-wide.csv", index=False)
    print(data)


standings_long_to_wide()
