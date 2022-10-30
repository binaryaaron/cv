\ProvidesClass{friggeri-cv}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
% \definecolor{lightgray}{HTML}{999999}
\definecolor{lightgray}{HTML}{717171}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{extra}{HTML}{F96935}

\ifdefined\@cv@print
  \colorlet{extra}{gray}
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{brown}{gray}
  \colorlet{blue}{gray}
  \colorlet{red}{gray}
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
  % \colorlet{fillheader}{white}
  % \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage{unicode-math}

%\newfontfamily\bodyfont[]{Helvetica Neue}
%\newfontfamily\thinfont[]{Helvetica Neue UltraLight}
%\newfontfamily\headingfont[]{Helvetica Neue Condensed Bold}

\defaultfontfeatures{Mapping=tex-text}
%\setmainfont[Mapping=tex-text, Color=textcolor]{Helvetica Neue Light}

%\setmathfont{XITS Math}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[4]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth,
    minimum height=3.7cm] (box) at (current page.north){} ;
    %\node[anchor=west](pic) at (-5.5,0){\includegraphics[width=.25\textwidth]{bertrandrussell.jpg}};
    \node [above=0.1cm] (name) at (box) {%
      \fontsize{36pt}{64pt}\color{header}%
      {\thinfont #1}{\bodyfont  #2}
    };
    \node [anchor=north] (contact) at (name.south) {%
      \fontsize{12pt}{20pt}\color{header}%
      \thinfont #3%
    };
    \node [anchor=north] at (contact.south) {%
      \fontsize{10pt}{36pt}\color{header}%
      \thinfont #4%
    };
    %picture?
  \end{tikzpicture}
  \vspace{1.5cm}
  % \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        red\or%
        blue\or%
        orange\or%
        green\or%
        purple\or%
        brown\or%
        extra\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor \centering #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\headingfont\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}

%\pagestyle{empty}
\RequirePackage{fancyhdr}
\pagestyle{fancy}

%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}lr}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}

% \newcommand{\entry}[4]{%
%   #1&\parbox[t]{18.8cm}{%
%     \textbf{#2}%
%     \hfill%
%     {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
%     #4\vspace{\parsep}%
%   }\\}

% \newcommand{\entry}[4]{%
% \parbox[t]{\textwidth}{%
%      \textbf{#1}%
%      \hfill%
%      {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
%      #4\vspace{\parsep}} &#2\\%
% }
 

\newcommand{\entry}[4]{%
\parbox[t]{0.9\textwidth}{%
     \textbf{#1}%
     \hfill%
     {\footnotesize\addfontfeature{Color=lightgray} #2}\\%
     \textit{#3}\\*%
     #4\vspace{\parsep}} &#2\\%
}
 

%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{3.6}(1.5, 4.33)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%

\RequirePackage[style=numeric, maxnames=10, sorting=ydnt, backend=biber]{biblatex}

\DeclareFieldFormat[article]{title}{#1\par}
\DeclareFieldFormat[book]{title}{#1\par}
\DeclareFieldFormat[inproceedings]{title}{#1\par}
\DeclareFieldFormat[misc]{title}{#1\par}
\DeclareFieldFormat[report]{title}{#1\par}
\DeclareFieldFormat[techreport]{title}{#1\par}
\DeclareFieldFormat[blogpost]{title}{#1\par}
\DeclareFieldFormat[talk]{title}{#1\par}

\DeclareBibliographyDriver{article}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
    {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{book}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}


\DeclareBibliographyDriver{inproceedings}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}%
    \printfield{booktitle}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareFieldFormat{institution}{%
  \mkbibparens{
    {\textbf{#1}}
  }
}
    

\DeclareBibliographyDriver{talk}{%
  \printfield{title}%
  \newblock%
  \par%
  \newblock
  {%
    \footnotesize\addfontfeature{Color=lightgray}%
    \newblock%
    \printnames{author}%
    \setunit{\addperiod\space}%
    \printfield{type}%
    \setunit{\addcomma\space}%
    \printlist{institution}%
    \setunit{\addcomma\space}%
    \printfield{year}%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareFieldFormat{url}{%
  \mkbibparens{\ifhyperref
      {\href{#1}{#1}}
      {\nolinkurl{#1}{#1}}
  }}

\DeclareFieldFormat{shorturl}{%
  \mkbibparens{\ifhyperref
      {\href{#1}{#1}}
      {\nolinkurl{#1}{#1}}
  }}

\DeclareBibliographyDriver{blogpost}{%
  \printfield{title}%
  \newblock%
  \par%
  \newblock
  {%
    \footnotesize\addfontfeature{Color=lightgray}%
    \newblock%
    \printnames{author}%
    \setunit{\addperiod\space}%
    \printfield{type}%
    \setunit{\addcomma\space}%
    \printlist{institution}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \setunit{\addperiod\space}%
    \printfield{url}%
    \setunit{\addperiod\space}%
    \printfield{shorturl}%
  }
  \par\vspace{0.3\baselineskip}
}


\DeclareBibliographyDriver{misc}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{booktitle}%
    \setunit*{\addcomma\space}%
    \printfield{institution}%
    \setunit*{\addcomma\space}%
    \printfield{type}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{report}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \setunit{\space}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{type}%
    \setunit{\space}%
    \printfield{institution}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareNameFormat{author}{%
  \small\addfontfeature{Color=lightgray}%
  \nameparts{#1}\ifblank{\namepartgiven}{}{\namepartgiven\space}\namepartfamily%
  \ifthenelse{\value{listcount}<\value{liststop}}
    {\addcomma\space}
    {}%
}

\newcommand{\printbibsection}[2]{
  \begin{refsection}
    \nocite{*}
    \printbibliography[sorting=chronological, type={#1}, title={#2}, heading=subbibliography]
  \end{refsection}
}

\DeclareSortingScheme{chronological}{
  \sort[direction=descending]{\field{year}}
  \sort[direction=descending]{\field{month}}
}



%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

%original is bottom=2.5 cm
%\RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage[left=1.4cm,top=2cm,right=1.90cm,bottom=1.0cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
\RequirePackage{xcolor}

\hypersetup{
  hidelinks   = true, %Colours links instead of ugly boxes
  % urlcolor     = blue, %Colour for external hyperlinks
  % linkcolor    = blue, %Colour of internal links
  % citecolor   = red %Colour of citations
  pdfauthor = Aaron Gonzales,
  pdftitle = Curriculum Vitae
}

\def\blx@auxinit@bibtex#1{%
  \blx@auxwrite\blx@auxout@bibtex
    {\def\do##1{,\blx@stripbib{##1}}}
    {\ifx\blx@auxout@bibtex\@mainaux
     \else
       \blx@msg@aux
     \fi
     \string\bibstyle{mybiblatex}\blx@nl
     \string\bibdata{%
       \blx@ctrlfile@bibtex\blxauxsuffix
       \ifx#1\@empty
       \else
         \dolistloop#1%
       \fi}\blx@nl
     \string\citation{biblatex-control}}}