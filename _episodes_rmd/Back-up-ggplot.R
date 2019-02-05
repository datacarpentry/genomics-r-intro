
library(vcfR)
library(pinfsc50)
library(reshape2)
library(ggplot2)
# Find and input VCF
# Find and input VCF
vcf <- system.file('extdata','pinf_sc50.vcf.gz',package = 'pinfsc50')
vcf <- vcfR::read.vcfR(vcf, verbose = FALSE)
# Parse DP from the gt 
dp <- data.frame(extract.gt(vcf, element='DP', as.numeric = TRUE))
# Reorganize and render violin 
dpf <- melt(dp, varnames=c('Index', 'Sample'),value.name = 'Depth', na.rm=TRUE)
dpf2 <- dp %>% gather(depth,na.rm=TRUE) %>% filter(depth > 0)

dpf <- dpf[ dpf$Depth > 0,]
dpf2 <- dp %>% gather(Sample,Depth,na.rm=TRUE) %>% filter(Depth > 0)

p <- ggplot(dpf2, aes(x=Sample, y=Depth)) +geom_violin(fill='#C0C0C0', adjust=1.0,scale = 'count', trim=TRUE)
p <- p + theme_bw()
p <- p + ylab('Read Depth (DP)')
p <- p + theme(axis.title.x = element_blank(),axis.text.x = element_text(angle = 60, hjust = 1))
p <- p + stat_summary(fun.data=mean_sdl,geom='pointrange', color='black')
p <- p + scale_y_continuous(trans=scales::log2_trans(),breaks=c(1, 10, 100, 1000))
p                          
