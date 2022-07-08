import pandas as pd
import numpy as np


def data_long_to_wide():
    data = pd.read_csv("data/pit_stops.csv")
    data = data.pivot(index=["stop", "round", "year"], columns="code", values="milliseconds").reset_index()
    print(data)
    return data


def data_calculate_deltas(data):
    data = data.fillna(0)
    data["delta"] = (data["HAM"] - data["BOT"] - data["VER"] - data["VET"]) * -1
    data = data.replace(0, np.nan)
    print(data)
    data.to_csv("hamilton-vs-bottas/pit_stops_deltas.csv", index=False)


def data_calculate_delta_mean():
    data = pd.read_csv("hamilton-vs-bottas/pit_stops_deltas.csv")

    # Filter out outliers
    data = data[(data["delta"] < 4000) & (data["delta"] > -4000)]

    data = data.groupby(["year"])["delta"].mean().reset_index()

    print(data)


def data_count_delta_mean():
    data = pd.read_csv("hamilton-vs-bottas/pit_stops_deltas.csv")

    # Filter out outliers
    data = data[(data["delta"] < 4000) & (data["delta"] > -4000)]
    data["ham_faster"] = data["delta"] > 0

    data = data.pivot_table(index=["year"], columns="ham_faster", aggfunc='size', fill_value=0)
    print(data)


# data = data_long_to_wide()
# data_calculate_deltas(data)
# data_calculate_delta_mean()
data_count_delta_mean()
