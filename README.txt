The parse_significant_absREL_json script is designed to parse multiple output json files from AbsREL (Smith et al, 2015. doi:10.1093/molbev/msv022)
It returns a data table where field one is the name of the file/gene (this depends on how you've named your input files), field two is the name of the branch under selection (p-value <= 0.05), and the following fields are each set of rate distributions. 

For example, for a branch under selection with three rate distributions, the corresponding output line would be as such: 

name    branch      omega1   percentsites  omega2 percentsites  omega3  percentsites
mygene  branchname  0.04     0.97          1      0.01          100     0.02


In order for the script to work, all json files you desire to parse must be in your set working directory (you can modify this
in the script <setwd("C:/Users/path/to/json/files")>. The program will automatically detect and store the json files as its input and loop through each. 
If the names of your json files are not simply a name followed by .json, for example, if you have something like "name.pal.ABSREL.json"
you should modify the "string <- 'pal.ABSREL.json' " line to reflect your file extension. It is important to note that the file *must* end with ".json" and no other extension (i.e. not ".json.txt").  


The parse_all_absREL_json script will output the omega values and percent of sites under selection for all branches, regardless of whether the p-value was significant. This script is used exactly the same way as parse_significant_absREL_json.
