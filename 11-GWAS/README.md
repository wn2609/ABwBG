# **Raport z analizy GWAS (Badanie Asocjacji Całogenomowych)**
# Opis metody
**Badanie GWAS** (Genome-Wide Association Study) jest narzędziem umożliwiającym identyfikację związków między wariantami genetycznymi (głównie SNP – polimorfizmy pojedynczych nukleotydów) a różnymi cechami fenotypowymi, w tym podatnością na choroby, cechami fizycznymi czy reakcjami organizmu na leczenie. GWAS ma szerokie zastosowanie w genomice roślinnej, medycynie oraz w analizie różnorodności genetycznej.

**Badanie GWAS** umożliwia:
- lepsze zrozumienie genetycznych podstaw chorób lub cech fenotypowych
- identyfikowanie genów powiązanych z określonymi cechami
- wykrywanie biomarkerów, które mogą mieć zastosowanie w diagnostyce lub doborze terapii

# **1. Instalacja i ładowanie niezbędnych pakietów**

Na początku załadowano pakiety potrzebne do analizy danych genotypowych:
* rrBLUP – analiza związków między genotypami a fenotypami
* BGLR – zaawansowane analiz genotypów
* SNPRelate – analiza danych SNP
* dplyr – manipulacja danymi
* qqman – wizualizacja wyników GWAS
* poolr – analizy statystyczne i obliczenia na danych genotypowych

# **2. Wczytanie danych genotypowych i fenotypowych**

Dane zostały załadowane z plików .ped, .fam i .map, które zawierają dane genotypowe, informacje o próbkach i mapowanie markerów SNP. Sprawdzono zgodność danych, aby upewnić się o ich poprawności.

# **3. Przekodowanie wartości markerów**

Wartości markerów zostały przekodowane w następujący sposób:

- Wartość 2 zamieniono na NA (brakujące dane)
- Wartość 0 zamieniono na 0 (homozygota dla allelu głównego)
- Wartość 1 zamieniono na 1 (heterozygota)
- Wartość 3 zamieniono na 2 (homozygota dla allelu mniejszościowego)

# **4. Przekonwertowanie danych do macierzy**

Dane genotypowe zostały przekształcone w macierz, co ułatwiło dalszą analizę. Transponowanie macierzy pozwoliło na jej odpowiednie uporządkowanie do analizy. Ostateczne wymiary macierzy: 413 osobników, 36901 markerów SNP.

# **5. Wczytanie danych fenotypowych**

Dane fenotypowe, zawierające cechy próbek, zostały załadowane i skorelowane z danymi genotypowymi. Identyfikatory próbek zostały przypisane do odpowiednich wierszy w macierzy genotypowej.

# **6. Kontrola jakości (QC) danych markerów**

Dokonano kontroli jakości danych markerów. Wartości NA zostały zastąpione średnią dla danego markera. Po filtracji markerów (MAP1), usunięto te, które miały niską różnorodność genetyczną (MAF < 5%). W wyniku filtracji zmniejszyła się liczba markerów SNP z 36901 do 36542.

# **7. Analiza PCA**

Wykonano analizę głównych składowych (PCA) w celu oceny różnorodności genotypowej próbek. Wizualizacja wyników PCA ujawniła trzy grupy próbek, które różniły się między sobą, ale były podobne genotypowo.

# **8. Przygotowanie danych do analizy GWAS**

Dane genotypowe i fenotypowe zostały przygotowane do analizy GWAS. Genotypy zostały zorganizowane w tabeli zawierającej informacje o markerach SNP, a dane fenotypowe przypisano do odpowiednich próbek.

# **9. Analiza GWAS**

Przeprowadzono analizę GWAS w celu zidentyfikowania powiązań między wariantami genotypowymi a cechami fenotypowymi. Wyniki pozwoliły na wykrycie markerów SNP, które były statystycznie powiązane z cechami fenotypowymi.

# **10. Identyfikacja istotnych markerów SNP**

Po przeprowadzeniu analizy GWAS wyodrębniono markery SNP, które wykazały statystycznie istotne powiązanie z cechami fenotypowymi. Po filtracji na podstawie wartości p-value (y < 1e-04) wybrano 6 markerów SNP zlokalizowanych na chromosomie 1.

# **11. Wykres Manhattan**

Na końcu stworzono wykres Manhattan, który przedstawia rozmieszczenie markerów SNP na chromosomach i pozwala zobrazować obszary genomu, które wykazują silne powiązanie z analizowaną cechą.


**Podsumowując** analiza **GWAS** pozwoliła na identyfikację markerów genetycznych powiązanych z cechami fenotypowymi. W ramach raportu przeprowadzono następujące etapy:

- Wczytanie i wstępna obróbka danych genotypowych oraz fenotypowych
- Kontrola jakości danych markerów SNP
- Analiza PCA
- Przygotowanie danych do analizy GWAS
- Przeprowadzenie analizy GWAS
- Wyodrębnienie istotnych markerów SNP
- Stworzenie wykresu Manhattan do wizualizacji wyników
