# SchrodingerWrapper

## Invoking the Commandline application
`python3 main.py -h` to see a list of flags available.

## Calling Schrodinger automation routine via the Commandline

Syntax: `python3 main.py -sc -sc_pdb <pdb_folder> -sc_m <mutation_file> -sc_out <out_folder>`

mutation_file: each row contains instruction(s) to mutate a pdb file, with the following syntax: </br>
Example: 272,OH,F,F|272,OH,F,F </br>
Explanation: 272 is the residue number in a pdb file, OH is the atom of residue 272 to be changed, F is the new atom to replace OH for residue 272 and F is the element type for the new atom.

Example: `python3 main.py -sc -sc_pdb pdb_folder -sc_m mutation.txt -sc_out out`

