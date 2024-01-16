{
  data(mtcars)
  
  hp <- mtcars$hp
  mpg <- mtcars$mpg
  
  cor_test_result <- cor.test(hp, mpg, method = "pearson")
  
  cat("Pearson correlation coefficient:", cor_test_result$estimate, "\n")
  cat("P-value:", cor_test_result$p.value, "\n")
  
  if (cor_test_result$p.value < 0.05) {
    cat("The correlation is statistically significant.\n")
  } else {
    cat("The correlation is not statistically significant.\n")
  }
  
}