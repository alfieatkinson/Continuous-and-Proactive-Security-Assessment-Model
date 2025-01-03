 %%
 %% lincolncsthesis.cls
 %% Copyright (c) 2020 Mark Doughty/Benjamin Williams/James Brown
 % <mdoughty@lincoln.ac.uk>, <bwilliams@lincoln.ac.uk> <jamesbrown@lincoln.ac.uk>
 %% 
 %% A LaTeX template for typesetting a project report document. This is based
 %% heavily on Ben William's lincolncsthesis PhD thesis template.
 %%
 %% **Original Acknowledgement**
 %% A LaTeX template for typesetting research degree theses
 %% according to the University of Lincoln School of Computer Science
 %% thesis guidelines.
 %%
 %% It is worth noting that the main inspiration (and small snippets of code) 
 %% for this template was Cameron Gray's bangorcsthesis template. 
 %%****************************
 %% -----------------------------------------
 %%
 %% This work may be distributed and/or modified under the
 %% conditions of the LaTeX Project Public License, either version 1.3
 %% of this license of (at your option) any later version.
 %% The latest version of this license is in
 %% http://www.latex-project.org/lppl.txt
 %% and version 1.3 or later is part of all distributions of LaTeX
 %% version 2005/12/01 or later.
 %%


% We're gonna be defining variables as long globals
% (because they might wanna split these up with extra lines)
\def\lxdef{\long\xdef}
 
% This class name
\def\@classname {lincolncsthesis}



% METADATA AND OPTIONS
% --------------------

% Define thesis template version and other metadata
\gdef\@templateVersion{1.1.0}
\gdef\@templateDate{2022/08/09}
\gdef\@templateAuthor{Mark Doughty/Benjamin Williams/James Brown}

% It provides this class
\ProvidesClass{\@classname}[\@templateDate \@templateVersion \@templateAuthor]

% We need LaTeX2e at least
\NeedsTeXFormat{LaTeX2e}

% Article class
\LoadClass[11pt]{report}





% PACKAGES
% --------


% Packages
\RequirePackage{amsmath}
% --
\RequirePackage{ifthen}
\RequirePackage{xkeyval}
\RequirePackage[dvipsnames]{xcolor}
%\RequirePackage[T1]{fontenc} % font types and character verification
\RequirePackage[UKenglish]{babel}
\RequirePackage[UKenglish]{isodate}
\RequirePackage[utf8]{inputenc}
\RequirePackage{xparse}
\RequirePackage{graphicx}
\RequirePackage{longtable}
\RequirePackage{blindtext}
\RequirePackage{parskip}
\RequirePackage{setspace}
\RequirePackage{geometry}
\RequirePackage{layout}
\RequirePackage{courier}
\RequirePackage{subcaption}
\RequirePackage{url}
\RequirePackage{hyperref}
\RequirePackage[table,figure]{totalcount}
\RequirePackage{appendix}
\RequirePackage{array}
% -----------------
\RequirePackage{csquotes}
\RequirePackage{titlesec}
\RequirePackage{datetime2}
\RequirePackage{fancyhdr}
\RequirePackage{lmodern}

\RequirePackage[section]{placeins}

% FANCY DATE STUFF
% -----------------

\newcommand{\monthyeardate}{%
  \DTMenglishmonthname{\@dtm@month} \@dtm@year
}

\newcommand{\yeardate}{%
  \@dtm@year
}

