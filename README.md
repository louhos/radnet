### radnet - R interface to avoindata.net (RESTful) API

[avoindata.net](http://avoindata.net/) is a Finnish Q&A forum that exposes much of the content and user activity through an [API](http://avoindata.net/dashboard/api/v1/) (in Finnish).

Please note that the API is still under development and may go though changes.
So far the following API GET methods are implemented:  

1. Tagit ja niiden kysymysmäärät
2. Yhden tagin 10 viimeisintä kysymystä (haku nimellä)
3. Yhden tagin 10 viimeisintä kysymystä (haku ID:llä)
4. Kategoriat ja niiden kysymysmäärät
5. Yhden kategorian kysymykset (haku ID:llä)
6. Vastausmäärät päivän tarkkuudella
7. Kysymysmäärät päivän tarkkuudella
8. Yhden kuukauden kysymykset
9. Tietyn vuoden yhden kuukauden kysymykset
10. Palvelun käyttäjät
11. Yhden käyttäjän (haku ID:llä) kysymykset

### Install

For installing radnet you need [devtools](https://github.com/hadley/devtools).

```
install_github('radnet', 'louhos')
```
