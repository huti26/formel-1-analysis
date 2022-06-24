import pandas as pd


def create_mean_racepace():
    data = pd.read_csv("data/lap_times_ham_vs_bot_without_dnfs.csv")
    means = data.groupby(["race_name", "circuit_name", "year", "code"])["milliseconds"].mean().reset_index()
    means.to_csv("hamilton-vs-bottas/racepace-means-alphabetical.csv", index=False)
    print(means)


def racepace_long_to_wide():
    data = pd.read_csv("hamilton-vs-bottas/racepace-means-alphabetical.csv")
    data = data.pivot(index=["race_name", "circuit_name", "year"], columns="code", values="milliseconds").reset_index()
    data.to_csv("hamilton-vs-bottas/racepace-means-alphabetical-wide.csv", index=False)
    print(data)


# Outlier Race under Rain
def racepace_remove_spa_2021():
    data = pd.read_csv("hamilton-vs-bottas/racepace-means-alphabetical-wide.csv")
    data = data.drop(data[(data["circuit_name"] == "Circuit de Spa-Francorchamps") & (data["year"] == 2021)].index)
    data.to_csv("hamilton-vs-bottas/racepace-means-alphabetical-wide-without-spa-2021.csv", index=False)
    print(data)


def racepace_calculate_deltas():
    data = pd.read_csv("hamilton-vs-bottas/racepace-means-alphabetical-wide-without-spa-2021.csv")
    data["delta"] = data["BOT"] - data["HAM"]
    data.to_csv("hamilton-vs-bottas/racepace-means-alphabetical-wide-without-spa-with-deltas.csv", index=False)
    print(data)


create_mean_racepace()
racepace_long_to_wide()
racepace_remove_spa_2021()
racepace_calculate_deltas()
