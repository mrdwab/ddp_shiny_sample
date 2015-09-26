# Sample size generator using Shiny

This is an implementation of the `sample.size` function in the "mrdwab/mrdwabmisc" GitHub-only R package. Unlike the main function, this does not vectorize over a range of values, but instead, provides reactive slider-based inputs for all settings except for the input population.

The input population field is non-reactive. You must click on the "Calculate my sample size!" button in order to calculate or recalculate the sample size.
