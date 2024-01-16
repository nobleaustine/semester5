library(ggplot2)
library(dplyr)

house_prices_data <- read.csv("houseprice.csv")
input <- house_prices_data[,c('LotArea','SalePrice')]

lm_model <- lm(SalePrice ~ LotArea, data <- house_prices_data)

coefficients <- coef(lm_model)
intercept <- coefficients[1]
slope <- coefficients[2]

eqn <- sprintf("Price <- %.2f + %.2f * Size", coefficients[1], coefficients[2])

summary(lm_model)

ggplot(house_prices_data, aes(x <- LotArea, y <- SalePrice)) +
  geom_point() +
  geom_smooth(method <- "lm", formula <- y ~ x, se <- FALSE, color <- "blue") +
  labs(title <- "Price vs Size", x <- "Size (sq ft)", y <- "Price") +
  theme_dark() +
  geom_text(x <- max(house_prices_data$LotArea), y <- max(house_prices_data$SalePrice),
            label <- eqn, hjust <- 1, vjust <- 1, size <- 4{
  # Install and load the igraph package
  install.packages("igraph")
  library(igraph)

  add_edge <- function(graph, v1, v2) {
    graph <- add_edges(graph, c(v1, v2))
    return(graph)
  }

  graph <- make_graph(edges = c(1,2, 1,5 ,5,4 ,4,3 ,3,6 ,3,5 , 5,6 ,2,4), n=6, directed = FALSE)

  print(graph)
  plot(graph)

  g <- add_edge(graph, 1, 6)


  print(g)
  plot(g)

  dfs_traversal <- function(graph, start_vertex) {
    dfs_result <- dfs(graph, start_vertex)
    return(V(graph)[dfs_result$order])
  }

  traversal_order <- dfs_traversal(graph, 1)
  print(traversal_order)

}, color <- "black")