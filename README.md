# r-vscode
Use R and Rmarkdown in VS Code



### Setup


**VS Code Extensions:**
[REditorSupport](https://github.com/REditorSupport/vscode-R/wiki)
R Debugger
Path Intellisense

**VS Code settings:**
Preferences > Settings > Text Editor > Files: Add Item '*.Rmd' and Value 'rmd'

**R packages:**
```r
install.packages("languageserver")
devtools::install_github("ManuelHentschel/vscDebugger")
```


### Using conda

**Conda environment:**
```bash
envname="r-env"
installconda="r r-essentials r-languageserver r-devtools gxx_linux-64"

conda create -n $envname -y
conda activate $envname
conda config --env --add channels r
conda install $installconda -v -y
conda env export | grep -v "^prefix: " > $envname'.yml'

readlink -f $(which R) # check R path

conda deactivate
```


### Usage

(Activate conda env)
Open a new R terminal (to use conda, simply type 'R' into the bash terminal)
Open 'example.Rmd'
Running a code chunk sends the code to the active R terminal
