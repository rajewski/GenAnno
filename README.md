collection of scripts to functionally annotate a genome.

This starts with the cannabis sative genome as a fun starter, but will eventually be applied to the N. obtusfiloia genome

This workflow starts with Run.FA.sh, but I believe that most of this can be skipped for a genome where genes are already identified (for example with MAKER or Augustus). 

Next this workflow begins functional annotation using a number of databases. The problem here is that the genome has a huge number of predicted proteins. The Run_FA_anno.sh was diesnted to run all of these analysis together but the number of proteins preventted this. The number doesn't pose a significant problem for many of the database tools, BUT it is a huge problem for IPRScan. I tried to run IPRScan on the entire genome s part of Run_FA_anno,and it will take weeks. Instead I split the fasta file of all proteins up into chunks of about 5000 proteins and ran a separate IPRScan script (Run_iprscan.sh) to do this. Problematiclly, Funannotate reads not the GFF output, but rather the XML output. This meant that the separate XML files for each chunk needed to be cleaned. Naively I used cat to combine all of the files, and then used grep to remove the first two lines and the last line from each sub file (grep -v "xml " | grep -v "protein-matches"). I then added back this text to just the beginning and end of the combined file. This larger XML files was then fed into Run_FA_anno.sh. In the future, I will make this step automatic; however I was just learning how to script and so many of my solutions are kludges...

