#

## Data Transformations

- relational csv data in `f1` folder from OG source
- imported into sqlite
- ham vs bot version created in `data` folder with SQL
- further transformations with pandas in `hamilton-vs-bottas`
- racepace per track visualized with ggplot
- two outliers -> 2021 2: Emilia Romagna Grand Prix & 2021 12: Belgian Grand Prixs
- https://en.wikipedia.org/wiki/2021_Emilia_Romagna_Grand_Prix -> Bottas crashed, Hamilton got 2nd
- https://en.wikipedia.org/wiki/2021_Belgian_Grand_Prix -> Race under safety car and aborted
- DNFs removed -> Spa 2021 still in there
- Spa 2021 removed
- Bottas Outliers
  - https://en.wikipedia.org/wiki/2021_Turkish_Grand_Prix

## DNFs

- results für bot und ham = 201
- results status != 1 -> 17

## To Do

- Static BLog erstellen

  - Vorwort -> Warum gemacht?
  - Woher Quelle der Daten?
  - Eingeklappt: Link zu GitHub + Datentransformationen
  - Datenanalyse

- Chronologisch -> Gucken ob HAM aufdreht am Ende -> connected dots deswegen
- Alphabetisch -> Gucken ob bestimmter Track gut für X -> bars deswegen
- Punkte -> Berücksichtigen, ob BOT am Titelkampf beteiligt war (2018, 2021?), wegen Team Orders
- Chronologisch -> Wann DNFs? -> Unglückliche Strecken für Bottas 5 11 20
- Berücksichtigen ab wann Titel fest war -> vline trotz facet_grid möglich?
- bbc source
- ggsave als pdf sinnvoll? damit man source anklicken kann?

## Notes

- Bahrain 2020 GP 2 Mal -> wenn man nur nach circuit_name und nicht gp_name grouped falsche ergebnisse
- data folder daten aus sql exportiert
- Kein DNF, aber Werte fehlen
  - 2021
    - 12 -> Spa
    - 18 -> usa beide status 1 -> 19 wäre aber mexico bei dem bot 11 als status (+1 lap) & das ist ploted -> 18 2.6 sec außerhalb des geploteten
  - 2020
    - 14 -> 2.x sec außerhalb des geploteten
    - 16 keine zeit für HAM -> sakhir gp, HAM hatte covid
    - 18? 19? -> covid ende früh
  - 2019 12 -> außerhalb gewesen
  - 2018 8 außerhalb, 19 da
  - 2017 18 außerhalb
- Statuscodes 11-19 (gibt noch wildere) -> Kein DNF, nur +X laps (Wenn HAM +1 Lap ist und VER race finished, dann ist hamiltons race 1 lap kürzer)
