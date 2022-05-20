<img src="https://exaworks.org/images/exaworks-name.png" width="250" />

# Tutorial

This tutorial addresses key challenges in the creation of diverse workflows that are portable, repeatable, and performant. We present the [ExaWorks](https://exaworks.org) SDK, and its constituent components: [Parsl](https://parsl-project.org/), [RADICAL-Cybertools](https://radical-cybertools.github.io/) (RCT), [Swift/T](https://swift-lang.github.io/swift-t/guide.html), and [Flux](http://flux-framework.org/). These components are widely used, and available tools for developing workflow applications. This tutorial outlines modern workflow motifs on HPC platforms (e.g., ensemble campaigns, ML-in-the-loop), illustrates science examples of these motifs, and discusses solutions using the ExaWorks SDK.

## Overview

We first introduce the ExaWorks component tools and explain their key capabilities. Through common workflow motifs and their instantiation, we  describe common challenges and best-practices for developing and deploying HPC workflows.

- [Presentation]()

## Preparing the Tutorial Environment

### Docker

### Virtual Machines

## Writing Ensemble Applications with RCT

- [Presentation]()

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

- [Presentation]()

## Writing Model-in-the-Loop Applications with Parsl

- [Presentation]()

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
