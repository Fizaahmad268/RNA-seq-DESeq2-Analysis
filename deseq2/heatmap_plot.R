
library(pheatmap)

counts <- read.csv("counts_matrix.csv", row.names=1)

counts <- counts[rowSums(counts)>0,]

log_counts <- log2(counts + 1)

png("Heatmap.png", width=900, height=900)

pheatmap(log_counts[1:50,],
cluster_rows=TRUE,
cluster_cols=TRUE,
show_rownames=FALSE,
main="Top 50 Expressed Genes")

dev.off()
