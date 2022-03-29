library(tidyverse)
#first set the path to where the eigenvec and eigenval files are located
pca <- read_table("candida.eigenvec", col_names = FALSE)
eigenval <- scan("candida.eigenval")
pca <- pca[,-1]
names(pca)[1] <- "ind"
names(pca)[2:ncol(pca)] <- paste0("PC", 1:(ncol(pca)-1))
pve <- data.frame(PC = 1:20, pve = eigenval/sum(eigenval)*100)

#plotting a bar graph to show percentage of variance  each principal component explains
a <- ggplot(pve, aes(PC, pve)) + geom_bar(stat = "identity")
a + ylab("Percentage variance explained") + theme_light()

#PCA plot
b <- ggplot(pca, aes(PC1, PC2,)) + geom_point()
b <- b + coord_equal()+theme_light()+geom_text(aes(label=pca$ind),check_overlap=TRUE)
b + xlab(paste0("PC1 (", signif(pve$pve[1], 3), "%)")) + ylab(paste0("PC2 (", signif(pve$pve[2], 3), "%)"))
