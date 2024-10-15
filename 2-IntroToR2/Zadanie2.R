## Zadanie 2: Instalacja i użycie pakietów

**Cel:** Nauka instalowania i używania pakietów w R

### Instrukcje i rozwiązanie:

1.  **Zainstaluj pakiet `ggplot2`.**
  
  ``` r
install.packages("ggplot2")
```

2.  **Załaduj pakiet.**
  
  ``` r
library(ggplot2)
```

3.  **Sprawdź dokumentację pakietu.**
  
  ``` r
?ggplot2
```

4.  **Zainstaluj i załaduj** dodatkowy pakiet, który Cię zainteresuje. Listę pakietów w repozytorium CRAN wraz z opisami znajdziesz tutaj: <https://cran.r-project.org/web/packages/available_packages_by_name.html>
  
  ``` r
install.packages("plotly")
library(plotly)
```

5.  **Napisz krótki opis** w komentarzu.

``` r
# Pakiet 'decode' służy do porównywania ekspresji genów na podstawie p-value.
# Zainteresował mnie, ponieważ umożliwia określenie ekspresji genów selekcyjnie oraz wewnątrz określonego zbioru.
```

6.  **Zapisz skrypt** jako `zadanie2.R` i prześlij go do swojego repozytorium.