% Another handy macro to test if there's an option
\def\ifClassOption [#1]#2 {
    \@ifclasswith{\@classname}{#1}{#2}{\empty}
}

% Another handy macro to test if there's an option + else
\def\ifClassOptionElse [#1]#2#3 {
    \@ifclasswith{\@classname}{#1}{#2}{#3}
}


% THESIS TEMPLATE VARIABLES
% -------------------------


% Define variables relevant to this thesis
\lxdef \@logo           {logo}
\newcommand{\thesisLogoPath}[1]{\xdef\@logo{#1}}
\lxdef \@studentnumber           {studentnumber}
\newcommand{\studentnumber}[1]{\xdef\@studentnumber{#1}}
\lxdef \@email           {email}
\newcommand{\email}[1]{\xdef\@email{#1}}
\lxdef \@date           {\monthyeardate}
\newcommand{\thesisSubmissionDate}[1]{\xdef\@date{#1}}
\lxdef \@degree         {BSc(Hons)}
\newcommand{\thesisDegree}[1]{\xdef\@degree{#1}}
\lxdef \@programme      {Computer Science}
\newcommand{\thesisProgramme}[1]{\xdef\@programme{#1}}
\lxdef \@schoolname     {School of Computer Science}
\newcommand{\thesisSchool}[1]{\xdef\@schoolname{#1}}
\lxdef \@collegename    {College of Science}
\newcommand{\thesisCollege}[1]{\xdef\@collegename{#1}}
\lxdef \@universityname {University of Lincoln}
\newcommand{\thesisUniversity}[1]{\xdef\@universityname{#1}}
% -----
\newcommand{\thesisSupervisor}[1]{\xdef\@supervisor{#1}}
\newcommand{\thesisSecondSupervisor}[1]{\xdef\@secondsupervisor{#1}}
\newcommand{\thesisThirdSupervisor}[1]{\xdef\@thirdsupervisor{#1}}


% START OF THESIS
% --------------

\fancypagestyle{plain}{
    \renewcommand{\headrulewidth}{0pt}%
    \fancyhf{}%
    \fancyfoot[R]{\footnotesize\textbf{\thepage}}%    
}

\fancypagestyle{mainStyle}{
	\renewcommand{\headrulewidth}{0pt}%
	\fancyhf{}%
	\fancyfoot[R]{\footnotesize\emph{\leftmark} \hspace{0.25cm} \footnotesize\textbf{\thepage}}%   
	
	\@ifundefined{@includeheaders}{
	
	}{
    	\fancyhead[R]{\textit{\footnotesize \@modulecode~\@modulename}}
    	\fancyfoot[L]{\footnotesize \@author \hspace{0.5cm} \@studentnumber}
	}
}


\newcommand{\thesisBodyStart}{

    % Clear the page so we don't number the last page
    \cleardoublepage
    
    % Set page numbering back to 1, 2, 3 .. 
    \pagenumbering{arabic} 
}



% TABLE OF CONTENTS, FIGURES AND TABLES
% ---------------------------

\newcommand{\thesisTOF}{
    \iftotalfigures
        \cleardoublepage
        \listoffigures
    \fi
}

\newcommand{\thesisTOT}{
    \iftotaltables
        \cleardoublepage
        \listoftables
    \fi
}

\newcommand{\thesisTables}{
    \cleardoublepage
    \renewcommand{\contentsname}{Table of Contents}
    \setcounter{tocdepth}{3}
    {\setstretch{1.25}
        \tableofcontents
        \thesisTOF
        \thesisTOT
    }
    
    \setlength{\abovedisplayskip}{1pt}
    \setlength{\belowdisplayskip}{15pt}
}



% ABSTRACT
% -------------------------

\renewenvironment{abstract}
    {\cleardoublepage
     \chapter*{\abstractname}
    }
    {}




% ACKNOWLEDGEMENTS
% ----------------

\newenvironment{acknowledgements}
    {\cleardoublepage
     \chapter*{Acknowledgements}
    }
    {}




% AFTER TITLE PAGE BUT BEFORE THESIS CONTENT
% ------------------------------------------
\newcommand{\afterTitlePage}{

    % Set margins for the rest of the thesis. UoL guidelines 
    % state that: [left >= 40mm], [others >= 15mm]
    \newgeometry{
        nohead, 
        top=15mm,
        bottom=25mm,
        right=25mm,
        left=40mm,
        marginparwidth=0cm,
        marginparsep=0cm
    }

    % Set spacing and reset numbering
    \pagenumbering{roman}
            
    % Set double spacing (from cleanthesis.sty)
    \setstretch{1.5}
    \clubpenalty = 10000
    \widowpenalty = 10000
    \displaywidowpenalty = 10000
}









% TITLE PAGE
% -------------
 
% Print out submission text
\newcommand{\submissionStatement}{
    \setstretch{1.25}
    \@ifundefined{@submissiontext}{Submitted in partial fulfilment of the requirements for the \\Degree of \@degree}{\@submissiontext}
}

% Print out supervisors
\newcommand{\printSupervisor}{
    %{\footnotesize \textit{Supervisor}~\@supervisor }
    %\@ifundefined{@secondsupervisor}{}
    %{\footnotesize \textit{Second Supervisor}~\@secondsupervisor }
    
    \footnotesize\begin{tabular}{rl}
        \@ifundefined{@supervisor}{}
        {\textit{Module Co-Ordinator} & \@supervisor \\}
        
        \@ifundefined{@secondsupervisor}{}
        {\textit{Second Module Co-Ordinator} & \@secondsupervisor \\}
        
        \@ifundefined{@thirdsupervisor}{}
        {\textit{Third Supervisor} & \@thirdsupervisor }
    \end{tabular}
}

% The default title page: title, then logo, then author
\newcommand{\@titlepage}{
    \begin{titlepage}

    % Make the title
    \makeatletter
    \centering{\LARGE \@title \par} \vspace{1.5cm}
    
    % Make the logo
    \includegraphics[height=1.5in]{\@logo}\par 
    
    % Some space, then the author, then the school and university
    % name
    \vspace{1.5cm}
  %  {\large \@author \@ifundefined{@studentnumber}{}{\\ \@studentnumber} \par}\vspace{0.45cm}
    {\large \@author \\ \footnotesize \@studentnumber \par}\vspace{0.45cm}
     {\footnotesize \@email \par}\vspace{0.45cm}
    {\footnotesize \@schoolname \\ \vspace{0.25cm} \@collegename \\  \vspace{0.25cm}  \@universityname \par}
    
    % Some space and the submission statement
    \vspace{2cm}
    {\footnotesize \submissionStatement \par}
    
    % Print out the supervisor
    \vspace{1cm}
    \printSupervisor
    
    % Then the fancy date!
    \vspace{1cm}
    {\footnotesize \@ifundefined{@modulecode}{}{\@modulecode \\} \@date \par}
    
	\end{titlepage}
}

% The alternate title page: logo, then title, then author
\def \@altTitlePage {
    \begin{titlepage}
    
    % Make the logo
    \makeatletter
    \centering\includegraphics[height=1.5in]{\@logo}\par 
    
    % Make the title
    \vspace{2cm}
    {\LARGE \@title\par}
    
    % Some space, then the author, then the school and university
    % name
    \vspace{1.5cm}
    {\large \@author \par}\vspace{0.45cm}
    {\footnotesize \@schoolname \\ \vspace{0.25cm} \@collegename \\  \vspace{0.25cm}  \@universityname \par}
    
    % Some space and the submission statement
    \vspace{2.5cm}
    {\footnotesize \submissionStatement \par}
    
    % Print out the supervisor
    \vspace{1cm}
    \printSupervisor
    
    % Then the fancy date!
    \vspace{1cm}
    {\footnotesize \@date \par}
    
	\end{titlepage}
}

\newcommand{\beforeTitlePage}{
    % Set margins for the rest of the thesis. UoL guidelines 
    % state that: [left >= 40mm], [others > 15mm]
    \newgeometry{
        nohead, 
        top=40mm,
        bottom=25mm,
        right=30mm,
        left=40mm,
        marginparwidth=0cm,
        marginparsep=0cm
    }
}


% The default title page style is the title, logo, author style
\def \@defaultTitlePage {\@titlepage}


% Lets renew the make title command so we don't have to 
% make a custom one
\RenewDocumentCommand{\maketitle}{o}{%

  % Call function for before title page
  \beforeTitlePage
  
  % Then check which title page style to use
  \IfNoValueTF{#1}
    {\@defaultTitlePage}
    {\ifthenelse{\equal{#1}{logo-first}}
        {\@altTitlePage}
        {\@defaultTitlePage}}
    
  % Call function for after title page       
  \afterTitlePage
}






% TITLE / CHAPTERS / FIGURES / TITLESEC SPACING
% ---------------------------------------------

% Set the chapter title style
\titleformat{\chapter}[display]
{\normalfont\Large\bfseries}{\chaptertitlename\ \thechapter}{0pt}{\LARGE}

% And space it out a bit
\titlespacing*{\chapter} {0pt}{0pt}{10mm}

% A fake chapter title command to emulate chapter titles
% without actually adding a chapter
\newcommand{\chapterTitle}[1]{
	\vspace*{-20mm} 
	{\normalfont\LARGE\bfseries#1 \par} 
	\vspace*{20mm}
}

\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    filecolor=magenta,      
    urlcolor=cyan,
    }

% Customize the section heading
\titleformat{\section}
  {\normalfont\large\bfseries}{\thesection}{1em}{}

\titleformat{\subsection}
  {\normalfont\normalsize\bfseries\itshape}{\thesubsection}{1em}{}

\titleformat{\subsubsection}
  {\normalfont\normalsize\itshape}{\thesubsubsection}{1em}{}


% REFERENCING
% -----------

% Fake harvard referencing, instead of using natbib -- because
% natbib makes biblatex blow up.
\def\@importHarvard {
    \RequirePackage[
        defernumbers=true,
        backend=biber,
        bibencoding=utf8,
        natbib=true,
        hyperref=true,
        backref=true,
        urldate=long,
        style=authoryear,
        citestyle=authoryear,
        sorting=nyt
    ]{biblatex}
}

% Otherwise use ieee's style and numeric citation
\def\@importBibLaTeX {
    \RequirePackage[
        defernumbers=true,
        backend=biber,
        bibencoding=utf8,
        natbib=true,
        hyperref=true,
        backref=true,
        urldate=long,
        style=ieee,
        citestyle=numeric,
        sorting=nyt
    ]{biblatex}
}

% Import harvard if [harvard] is specified, otherwise
% standard biblatex!
\ifClassOptionElse[harvard]{\@importHarvard}{\@importBibLaTeX}


% Command for printing out references list
\newcommand{\printReferences}[1][References]{
	
	% Set some spacing up between the items
	\setlength\bibitemsep{0.35cm}
	
	% Set the line height (of actual items) to 1.0
	\setstretch{1.0}
	
	\addcontentsline{toc}{chapter}{References}
	
	% Print out the bibliography with the given title
	\printbibliography[notkeyword={game}, title=#1]
}

% Command for printing out appendices
\newcommand{\printAppendices}[1][Appendices]{
    \addcontentsline{toc}{chapter}{Appendices}

    \appendix
    \chapter*{Appendices}
    \input{chapters/appendices.tex}
}



% LUDOGRAPHY
% ----------


% Citation environment for games
\defbibenvironment{games}
 {\list
     {}
     {\setlength{\leftmargin}{\bibhang}%
      \setlength{\itemindent}{-\leftmargin}%
      \setlength{\itemsep}{\bibitemsep}%
      \setlength{\parsep}{\bibparsep}}}
  {\endlist}
  {\item}
  
% Prints out the ludography (all citations with the
% key "game")
\newcommand{\printLudography}[1][Ludography]{

    % Set some spacing up between the items
	\setlength\bibitemsep{0.35cm}
	
	% Set the line height (of actual items) to 1.0
	\setstretch{1.0}
	
	% Print out the bibliography with the given title
	\printbibliography[env=games, keyword={game}, title=#1]
}

% Prints out the ludography without a heading
\newcommand{\printLudographyNoHead}{

    % Set some spacing up between the items
	\setlength\bibitemsep{0.35cm}
	
	% Set the line height (of actual items) to 1.0
	\setstretch{1.0}
	
	% Print out the bibliography with the given title
	\printbibliography[heading=none, env=games, keyword={game}]
}

% Ludography environment, if you wish to put some text before
% the list of games that are printed
\newenvironment{ludography}[1][Ludography]{
  \chapter*{#1}  
}{\vspace*{1cm} \printLudographyNoHead}

% For citing games
\newcommand{\citeGame}[1]{
    \emph{\citeauthor{#1}}
}



% BLANK PAGE / QUOTE PAGE
% -----------------------

% For quote pages, copyright notices, or whatever else
\newenvironment{blankpage}[1][\unskip]{%
	
	% Check if [c] is specified, if so, then 
	% make it vertically align.. if not, then
	% just clear a double page and write some stuff
    \ifthenelse{\equal{#1}{c}}{
        \cleardoublepage
        \topskip0pt
        \vspace*{\fill}
    }{
    \cleardoublepage
    \topskip0pt
    \vspace*{1in}
    }
}{
        \vspace*{\fill}
}


% Set the page style to the main style. Set up the chapter
% mark style so that it shows the title of the chapter only.
\pagestyle{mainStyle}
\renewcommand{\chaptermark}[1]{\markboth{{#1}}{}}

% A command to create a blank footnote
\let\svthefootnote\thefootnote
\textheight 1in
\newcommand\blankfootnote[1]{%
  \let\thefootnote\relax\footnotetext{#1}%
  \let\thefootnote\svthefootnote%
}