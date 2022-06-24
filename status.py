import pandas as pd


def create_status_column():
    data = pd.read_csv("data/status_ham_vs_bot.csv")
    data["dnf"] = ~data["statusId"].isin([1, 11, 12, 13, 14, 15, 16, 17, 18, 19])
    data.to_csv("hamilton-vs-bottas/status-with-bool-column.csv", index=False)
    print(data)


def status_long_to_wide():
    data = pd.read_csv("hamilton-vs-bottas/status-with-bool-column.csv")
    data = data.pivot(index=["round", "year", "name"], columns="code", values="dnf").reset_index()
    data.to_csv("hamilton-vs-bottas/status-wide.csv", index=False)
    print(data)


create_status_column()
status_long_to_wide()
