
library(DESeq2)
counts <- read.csv("counts_matrix.csv",row.names=1)
counts <- counts[rowSums(counts)>0,]
coldata <- read.csv("metadata.csv",row.names=1)
dds <- DESeqDataSetFromMatrix(countData=counts,colData=coldata,design=~condition)
dds <- estimateSizeFactors(dds)
dispersions(dds) <- rep(0.1,nrow(dds))
dds <- nbinomWaldTest(dds)
res <- results(dds)
write.csv(as.data.frame(res),file="DESeq2_results.csv")
head(res)


