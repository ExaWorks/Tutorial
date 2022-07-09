<img src="https://exaworks.org/images/exaworks-name.png" width="250" />

# Tutorial

This tutorial addresses key challenges in the creation of diverse workflows that are portable, repeatable, and performant. We present the [ExaWorks](https://exaworks.org) SDK, and its constituent components: [Parsl](https://parsl-project.org/), [RADICAL-Cybertools](https://radical-cybertools.github.io/) (RCT), [Swift/T](https://swift-lang.github.io/swift-t/guide.html), and [Flux](http://flux-framework.org/). These components are widely used, and available tools for developing workflow applications. This tutorial outlines modern workflow motifs on HPC platforms (e.g., ensemble campaigns, ML-in-the-loop), illustrates science examples of these motifs, and discusses solutions using the ExaWorks SDK.

## Overview

We first introduce the ExaWorks component tools and explain their key capabilities. Through common workflow motifs and their instantiation, we  describe common challenges and best-practices for developing and deploying HPC workflows.

- [Presentation](https://github.com/ExaWorks/Tutorial/blob/main/presentations/01-introduction.pdf)

## AWS Instances

```
Logging in:  ssh -v developer@<ipaddr>
password:    m6a.}Ge-N^?$&8bn
```
ID | IP | User |
---|----|------|
1 | 3.21.204.204 |
2 | 3.21.122.117 |
3 | 3.15.153.65 | 
4 | 3.145.25.225 | 
5 | 3.145.214.192 | 
6 | 3.145.160.119 | 
7 | 3.145.120.110 | 
8 | 3.144.179.117 | 
9 | 3.143.144.45 | 
10 | 3.142.142.38 | 
11 | 3.137.191.101 | 
12 | 18.223.156.156 | 
13 | 18.222.229.113 | 
14 | 18.222.217.193 | 
15 | 18.221.238.9 | 
16 | 18.220.64.55 | 
17 | 18.219.138.59 | 
18 | 18.217.182.168 | 
19 | 18.216.158.156 | 
20 | 18.191.214.30 | 
21 | 18.191.10.243 | 
22 | 18.188.255.40 | 
23 | 18.117.97.125 | 
24 | 18.117.246.104 | 
25 | 18.117.191.159 | 
26 | 13.59.240.75 | Rafael


## Writing Ensemble Applications with RCT

- [Presentation](https://github.com/ExaWorks/Tutorial/blob/main/presentations/02-rct.pdf)

- Preparing the environment:

```sh
cd $HOME/tutorial/
.  1-ensemble-rct.env
cd 1-ensemble-rct
make clean
```

- The tutorial folder has the following content:
```sh
makefile                 - provides 'make clean' to reset folder
orig                     - backup of original files
radical_entk_1.py        - first tutorial example
solution_1.1.py            - solution to first exercise
solution_1.2.py            - solution to second exercise
solution_1.3.py            - solution to second exercise
radical_entk_2.py        - second tutorial example
solution_2.1.py            - solution to first exercise
```

## Swift/T Workflow Tutorial

- [Presentation](https://github.com/ExaWorks/Tutorial/blob/main/presentations/03-swift-t.pdf)
- [Workflow Scripts](https://github.com/ExaWorks/SC21-Tutorial/tree/main/2-workflow-dl-swift)

- Documentation
    - [Swift/T Home Page](http://swift-lang.org/Swift-T)
    - [Swift/T Guide (installation, language, etc.)](https://swift-lang.github.io/swift-t/guide.html)
    - [Swift/T Sites Guide (running on scheduled systems)](https://swift-lang.github.io/swift-t/sites.html)

- Simple checkout, setup, example 01

```sh
$ cd ~/tutorial/2-workflow-dl-swift
$ git pull
$ source ~/tutorial/2-workflow-dl-swift/2-workflow-dl-swift/swift_demo.env
# May produce warnings about Conda, ignore them
$ cd ~/tutorial/2-workflow-dl-swift/2-workflow-dl-swift
```

- Quick use example
```sh
$ swift-t -E 'trace(42);'
trace: 42

$ ls
01-hello  02-loop  03-dag 04-py  05-numpy
$ cd 01-hello
$ cat hello.swift  

/**
  Example 1 - HELLO.SWIFT
*/

import io;
printf("Hello world!");

$ swift-t hello.swift 
```

- Setup
```
$ swift-t -v
STC: Swift-Turbine Compiler 0.9.0
         for Turbine: 1.3.0
Using Java VM:    /usr/bin/java
Using Turbine in: /home/developer/Public/sfw/swift-t/turbine

Turbine 1.3.0
 installed:    /home/developer/Public/sfw/swift-t/turbine
 source:       /home/developer/woz/swift-t/turbine/code
 using CC:     /usr/lib64/openmpi/bin/mpicc
 using MPI:    /usr/lib64/openmpi/lib mpi "OpenMPI"
 using Tcl:    /home/developer/Public/sfw/Anaconda3/bin/tclsh8.6
 using Python: /home/developer/Public/sfw/Anaconda3/lib python3.8
```

- Examples 02, 03, 04, 05

```sh
# 02-loop
$ ./run.sh -n 8 loop.swift

# 03-dag
$ ./run.sh

# 04-numpy
$ swift-t add.swift

# 05-numpy 
$ swift-t numpy.swift
```

- CANDLE/Supervisor example

```sh
$ git clone https://github.com/ECP-CANDLE/Benchmarks.git
$ cd Benchmarks
$ git checkout develop
$ cd ..
$ git clone https://github.com/ECP-CANDLE/Supervisor.git
$ cd Supervisor
$ git checkout develop
$ cd ..

# Run setup script
$ SC21-Tutorial/swift-t/candle-setup.sh path/to/Benchmarks

# Add Python:
$ PATH=/home/developer/Public/sfw/Anaconda3:$PATH

$ cd Benchmarks/Pilot1/NT3
$ nice python3 nt3_baseline_keras2.py

# UPF: Unrolled Parameter File (simple list of hyperparameters to run)
$ cd Supervisor/workflows/upf
$ nice test/upf-1.sh nt3 local
```

## Writing Model-in-the-Loop Applications with Parsl

- [Presentation](https://github.com/ExaWorks/Tutorial/blob/main/presentations/04-parsl.pdf)

- Instructions (as a Jupyter notebook) are available in the [GitHub repository](https://github.com/ExaWorks/molecular-design-parsl-demo)

- Preparing pre-configured Conda environment:
```sh
cd $HOME/tutorial/
.  3-molecular-design-parsl-demo.env
cd 3-molecular-design-parsl-demo
git pull
```

- Alternatively, you can configure your own Conda environment (note this will take several minutes): 
```sh
conda env create --file environment.yml
```

 The tutorial folder has the following content:
```
data                                - Sample molecule data from QM9
figures                             - Figures for the notebook
chemfunctions.py                    - Python functions for chemistry tasks
environment.yml                     - Conda environment file
molecular-design-with-parsl.ipynb   - Tutorial notebook
setup.py                            - Install chemfunctions
```
