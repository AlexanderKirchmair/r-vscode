# r-vscode
Use R and Rmarkdown in VS Code



### Setup


**VS Code Extensions:**
[REditorSupport](https://github.com/REditorSupport/vscode-R/wiki)
R Debugger
Path Intellisense

**VS Code settings:**
Preferences > Settings > Text Editor > Files: Add Item '*.Rmd' and Value 'rmd'
Preferences > Settings > Extensions > R > Plot: Set 'Use Httpgd' option to true


**R packages/settings:**
```r
install.packages("languageserver")
devtools::install_github("ManuelHentschel/vscDebugger")
install.packages("httpgd")
options(vsc.use_httpgd = TRUE)
```


### Using conda

**Conda environment:**
```bash
envname="r-env"
installconda="r r-essentials r-languageserver r-devtools r-httpgd"

conda create -n $envname -y
conda activate $envname
conda config --env --add channels r
conda install $installconda -v -y
conda env export | grep -v "^prefix: " > $envname'.yml'

readlink -f $(which R) # check R path
readlink -f $(which Rscript)

conda deactivate
```


### Usage

**R session:**
(Activate conda env)
Open a new R terminal (if you want to use conda, simply type 'R' into the bash terminal)

**R markdown:**  
Open 'example.Rmd'  
Running a code chunk sends the code to the active R terminal  

**Tips:**
Code chunks are executed in the directory that is set in the terminal, not in the directory of the '.Rmd' file.
