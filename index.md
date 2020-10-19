---
title       : Guess the Regression
subtitle    : Data Products Week 4 Assignment
author      : Justin McMullen
job         : 
framework   : io2012   # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---



## What is this App about?

Linear regression is a powerful data analysis tool, but it can be confusing for new users.  This App allows a user to "play" with a simulated example to understand what changing the slope and intercept terms does to a regression line.

## How does it work?

- Launch the App on https://mcjustin.shinyapps.io/Wk4Pjt-RegressionGuess/
- Generate some data with a button click
- Input your guessed coefficients
- Show the answer when you're ready

---

## Linear Regression

Linear Regression fits data to the model: y = slope*x + b

Example: With a slope of 2, and an intercept of 1, the following data is generated when the numbers 1-10 are input as x


```r
x <- 1:10
slope <- 2
intercept <- 1

y<- slope * x + 1
y
```

```
##  [1]  3  5  7  9 11 13 15 17 19 21
```

---

## Take home

Linear regression is an important data analysis tool and now you can play with it on your own.

![plot of chunk unnamed-chunk-3](assets/fig/unnamed-chunk-3-1.png)

---

## Thank you








