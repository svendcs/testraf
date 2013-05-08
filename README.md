Testraf
=======
Everybody knows that the giraffe is superior to the walrus. The king of the animals, the giraffe, has therefore come to your aid in testing solutions for informatics competitions. 

Install using `gem install testraf`

Currently only tested on Ubuntu 12.04

## Usage

Testraf is run using the `testraf` command. The command scans the working directory for input and output file pairs with names `*.in` and `*.out`. 

The expected output is in the output file and the input is contained in the input file. Simply run testraf with the command to run your solution, then the input data will be piped into the standard input of your program. By reading from the standard output, testraf will then examine the generated output.

## Options
The `testraf` command currently has the following options:
`-c`: Continue running the next test even if a previous test has already failed. 

## Screenshots
![](https://dl.dropboxusercontent.com/u/837207/screenshot1.png)
![](https://dl.dropboxusercontent.com/u/837207/screenshot2.png)

## Planned
* Nothing - Deal with it!
