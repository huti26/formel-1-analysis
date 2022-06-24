import pandas as pd


def test_bahrain_2020():
    data = pd.read_csv("data/lap_times_ham_vs_bot_without_dnfs.csv")

    data = data.drop(
        data[
            (data["circuit_name"] != "Bahrain International Circuit")
            |
            (data["year"] != 2020)
            ].index
    )
    print(data)

    data.to_csv("test-data/bahrain-2020.csv", index=False)

    sums = data.groupby(["circuit_name", "year", "code"])["milliseconds"].sum().reset_index()
    print(sums)

test_bahrain_2020()
