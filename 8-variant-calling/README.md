# Analiza z użyciem narzędzia Variant-calling

# Wprowadzenie
Wykrywanie wariantów (variant calling) to proces identyfikacji zmian w sekwencjach DNA, zwanych wariantami, polegający na porównaniu sekwencji genomu badanego organizmu z genomem referencyjnym. Warianty mogą obejmować insercje, delecje, zamiany pojedynczych nukleotydów, jak również zmiany strukturalne, takie jak zmiany liczby kopii fragmentów DNA, transpozycje lub odwrócenie orientacji fragmentów DNA w obrębie chromosomów. Proces ten jest kluczowy w badaniach genomowych i stanowi podstawę do:
- zgłębiania genetycznych przyczyn chorób
- identyfikacji mutacji odpowiadających za cechy fenotypowe
- analizy różnorodności genetycznej w populacjach
- badań ewolucyjnych

# 1. Instalacja i ładowanie niezbędnych pakietów

Na początku procesu instalowane i ładowane są pakiety niezbędne do analizy danych genomowych:

- `VariantTools` – analiza wariantów
- `Rsamtools` – praca z plikami BAM i FASTA
- GenomicRanges – operacje na zakresach genomowych
- GenomicFeatures – zarządzanie cechami genomu
- VariantAnnotation – adnotacje wariantów
- BiocParallel – obsługa obliczeń równoległych

# 2. Konfiguracja środowiska roboczego

Ustawienie katalogu roboczego przy pomocy funkcji setwd pozwala na łatwe zarządzanie plikami wejściowymi oraz wyjściowymi. Funkcja list.files() jest używana do sprawdzenia dostępnych plików w aktualnym katalogu.

# 3. Wczytanie danych wejściowych

**3.1 Plik BAM**
Plik BAM (aligned_sample1.BAM) zawierający wyrównane odczyty sekwencyjne jest wczytywany za pomocą funkcji BamFile().

**3.2 Genom referencyjny**
Genom referencyjny w formacie FASTA (ecoli_reference1.fasta) jest ładowany za pomocą funkcji FaFile().

# 4. Sortowanie i indeksowanie plików BAM oraz FASTA

**4.1 Sortowanie plików BAM**
Za pomocą funkcji sortBam() plik BAM jest sortowany według współrzędnych, co ułatwia dalsze indeksowanie i analizę danych.

**4.2 Indeksowanie plików FASTA i BAM**
Funkcje indexFa() oraz indexBam() indeksują odpowiednio pliki FASTA i BAM, umożliwiając szybki dostęp do danych w trakcie analizy.

# 5. Kontrola jakości danych sekwencyjnych

Kontrola jakości jest niezbędna, aby mieć pewność, że analiza wariantów będzie opierała się na wiarygodnych danych.

**5.1 Nagłówek pliku BAM**
Funkcja scanBamHeader() umożliwia odczyt metadanych pliku BAM i pozwala na weryfikację poprawności jego struktury.

**5.2 Statystyki BAM**
Za pomocą idxstatsBam() generowane są podstawowe statystyki, w tym liczba odczytów przypisanych do sekwencji w genomie:

Zmapowane odczyty: 713927
Odczyty niezmapowane: 506059

**5.3 Pokrycie genomu**
Funkcja coverage() oblicza pokrycie genomu, czyli liczbę odczytów przypadających na każdą pozycję w genomie. Wizualizacja za pomocą plot(coverage_data) pozwala na ocenę jakości pokrycia. Regiony o wysokim pokryciu mogą wskazywać na artefakty lub sekwencje powtarzalne, a niskie pokrycie może oznaczać problemy z sekwencjonowaniem.

# 6. Wykrywanie wariantów

**6.1 Pileup**
Funkcja pileup() generuje dane dotyczące liczby odczytów dla każdej pozycji w genomie, z uwzględnieniem minimalnej jakości bazy oraz ignorowaniem podziału na nici DNA.

**6.2 Konwersja wyników do ramki danych**
Dane z funkcji pileup() są przekształcane do ramki danych, a następnie przetwarzane za pomocą pakietu dplyr. Dodawane są również informacje o nazwach sekwencji i danych referencyjnych.

**6.3 Obliczanie prawdopodobnych wariantów**
Na podstawie liczby odczytów dla każdego nukleotydu, stosując filtry minimalnej liczby odczytów (≥ 5) oraz proporcji odczytów alternatywnych (≥ 20%), identyfikowane są prawdopodobne warianty, eliminując szumy techniczne.

# 7. Filtracja i eksport wyników

Filtracja wariantów zapewnia, że w końcowych wynikach znajdują się tylko wiarygodne zmiany genetyczne. Kryteria filtracji to:
- Liczba odczytów dla danej pozycji (≥ 10)
- Proporcja odczytów alternatywnych (≥ 20%)
Eksport wyników do **pliku CSV** umożliwia dalszą analizę za pomocą innych narzędzi.

# Podsumowanie

Kod przeprowadza kompleksową analizę wariantów genetycznych, obejmującą:
- Wczytanie danych i ich wstępną obróbkę (sortowanie i indeksowanie)
- Kontrolę jakości danych sekwencyjnych
- Wykrywanie wariantów z użyciem funkcji pileup
- Filtrację prawdopodobnych wariantów
- Eksport wyników do pliku CSV
