# Using the Expertise of Parkour Coaches to Understand Parkour Movement: The Kong Vault

[![DOI](https://zenodo.org/badge/425055303.svg)](https://zenodo.org/badge/latestdoi/425055303)

This repository is all the code, analysis, and text that goes into building my undergraduate dissertation, "Using the Expertise of Parkour Coaches to Understand Parkour Movement: The Kong Vault", available to read online here: https://jmablog.com/research/mres/

This is a [Bookdown](https://bookdown.org/) project, in [R](https://www.r-project.org/).

## Steps for reproducing from source

This project was built with R version 4.0.2.

- Clone this directory to your local machine.
- If using Rstudio, open the .Rproj file in the base project directory. Otherwise, set the working directory to the base project directory in R. If not using Rstudio, you may need to also manually install [Pandoc](https://pandoc.org/).
- If not already installed, install the [renv](https://rstudio.github.io/renv/) and [devtools](https://devtools.r-lib.org/) R packages. See those package sites for installation instructions.
- Open the file `create_report.R` for the stages required to build the report, as detailed below:
  - Run `renv::activate()` followed by `renv::restore()` to install all the required packages used in this project in a local renv directory. This should not impact your regular R package library, but may take a little while.
  - Run `devtools::load_all()` to load the custom functions I have written for this project.
  - Run `build_book()` to build the book into the folder `book/builds/{date}`. `build_book`accepts the following arguments:
    - `format`: string, default "print". One of "all", "print", "web", "gitbook", "pdf", or "word". "all" produces gitbook, pdf, and word outputs. "print" produces just pdf and word outputs. "web" produces gitbook and pdf outputs. Individual output selections produces just that output.
    - `word_num`: boolean, default FALSE. Set if Word output should have numbered sections or not.

**Note:** The original work was written targeting PDF and gitbook output, so Word output may be broken or messy.

## About

The main text is in `book/src/using-the-expertise-of-parkour-coaches.Rmd`. Add-in text is also in the `src` folder, marked by filenames beginning with an underscore, used to slightly alter the text when building to gitbook rather than PDF. The most notable is the `_text-analysis.Rmd` file, which contains all the text analysis code for the supporting chapter.

References are stored as BibTeX in `book/bib/references.bib`. This project was written using Cite Them Right 10th Edition reference formatting; a CSL file for this format is included in `book/bib`.

Some analysis code is in the `analysis` folder, broken into knitr code chunks with `## ----` headers. This code is then imported into and run inside the main text on build using the [knitr child chunk option](https://yihui.org/knitr/options/#child-documents). Other functions for use in the build are in the `R` folder.

Formatting is mainly controlled by files in the `book/assets` folder, with some custom CSS for gitbook output, some custom LaTeX for PDF output, and custom .docx templates for Word output. All are tweaked by settings contained in their respective .yaml files in `book/assets/output_yml`, which is then used as the base for Bookdown's `_output.yml` options file on build with `build_book`.

## Data

Each interview is a separate `.txt` file, identified by the participant ID number. Within each, speakers are denoted by 'interviewer' and 'participant', separated with an empty line.

There are also `.csv` files that compile all the interviews into a tabular format, either by line or individual word, identified by participant ID, speaker, and line number. The line `.csv` also includes columns for the number of characters and words in each line.

Finally, participant characteristic info is also provided as a `.csv` file, which can be joined with any of the above data via participant ID.

