---
title: "LAB 2"
output: html_document
---
```

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r lab2}
#Number 1

file <- "https://github.com/datalorax/esvis/raw/master/data/benchmarks.rda"
load(url(file))
head(benchmarks)
library(tidyverse)

benchmarks <- benchmarks %>%
  as_tibble() %>%
  mutate(wave = case_when(season == "Fall" ~ 0,
                          season == "Winter" ~ 1,
                          TRUE ~ 2))
#Fit a model of the form lm(math ~ wave) for each student.
by_student <- split (benchmarks, benchmarks$sid)
str(by_student)

lm(math~wave, data=benchmarks)
mods <- map(by_student, ~lm(math~wave, data=.x))

##Plot the distribution of slopes. Annotate the plot with a vertical line for the mean
coefs <-map(mods, coef)
coefs [c(1:2, length(coefs))]
slopes <- map_dbl(coefs, 2)
slopes

relation <- tibble(student = names(slopes),
                   slope = slopes)
ggplot(relation, aes(slope)) +
  geom_histogram(fill = "cornflowerblue" ,
                   color = "white")+
  geom_vline(aes(xintercept=mean(slope, na.rm = T)))

```
```{r}
library(repurrrsive)
sw_films
View(sw_species)


sw_films[[1]]$characters[1]
```

