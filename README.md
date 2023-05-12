# r-vscode
Use R and Rmarkdown in VS Code

Basic usage:
```bash
conda activate r-env
R
```

### Setup

Using R in VS Code requires some extensions, configuration changes and installation of R packages.

**VS Code Extensions:**  
[REditorSupport](https://github.com/REditorSupport/vscode-R/wiki)  

Optional:  
[Path Intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.path-intellisense)  
[R Debugger](https://marketplace.visualstudio.com/items?itemName=RDebugger.r-debugger)  

**VS Code settings:**  
Preferences > Settings > Text Editor > Files: Add Item '*.Rmd' and Value 'rmd'  
Preferences > Settings > Extensions > R > Plot: Set 'Use Httpgd' option to true  


**R packages:**  
The [languageserver](https://github.com/REditorSupport/languageserver) package is required to make R language features available and the [httpgd](https://nx10.github.io/httpgd/index.html) package is used for viewing plots.
```r
install.packages("languageserver")
install.packages("httpgd")
```

**R settings:**  
Update R options as described in '.Rprofile' to enable session watch and use of httpgd.


### Using conda  

**Conda environment:**  
```bash
envname="r-env"
installconda="r r-essentials r-languageserver r-devtools r-httpgd xorg-libx11"

conda create -n $envname -y
conda activate $envname
conda config --env --add channels conda-forge
conda config --env --add channels r
conda install $installconda -v -y
conda env export | grep -v "^prefix: " > $envname'.yml'

readlink -f $(which R) # check R path

conda deactivate
```


### Usage  

**R session:**    
Open a new R terminal in VS code (if you want to use conda, simply type 'R' into the bash terminal).  
Make sure that the R session is attached (check the status bar in the lower right corner).  
You can install new packages into the conda R library.  


**R markdown:**  
Open 'example.R' or 'example.Rmd': Running code chunks sends the code to the active R terminal.  


**Tips:**  
Code chunks are executed in the directory that is set in the terminal, not in the directory of the '.Rmd' file.  
The setup chunk is not run automatically.  
Knit parameters defined in the Rmd header are not accessible in the R environment.  
