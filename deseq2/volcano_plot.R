library(ggplot2)

res <- read.csv("DESeq2_results.csv", row.names=1)

res <- res[complete.cases(res), ]

png("volcanoPlot.png", width=900,height=700)
ggplot(res, aes(x=log2FoldChange, y=-log10(pvalue))) +
geom_point(color="steelblue") +
theme_minimal() +
xlab("Log2 Fold Change") +
ylab("-Log10(P-value)") +
ggtitle("volcano Plot")

dev.off()
