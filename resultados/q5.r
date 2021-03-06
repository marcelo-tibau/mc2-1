# Gerar a análise comparativa de qualidade para cada instância entre NSGAII x NSGASE (tabela 3).

rm(list=ls())
setwd("/Users/andrefarzat/Documents/mc2/dados")
DIGIT <- 4

data <- read.table("data_t5-t6.txt", header = TRUE)


for (i in c(0)) {
  instance_name <- paste('I', i, sep="")
  
  subdata <- data[ which(data$config == 'nsga150k2x' & data$inst == instance_name), ]
  
  nsga150k2x <- cbind(
    best = paste(round(mean(subdata$best), digits=DIGIT), "±", round(sd(subdata$best), digits=DIGIT)),
    hv = paste(round(mean(subdata$hv), digits=DIGIT), "±",round(sd(subdata$hv), digits=DIGIT)),
    gd = paste(round(mean(subdata$gd), digits=DIGIT), "±", round(sd(subdata$gd), digits=DIGIT))
  )
  
  # 
  
  subdata <- data[ which(data$config == 'nsga150k2xse' & data$inst == instance_name), ]
  
  nsga150k2xse <- cbind(
    best = paste(round(mean(subdata$best), digits=DIGIT), "±", round(sd(subdata$best), digits=DIGIT)),
    hv = paste(round(mean(subdata$hv), digits=DIGIT), "±",round(sd(subdata$hv), digits=DIGIT)),
    gd = paste(round(mean(subdata$gd), digits=DIGIT), "±", round(sd(subdata$gd), digits=DIGIT))
  )
  
  # result <- matrix(data=c(nsga150k2x, nsga150k2xse), nrow=3, ncol=2)
  
  print(nsga150k2x)
  print(nsga150k2xse)
}
