<img src="https://exaworks.org/images/exaworks-name.png" width="250" />

# Tutorial

This tutorial addresses key challenges in the creation of diverse workflows that are portable, repeatable, and performant. We present the [ExaWorks](https://exaworks.org) SDK, and its constituent components: [Parsl](https://parsl-project.org/), [RADICAL-Cybertools](https://radical-cybertools.github.io/) (RCT), [Swift/T](https://swift-lang.github.io/swift-t/guide.html), and [Flux](http://flux-framework.org/). These components are widely used, and available tools for developing workflow applications. This tutorial outlines modern workflow motifs on HPC platforms (e.g., ensemble campaigns, ML-in-the-loop), illustrates science examples of these motifs, and discusses solutions using the ExaWorks SDK.

## Overview

We first introduce the ExaWorks component tools and explain their key capabilities. Through common workflow motifs and their instantiation, we  describe common challenges and best-practices for developing and deploying HPC workflows.

- [Presentation](https://github.com/ExaWorks/Tutorial/blob/main/presentations/01-introduction.pdf)

## Preparing the Tutorial Environment

### Docker

### Virtual Machines

See our Wiki for information on the AWS instances we will be using today:

https://github.com/ExaWorks/Tutorial/wiki

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

- Documentation
    - [Swift/T Home Page](http://swift-lang.org/Swift-T)
    - [Swift/T Guide (installation, language, etc.)](https://swift-lang.github.io/swift-t/guide.html)
    - [Swift/T Sites Guide (running on scheduled systems)](https://swift-lang.github.io/swift-t/sites.html)

- Simple checkout, setup, example 01

```sh
cd Tutorial/swift-t
source swift_demo.env  # May produce warnings about Conda, ignore them
```

- Quick use example
```sh
$ swift-t -E 'trace(42);'
trace: 42

$ ls
01-hello  02-loop  04-py  05-numpy
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

- Examples 02, 04, 05

```sh
# 02-loop
$ ./run.sh -n 8 loop.swift

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
