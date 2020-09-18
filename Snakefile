pepbatches,=glob_wildcards("peptides/{batch}.fasta")
iwant = []
iwant.append(expand("blast/{batch}.out", batch =  pepbatches))

rule all:
    input: iwant
        
rule blast:
    input: "peptides/{batch}.fasta"
    output: "blast/{batch}.out"
    shell:
        "blastp -db uniprot_human -query {input} -outfmt '6 std nident salltitles' -evalue 100 -word_size 2 -out {output}"
        

        