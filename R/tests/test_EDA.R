# Test for EDA fuction
source("R/EDA.R")
library(testthat)

# Passing a dataset url to our fuction of read_dataset
x <- read_dataset("https://raw.githubusercontent.com/abheetkansal/Dataset/main/crimedata_csv_AllNeighbourhoods_2022.csv", "R/tests/test_Dataset.csv")

# Passing the url dataset locally to y dataframe for comparison
y <- read.csv("R/tests/test_comparison.csv")


# Test for read_dataset
testthat::expect_equal(x,y)

test_df <- data.frame(col1 = c(1, 2, 3),
                      col2 = c(4, 5, 6),
                      col3 = c(7, 8, 9))


# Running EDA function for testing
eda_df <- EDA(test_df, select_cols = c("col1", "col2"), col1 > 1, col2 > 5)
expected_rows <- data.frame(col1 = 3, col2 = 6)

eda_df_2 <- EDA(test_df, select_cols = c("col1", "col2"))
expected_cols <- c("col1", "col2")

# Tests for EDA function
testthat::expect_equal(eda_df, expected_rows)
testthat::expect_equal(colnames(eda_df_2), expected_cols)
