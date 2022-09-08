# README #

Extensible, vertical framework of and for Bash scripts.

### What is this repository for? ###

* Provides an extensible foundation of 'packages' - a package contains scripts and functions that are targeted for a particular type of work.
* 9.0.1
* [Bash Scripts Framework](https://bitbucket.org/stonefifteen/scripts)

### How do I get set up? ###

* Simply extract the ZIP file provided by the author.
* 1) Add this statement to your .bashrc file: export MASTER_SCRIPTS_HOME=<scripts-root-dir>
* 2) Add this statement to the end of your .bashrc file: [[ -f ${MASTER_SCRIPTS_HOME}/initialize-scripts-framework ]] && . ${MASTER_SCRIPTS_HOME}/initialize-scripts-framework
* 3) Copy the file <scripts-root-dir>/packages/packageTable to your home directory
* 4) Comment out the packages you don't need
* 5) Source the .bashrc file.
*
* Dependends on Bash 4.3+


