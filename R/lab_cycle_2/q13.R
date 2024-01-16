
  data(mtcars)
  head(mtcars)

  anova_result <- aov(disp ~ gear, data = mtcars)
  summary(anova_result)

  p_value <- summary(anova_result)[[1]]$`Pr(>F)`[1]
  print(paste("P-value for ANOVA test:", p_value))

  if (p_value < 0.05) {
    print("There are significant variations in average displacement across different gear types.")
  } else {
    print("There is no significant variation in average displacement across different gear types.")
  }
