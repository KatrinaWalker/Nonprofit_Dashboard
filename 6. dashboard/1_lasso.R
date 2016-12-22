library(glmnet)

lasso <- read.csv("mv_lasso.csv", header = T, sep = ",")
df <- lasso
groups <- as.vector(unique(df$groups))

lasso.S <- df[df$tot_rev <= 1e6,]
lasso.M <- df[df$tot_rev <= 1e8,]
lasso.M <- lasso.M[lasso.M$tot_rev > 1e6,]
lasso.L <- df[df$tot_rev > 1e8,]

lasso.S.type <- list()
lasso.M.type <- list()
lasso.L.type <- list()

for (g in 1:12) {
  lasso.S.type[[g]] <- list(lasso.S[lasso.S$groups == groups[g],])
  lasso.M.type[[g]] <- list(lasso.M[lasso.M$groups == groups[g],])
  lasso.L.type[[g]] <- list(lasso.L[lasso.L$groups == groups[g],])
}

fit.S <- list()
fit.M <- list()
fit.L <- list()

for (g in 1:12) {
  temp <- as.matrix(lasso.S.type[[g]][[1]])
  if (nrow(temp) < 60){
    N <- abs(nrow(temp)/3)}
    else {N <- 20
  }
  x <- as.matrix(cbind(temp[,3:15], temp[,17:21]))
  y <- as.matrix(cbind(temp[,2:2]))
  cv <- cv.glmnet(x, y)
  fit.S[[g]] <- glmnet(x, y, lambda = cv$lambda.1se)
  
  temp <- as.matrix(lasso.M.type[[g]][[1]])
  if (nrow(temp) < 60){
    N <- abs(nrow(temp)/3)}
  else {N <- 20
  }
  x <- as.matrix(cbind(temp[,3:15], temp[,17:21]))
  y <- as.vector(temp[,2])
  cv <- cv.glmnet(x, y)
  fit.M[[g]] <- glmnet(x, y, lambda = cv$lambda.1se)
  
  temp <- as.matrix(lasso.L.type[[g]][[1]])
  if (nrow(temp) < 60){
    N <- abs(nrow(temp)/3)}
  else {N <- 20
  }
  x <- as.matrix(cbind(temp[,3:15], temp[,17:21]))
  y <- as.vector(temp[,2])
  cv <- cv.glmnet(x, y)
  fit.L[[g]] <- glmnet(x, y, lambda = cv$lambda.1se)
}

