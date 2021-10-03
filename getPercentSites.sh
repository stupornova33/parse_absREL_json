#!/bin/bash
#R version 3.5.1 (2018-07-02) -- "Feather Spray"
# this script requires the file "writeoutput" be in the same directory
# takes a file of gene names and branch ids from parsed_absrel_json.txt and returns percent of sites under selection for each branch
# make executable with <chmod +x> and run by <./getPercentSites.sh>


while read -r gene branchid
do 
# get the gene name from the input file
	echo "$gene"
# get the branch id from the input file
	echo "$branchid"
# get the string to be replaced (the branch name) from the json file	
	echo "output <- simplejson\$\`branch attributes\`\$\`0\`\$transcript\$\`Rate Distributions\`" > simplejson.txt
	sed -i "s/transcript/$branchid/1" simplejson.txt
# print the line defining the new file name into a file
	echo "simplejson <- jsonlite::fromJSON('.pal.ABSREL.json.txt')" > tmpcatfile
	echo "tmpcatfile made"
	sed -i "s/.pal.ABSREL.json.txt/$gene.pal.ABSREL.json.txt/1" tmpcatfile
	echo "input file renamed"
# concatenate the new file name and script
	echo "$gene" > genename
cat tmpcatfile simplejson.txt writeoutput > parse_results.sh
	echo "new parse_results script made"
	rm tmpcatfile simplejson.txt 
	mv parse_results.sh "$gene".parse_results.sh
# run the script	
	Rscript "$gene".parse_results.sh
done < parsed_absrel_json.txt

	

