import pandas as pd


def create_mean_racepace():
    data = pd.read_csv("data/lap_times_ham_vs_bot_without_dnfs.csv")
    means = data.groupby(["round", "year", "code"])["milliseconds"].mean().reset_index()
    means.to_csv("hamilton-vs-bottas/racepace-means-without-dnfs.csv", index=False)
    print(means)


def racepace_wide_to_long():
    data = pd.read_csv("hamilton-vs-bottas/racepace-means-without-dnfs.csv")
    data = data.pivot(index=["round", "year"], columns="code", values="milliseconds").reset_index()
    data.to_csv("hamilton-vs-bottas/racepace-means-wide-without-dnfs.csv", index=False)
    print(data)


# Outlier Race under Rain
def racepace_remove_spa_2021():
    data = pd.read_csv("hamilton-vs-bottas/racepace-means-wide-without-dnfs.csv")
    data = data.drop(data[(data["round"] == 12) & (data["year"] == 2021)].index)
    data.to_csv("hamilton-vs-bottas/racepace-means-wide-without-dnfs-without-spa-2021.csv", index=False)
    print(data)


def racepace_calculate_deltas():
    data = pd.read_csv("hamilton-vs-bottas/racepace-means-wide-without-dnfs-without-spa-2021.csv")
    data["delta"] = data["BOT"] - data["HAM"]
    data.to_csv("hamilton-vs-bottas/racepace-means-wide-with-deltas-without-dnfs-without-spa-2021.csv", index=False)
    print(data)


def racepace_deltas_per_year():
    data = pd.read_csv("hamilton-vs-bottas/racepace-means-wide-with-deltas-without-dnfs-without-spa-2021.csv")
    data = data.groupby("year")["delta"].mean().reset_index()
    data.to_csv("hamilton-vs-bottas/racepace-delta-means-per-year-without-dnfs-without-spa-2021.csv", index=False)
    print(data)


create_mean_racepace()
racepace_wide_to_long()
racepace_remove_spa_2021()
racepace_calculate_deltas()
racepace_deltas_per_year()
