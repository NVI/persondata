# persondata
Tools for dealing with Wikipedia's Persondata metadata.

Process:

1. Download most recent Wikipedia data dump
1. Decompress the dump and grep for "Persondata" with 10 lines after match (even 7 lines might suffice)
1. Run the parse script with grep output as input
1. Load the parse output into R with main.R
