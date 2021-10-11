This script is designed to parse multiple output json files from AbsREL (Smith et al, 2015. doi:10.1093/molbev/msv022)
It returns a data table where field one is the name of the file/gene (this depends on how you've named your input files), field two
is the name of the branch under selection (p-value <= 0.05), and the following fields are each set of rate distributions. 

For example, for a branch under selection with three rate distributions, the corresponding output line would be as such: 

name    branch      omega1   percentsites  omega2 percentsites  omega3  percentsites
mygene  branchname  0.04     0.97          1      0.01          100     0.02


In order for the script to work, all json files you desire to parse must be in your set working directory (you can modify this
in the script. The program will automatically detect and store the json files as its input and loop through each. 

If you wish to turn off the printing of the column names before each new loop iteration, simply change "col.names = TRUE" to "col.names = FALSE" 
in the write.table() function.

