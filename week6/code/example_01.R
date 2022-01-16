
# brown bears

## 1) identify which positions are SNPs

### read data

data <- read.csv("../data/bears.csv", stringsAsFactors=F, header=F, colClasses=rep("character", 10000))
dim(data)
data[,1]
data[1,(c(1:100))]



### SNPs are positions where you observed more than one allele
### the easiest thing is to loop over all sites and record the ones with two alleles

data[,3]
data[,262]
unique(data[,3])
length(unique(data[,3]))
length(unique(data[,3]))==2
unique(data[,262])
length(unique(data[,262]))
length(unique(data[,262]))==2


snps <- c()
for (i in 1:ncol(data)) {
	if (length(unique(data[,i]))==2){
	  snps <- c(snps, i)
	}
}
### this works to retain the indexes of SNPs; a smartest way would not involve doing a loop but using `apply` functions
cat("\nNumber of SNPs is", length(snps))

### reduce the data set
data <- data[,snps]
dim(data)


## 2) calculate, print and visualise allele frequencies

### alleles in this SNP
alleles <- unique(data[,1])
cat("\nSNP", i, "with alleles", alleles)

## frequencies of the alleles
freq_a1<-length(which(data[,1]==alleles[1]))/nrow(data)
freq_a2<-length(which(data[,1]==alleles[2]))/nrow(data)

### the minor allele is the one in lowest frequency
minor_allele<-alleles[which.min(c(freq_a1,freq_a2))]
freq_minor_allele<-c(freq_a1,freq_a2)[which.min(c(freq_a1,freq_a2))]

cat(" the minor allele is",minor_allele ,"and the minor allele frequency (MAF) is", freq_minor_allele)





### again we can loop over each SNP and easily calculate allele frequencies
frequencies <- c()
for (i in 1:ncol(data)) {

        ### alleles in this SNP
        alleles <- sort(unique(data[,i]))
        cat("\nSNP", i, "with alleles", alleles)
        
        ## frequencies of the alleles
        freq_a1<-length(which(data[,i]==alleles[1]))/nrow(data)
        freq_a2<-length(which(data[,i]==alleles[2]))/nrow(data)
        
        ### the minor allele is the one in lowest frequency
        minor_allele<-alleles[which.min(c(freq_a1,freq_a2))]
        freq_minor_allele<-c(freq_a1,freq_a2)[which.min(c(freq_a1,freq_a2))]

        cat(" the minor allele is",minor_allele ,"and the minor allele frequency (MAF) is", freq_minor_allele)

        frequencies <- c(frequencies, freq_minor_allele)
}
### we can plot is as a histogram
hist(frequencies)
### or simply the frequencies at each position
plot(frequencies, type="h")



