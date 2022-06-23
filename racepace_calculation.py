import pandas as pd


def create_mean_racepace():
    data = pd.read_csv("data/lap_times_ham_vs_bot.csv")

    means = data.groupby(["races_round", "races_year", "driver_code"])["milliseconds"].mean().reset_index()

    means.to_csv("hamilton-vs-bottas/racepace-means.csv", index=False)

    print(means)


def racepace_wide_to_long():
    data = pd.read_csv("hamilton-vs-bottas/racepace-means.csv")
    data = data.pivot(index=["races_round", "races_year"], columns="driver_code", values="milliseconds").reset_index()
    data.to_csv("hamilton-vs-bottas/racepace-means-wide.csv", index=False)
    print(data)


def racepace_calculate_deltas():
    data = pd.read_csv("hamilton-vs-bottas/racepace-means-wide.csv")
    data["delta"] = data["BOT"] - data["HAM"]
    data.to_csv("hamilton-vs-bottas/racepace-means-wide-with-deltas.csv", index=False)
    print(data)


def racepace_deltas_per_year():
    data = pd.read_csv("hamilton-vs-bottas/racepace-means-wide-with-deltas.csv")
    data = data.groupby("races_year")["delta"].mean().reset_index()
    data.to_csv("hamilton-vs-bottas/racepace-delta-means-per-year.csv", index=False)
    print(data)


# create_mean_racepace()
# racepace_wide_to_long()
# racepace_calculate_deltas()
racepace_deltas_per_year()
