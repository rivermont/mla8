mla8
=====

A LaTeX MLA style formatter package that allows users to create MLA style documents easily.

## How to Install

If you want to install the package manually then just download the `.sty` file and place it in the texmf folder for use with all of your LaTeX file needs.
If you just want to use it on one project, just place it in your project folder for local access.

## How to Use

The mla8 package does not require that you use any other packages, though it allows you to do so.
The packages used by mla8 are: inputenc, mathptmx, geometry, babel, hyperref, csquotes, and biblatex, some of which can be turned off if not wanted.
In order to use the features provided by mla8, the first thing you have to do is to use the package in your LaTeX project.
To do this use the following command:

    \usepackage{mla8.sty}

### Creating Your Header

All MLA documents must contain the standard 5 line header that includes your name, professors name, class name, and the date the paper was written.
To do this, no formatting work is needed, the package just needs the values to be set and it will do all of the heavy lifting.
To set the values of the variables follow the process below:

    \firstname{Your First Name}
    \lastname{Your Last Name}
    \professor{Your Professor's Name}
    \class{The Name of Your Class}
    \title{The Title of Your Paper}

The above code simply sets all of the data values for later use in the paper. When you want to create your header, just type `\makeheader` and the header will be made.

### Paragraph Formatting

Paragraph formatting is standard and conforms to the MLA style guidelines.
The font used is 12 pt Times New Roman.

When choosing the justification of the paper, you have 3 options:
(1) left justification, (2) right justification, or (3) justified.
Justified is the default setting in LaTeX.
If you would like to change the justification settings of your paper, use the following commands:

To make the file right justified use `\raggedleft`  
To make the file left justified use `\raggedright`

Place either of these commands before the begin document section of your LaTeX file.

### Citing and Sources

This package uses BibTeX because it is the most commonly used for bibliographies.
All of your sources should be kept in a .bib file and should be formatted to meet the BibTeX standards.
To learn more about BibTeX and its features, look at this website http://en.wikipedia.org/wiki/BibTeX.
Once your file is set up you need to tell mla8 which file to look at.
To do this type the following before the begin document section of your LaTeX file:

    \sources{NameOfBibFile.bib}

To cite a source, the main command that you should use is the standard `\cite` command.
This is the one that fits with MLA citation style.
Here is an example of how to use this command:

No Page Number: `\cite{Name of Source}`
Page Number: `\cite[Page]{Name of Source}`

Finally, add `\makeworkscited` at the end of your document (but before `\end{document}`) in order to include your works cited.

### Changing the Date of the File

If you want to use a date other than the current date, the only way is to manually input the correctly formatted date using the standard date attribute provided by LaTeX.
For example, place the following before `\begin{document}`:

    \date{5 February 2013}

This follows the format of MLA such that:

    \date{DAY MONTH YEAR}

Otherwise, to use the current date, do not include the date field inside of your file.
