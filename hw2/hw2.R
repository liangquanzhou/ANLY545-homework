# ANLY 545-50 hw1
# by Liangquan Zhou

library(tidyverse)
library(magrittr)
library(vcd)
library(vcdExtra)

# Exercise 2.3
ucb <- datasets::UCBAdmissions

# (a)
dimnames(ucb)
ftable(ucb)
prod(dim(ucb))

# (b)
apply(ucb, 3, sum)

# (c)
ftable(Admit ~ Dept, data = ucb) %>%
  prop.table(margin = 1)

# (d)
total <- ftable(Gender ~ Dept, ucb)
admitted <- ucb["Admitted", , ] %>%
  t()
admitted / total
# or
prop.table(ucb, c(3, 2))["Admitted", , ] %>%
  t()

# Exercise 2.5
soccer <- vcd::UKSoccer

# (a)
sum(soccer)

# (b)
home <- margin.table(soccer, 1)
away <- margin.table(soccer, 2)
home
away

# (c)
home %>% prop.table()
away %>% prop.table()

# (d)
plot(home)
plot(away)
