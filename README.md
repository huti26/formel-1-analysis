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

- Anstatt Racepace über Track 1,2,3... Racepace von jedem GP, alphabetisch für jedes Jahr
- Punkte jedes Jahr Entwicklung über Track 1,2,3...
