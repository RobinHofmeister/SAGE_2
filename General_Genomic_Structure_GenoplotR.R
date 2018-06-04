library(genoPlotR)



# 1) The following lines produce the alignment of all Bombella and Commensalibacter genomes and represent the synteny across all these genomes.


bbone <- read_mauve_backbone("alignment_all.backbone", ref=2)
name<-c("PacBio-0368", "Bom_368","Bom_378","Bom_380","Bom_385","Bom_387", "Com_392", "Com_379", "Com_390", "Com_382", "Com_367", "Com_366")
names(bbone$dna_segs) <- name

for (i in 1:length(bbone$comparisons)){
  cmp<- bbone$comparisons[[i]]
  abs(cmp$end1- cmp$start1)+ abs(cmp$end2-cmp$start2)
}
plot_gene_map(dna_segs=bbone$dna_segs, comparisons=bbone$comparisons, override_color_schemes = T , global_color_scheme = c("auto","increasing", "red_blue", 0.5))








# 2) the following lines produce the alignment of three genomes and represent only syntenic domains larger than 2.5 kb to better identify the position of those conserved domains.



bbone <- read_mauve_backbone("alignment_reduced.backbone", ref=2, filter_low = 2500)
name<-c("PacBio_284", "Bombella_387","Commensalibacter_392")
names(bbone$dna_segs) <- name

for (i in 1:length(bbone$comparisons)){
  cmp<- bbone$comparisons[[i]]
  abs(cmp$end1- cmp$start1)+ abs(cmp$end2-cmp$start2)
}
plot_gene_map(dna_segs=bbone$dna_segs, comparisons=bbone$comparisons, override_color_schemes = T , global_color_scheme = c("auto","increasing", "red_blue", 0.5), cex.lab=5)
bbone$comparisons
