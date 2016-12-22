rev.emp <- read.table("rev_emp.csv", header = T, sep = ",")
df <- rev.emp

rev.exp <- read.table("rev_exp.csv", header = T, sep = ",")
df <- rev.exp


rev.exp <- read.table("emp_budget.csv", header = T, sep = ",")
df <- rev.exp[,1:2]

names(df)
colnames(df) <- c("rev", "exp")

df <- df[df$emplys > 0,]
df <- df[df$budget > 1000,]
df <- df[df$emplys < 40000,]
df <- df[df$rev > 10000,]

model <- lm(emplys~budget, df)

plot(df$emplys, df$budget, col = "blue")
abline(model, col = "red")
abline(1, 1, col = "green")

##

rev1B <- read.table("rev_1B.csv", header = T, sep = ",")
df <- rev1B

exp1B <- read.table("exp_1B.csv", header = T, sep = ",")
df <- exp1B
df <- df[df$total_revenue < 150000,]
df <- df[df$total_revenue > 100000,]

y <- as.matrix(df[,1])
X <- as.matrix(df[ ,2:8])
data <- cbind(y,X)

#y <- (y - mean(y))/sd(y)

for (i in 1:7) { X[,i] <- (X[,i] - mean(X[,i]))/sd(X[,i]) }


fit <- (lm(y~X))

summary(fit)

coefficients(fit) # model coefficients
confint(fit, level=0.95) # CIs for model parameters 
fitted(fit) # predicted values
residuals(fit) # residuals
anova(fit) # anova table 
vcov(fit) # covariance matrix for model parameters 
## influence(fit) # regression diagnostics

# diagnostic plots 
layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
plot(fit)


