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


data = data_long_to_wide()
data_calculate_deltas(data)
