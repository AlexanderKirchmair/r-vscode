
library(ggplot2)

df <- data.frame(
  x = rnorm(50),
  y = rnorm(50),
  category = sample(c("A", "B"), 50, replace = TRUE)
)

rand_shape <- function(n = 5, r = 1) {
  theta <- seq(0, 2*pi, length.out = n+1)[-1]
  x <- r*cos(theta) + rnorm(n, mean = 0, sd = 0.2*r)
  y <- r*sin(theta) + rnorm(n, mean = 0, sd = 0.2*r)
  return(data.frame(x = x, y = y))
}

shapes <- lapply(unique(df$category), function(cat) {
  rand_shape(n = sample(3:8, 1), r = runif(1, 0.5, 1.5))
})
names(shapes) <- unique(df$category)

ggplot(df, aes(x = x, y = y, fill = "category")) +
  geom_point(size = 3, shape = 21) +
  scale_fill_manual(values = c("orange", "skyblue")) +
  theme(legend.position = "none") +
  geom_polygon(data = shapes[["A"]], alpha = 0.5, color = "white") +
  geom_polygon(data = shapes[["B"]], alpha = 0.5, color = "white")


