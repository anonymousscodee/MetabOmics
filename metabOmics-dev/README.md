# metabolitics-dev
Development repository for metabolitics algorithm

## Introduction
Welcome to the installation and environment setup guide for Metabolitics algorithm tool proposed in https://ieeexplore.ieee.org/document/9137659 by Ali Çakmak and Hasan Çelik, and developped by other researchers.

Metabolitics employs flux variability analysis with a dynamically built objective function based on
biofluid metabolomics measurements in a personalized manner. Moreover, Metabolitics builds supervised classification models to discriminate between patients and healthy subjects based on the computed metabolic network changes.

## Cloning the repository
After getting your access to ITU Bioinformatics & Database Lab Organisation on Github clone the "metabolitics-dev" repository.\
(If you don't have git on your system download and install from https://git-scm.com/downloads) \
(You may want to work on your version of metabolitics, delete `.git` folder, later create your own.)
```
git clone https://github.com/itu-bioinformatics-database-lab/metabolitics-dev.git
```

## Option #1: Create your virtual environment for metabolitics using `metaboliticsenv.yml` file __(Recommended)__
If you are using Anaconda or other conda versions you can create a conda environment using a `.yml` file.\
Create the virtual environment from the `metaboliticsenv.yml` file:
```
conda env create -f metaboliticsenv.yml
```

Delete a specific environment:
```
conda env remove --name name_of_the_environment
```
## Option #2: Create your virtual environment for metabolitics using `pyenv`
### (Windows 10/11)
`pyenv` actually started as a tool for Unix platforms such as Linux and macOS; however, there is an excellent Windows 10/11 port of it which can be found in this GitHub repository: https://github.com/pyenv-win/pyenv-win

Installing `pyenv-win` is not very straightforward due to how Windows 10/11 and PowerShell works, but if you follow those steps, it shouldn’t be too much of a hassle:
1. Download `pyenv-win` ZIP-archive: https://github.com/pyenv-win/pyenv-win/archive/refs/heads/master.zip
2. Create a new folder `.pyenv` in your user folder with the name `.pyenv`. You can do this using the Explorer or the following PowerShell command:

    ```powershell
    mkdir $HOME/.pyenv
    ```
3. Extract the ZIP-archive and copy the `pyenv-win` folder and the `.version` file from the `pyenv-win-master` folder into the newly created `.pyenv` folder in your user folder.
4. Set the environment variables `PYENV` and `PYENV_HOME` that point to the installation folder:

    ```powershell
    [System.Environment]::SetEnvironmentVariable('PYENV',$env:USERPROFILE + "\.pyenv\pyenv-win\","User")
    [System.Environment]::SetEnvironmentVariable('PYENV_HOME',$env:USERPROFILE + "\.pyenv\pyenv-win\","User")
    ```
5. Add the `bin` folder to the `PATH` variable. Such that `pyenv` can be found when using the command line.
    ```powershell
    [System.Environment]::SetEnvironmentVariable('path', $env:USERPROFILE + "\.pyenv\pyenv-win\bin;" + $env:USERPROFILE + "\.pyenv\pyenv-win\shims;"[System.Environment]::GetEnvironmentVariable('path', "User"),"User")
    ```
6. Close the current PowerShell.
7. If you haven’t enabled script execution yet, start a new PowerShell with admin privileges by right-clicking on the PowerShell icon in the start menu and choose _Run as administrator_. Otherwise, skip ahead to step 9.
8. Enter the following command into the PowerShell to enable the execution of scripts:

    ```powershell
    Set-ExecutionPolicy unrestricted
    ```
    And press `A` to choose _Yes to ALL_. Afterward, you can close this PowerShell window and open a new one without admin privileges.
9. Now, you can run `pyenv` by entering
    ```powershell
    pyenv
    ```

## Installing IBM CPLEX as an alternative solver
* To download CPLEX Optimization Studio first create an account using your academic ITU e-mail.\
(https://www.ibm.com/tr-tr/products/ilog-cplex-optimization-studio)
* Once your account is confirmed go to https://www.ibm.com/academic/topic/data-science and download the software for your OS.
* You may have to install "IBM Download Director" first, from https://www-03.ibm.com/isc/esd/dswdown/dldirector/installation_en.html. \
(If the file doesn't open, you may need to install Java first. Go to https://java.com to download and install the latest version of Java.)
* After the instalation has completed, you need to link CPLEX with Python.
* Go to the instalation directory of IBM CPLEX, in my case: `C:\Program Files\IBM\ILOG\CPLEX_Studio201\python`
* Open an administrator shell inside of the directory.
* Switch to your `metaboliticsenv`. First type `conda deactivate` to close the base environment. Then `conda activate metaboliticsenv`.
* If you can't switch between environments in Windows Powershell type `conda init powershell` to change setting.\
(You should see the name of the environment on the left, inside braces)
* Run `setup.py` with `python setup.py install` command in an administrator shell.
* In the `analysis/analysis.py` you may use `self.model.solver = "cplex"` line to change for different solvers.
```python
def __init__(self, model, without_transports=True, timeout=10 * 60):
        '''
        :param model: cobra Model
        '''
        self.model = load_network_model(model)
        self.model.solver = "cplex"
        # self.model.solver = "glpk"
        self.without_transports = without_transports
```
