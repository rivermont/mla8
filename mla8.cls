% A modified version of jackson13info's mla13.sty for formatting MLA documents (https://github.com/jackson13info/mla13)


\ProvidesClass{mla8}
\LoadClass[12pt]{article}
\usepackage[utf8]{inputenc}
\usepackage{mathptmx}

%\usepackage{fullpage}
\usepackage[letterpaper,margin=1in]{geometry}
\usepackage[american]{babel}
\usepackage{hyperref}
\usepackage{csquotes}
\setlength{\parindent}{0.5in}

\usepackage{datetime}
\usepackage{fancyhdr}

% Double-spaced, as required by MLA
\linespread{2}

% biblatex
\usepackage[style=mla,mladraft=false,
noremoteinfo=true, % disables doi, issn, isbn, &c.
showmedium=false, % this hides the annoying 'Print' that is appended to items without a url
%annotation=true  % uncomment to enable annotations
]{biblatex}

% New version of {center} environment that doesn't add extra spacing
\newenvironment{nospacecenter}{\parskip=0pt\par\nopagebreak\centering}{\par\noindent\ignorespacesafterend}

% Formatting Commands
\renewcommand \thesection {\@arabic\c@section.}
\renewcommand\thesubsection   {\thesection\@arabic\c@subsection}
\renewcommand\section{\@startsection{section}{1}{\z@}
                                    {\z@}
                                    {\lineskip}
                                    {\normalfont}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}
                                       {\z@}
                                       {\lineskip}
                                       {\normalfont}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}
                                          {\z@}
                                          {\lineskip}
                                          {\normalfont}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}
                                      {\z@}
                                      {\lineskip}
                                      {\normalfont}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}
                                         {\z@}
                                         {\lineskip}
                                         {\normalfont}}

% Bibliography Commands
\DeclareFieldFormat{ibidpostnote}{#1}%
\renewbibmacro*{cite:idem}{%
  \ifsingletitle%
    {\iffieldundef{postnote}%
      {\usebibmacro{cite:name}}%
      {\unspace\global\boolfalse{cbx@named}}}%
    {\addspace\global\boolfalse{cbx@named}}}
\renewbibmacro*{cite:mla:title:internal}{% 0.7.1 new internal macro
  \ifbool{cbx@named}%
    {\unspace\addcomma\addspace}%
    {}%
  \iffieldundef{title}%
    {\iffieldequalstr{entrytype}{review}%
      {\printtext[bibhyperref]{\printtext{\bibstring{reviewof}%
       \addspace\printfield{booktitle}}}}%
      {\ifthenelse{\iffieldequalstr{entrytype}{suppbook}% 0.7.1
         \OR\iffieldequalstr{entrytype}{suppcollection}}%
        {\printtext[bibhyperref]{%
         \printfield[mla:capital]{entrysubtype}}}%
        {}}}%
    {\printtext[bibhyperref]{%
       \printfield[citetitle:\strfield{entrytype}]{labeltitle}}}}%
\renewbibmacro*{cite:mla:title}{% 0.7.1 tidied up
  \unspace%
  \ifnameundef{labelname}%
    {\unspace%
     \printtext[bibhyperref]{%
       \printfield[citetitle:\strfield{entrytype}]{labeltitle}}%
     \iffieldundef{postnote}%
       {}%
       {\addspace}}%
    {\ifsingletitle%
      {}%
      {\usebibmacro{cite:mla:title:internal}\addspace}}%
  \ifthenelse{\iffieldequalstr{entrytype}{review}%
      \and\ifnameundef{author}%
      \and\iffieldundef{title}}%
    {\printtext[bibhyperref]%
      {\unspace\printtext{\bibcpstring{reviewof}%
       \addspace\printfield{booktitle}}}}%
    {}}%
\DeclareCiteCommand{\cite}[\mkbibparens]
  {\usebibmacro{prenote}}%
  {\usebibmacro{citeindex}%
   \usebibmacro{cite:mla}}{}
  {\usebibmacro{postnote}}
\defbibheading{apa}[\refname]{}

% Annotations for the Bibliography
\renewbibmacro{finentry}{%Renew the annotation macro
   \finentry
   \iffieldundef{annotation}%
     {}%
     {\ifbool{bbx@annotation}%
       {\begin{quotation}\noindent%Make the annotation look like a quotation and remove the indent
          \printfield{annotation}%
        \end{quotation}}%
       {}}%
}

% Formatting Section Headings
\def\section{\@startsection{section}{1}{\z@}{-5.25ex plus -1ex minus
-.2ex}{1.5ex plus .2ex}{\center}}
\def\thesection{\arabic{section}.}

% Remove parenthesis from bibliography
%\renewbibmacro*{issue+date}{%
%  \setunit{\addcomma\space}% NEW
%  \printtext[parens]{% DELETED
%    \iffieldundef{issue}
%      {\usebibmacro{date}}
%      {\printfield{issue}%
%       \setunit*{\addspace}%
%       \usebibmacro{date}}}% DELETED
%       \usebibmacro{date}}% NEW
%  \newunit}

% Header info commands
\def\@firstname{ }
\newcommand{\firstname}[1]{
  \def\@firstname{#1}
}
\def\@lastname{ }
\newcommand{\lastname}[1]{
  \def\@lastname{#1}
}
\newcommand{\professor}[1]{
  \def\@professor{#1}
}
\newcommand{\class}[1]{
  \def\@class{#1}
}

% Header and footer
\pagestyle{empty}
\pagestyle{fancy}
\fancyhf{}
\fancyhead{}
\renewcommand{\headrulewidth}{0pt}
\rhead{\@lastname\ \thepage}
\newdateformat{datef}{\THEDAY\ \monthname[\THEMONTH] \THEYEAR}

% Title
\newcommand*{\makeheader}{\begingroup
\rmfamily
\fontsize{12}{2}
\noindent \@firstname\ \@lastname\\
\@professor\\
\@class\\
\datef\@date
\begin{nospacecenter}
\@title
\end{nospacecenter}
\endgroup}

% Works Cited environment
\newcommand*{\makeworkscited}{\begingroup
\pagebreak
\begin{center}
Works Cited
\end{center}
\printbibliography[heading=apa]
\endgroup}

% Outline environment
\newenvironment{outline}
{
    \renewcommand{\labelenumi}{\Roman{enumi}.}
    \renewcommand{\labelenumii}{\Alph{enumii}.}
    \renewcommand{\labelenumiii}{\arabic{enumiii}.}
}{}
