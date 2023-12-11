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

\defaultfontfeatures{Mapping=tex-text}


%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

% \newcommand{\header}[4]{%
%   % \tikzstyle{bag}
%   \begin{tikzpicture}[remember picture,overlay]
%     \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth,
%     minimum height=5cm] (box) at (current page.north){} ;
%     % minimum height=3.7cm] (box) at (current page.north){} ;
%     %% first node is title
%     \node [above=0.1cm] (name) at (box) {%
%       \fontsize{36pt}{64pt}\color{header}%
%       {\thinfont #1}{\bodyfont  #2}
%     };
%     \node [anchor=north] (contact) at (name.south) {%
%       \fontsize{12pt}{20pt}\color{header}%
%       \thinfont #3%
%     };
%     \node [anchor=north, align=left](summary) at (contact.south) {%
%       % \fontsize{10pt}{36pt}\color{header}%
%       % \parbox[center]{\textwidth}{ \thinfont #4 } };
%        \thinfont #4 };
    
%   \end{tikzpicture}
%   \vspace{0.5cm}
%   % \vspace{-2\parskip}
% }

\newfontfamily\titlesummaryfont{Fira Code Light}
\newcommand{\summaryfont}{%
  \fontsize{11pt}{11pt}\selectfont%
  \titlesummaryfont%
  \color{white}%
}

\tikzstyle{bag} = [align=center, anchor=north]
\newcommand{\header}[4]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth,
    minimum height=3.5cm] (box) at (current page.north){} ;

    %% first node is title
    \node [below=0.25cm] (name) at (box.north) {%
      \fontsize{20pt}{36pt}\color{header}%
      {\thinfont #1} {\bodyfont #2}
    };
    \node [bag] (contact) at (name.south) {%
      \fontsize{10pt}{10pt}\color{header}%
      \thinfont #3\\ \\};

    \node[align=center, text width=15cm] (summary) at (contact.south) {%
      \parbox[center]{\textwidth}{\summaryfont #4}};
    
  \end{tikzpicture}
  \vspace{2cm}
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
    \Large\headingfont\color{headercolor}%
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

\newenvironment{myitemize}{
  \begin{itemize}{\itemsep0.5pt \parskip0pt \parsep0pt}{}%
}{\end{itemize}}

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

\RequirePackage[style=ieee, maxnames=12, sorting=ydnt, backend=biber, natbib=true, autocite=superscript]{biblatex}

% \DeclareFieldFormat[article]{title}{\small\addfontfeature{Color=darkgray}#1\par}
% \DeclareFieldFormat[book]{title}{#1\par}
% \DeclareFieldFormat[inproceedings]{title}{\addfontfeature{Color=darkgray}#1\par}
% \DeclareFieldFormat[misc]{title}{\addfontfeature{Color=darkgray}#1\par}
% \DeclareFieldFormat[report]{title}{\addfontfeature{Color=darkgray}#1\par}
% \DeclareFieldFormat[techreport]{title}{\addfontfeature{Color=darkgray}#1\par}
% \DeclareFieldFormat[blogpost]{title}{\addfontfeature{Color=darkgray}#1\par}
% \DeclareFieldFormat[talk]{title}{\addfontfeature{Color=darkgray}#1\par}

\DeclareBibliographyDriver{article}{%
  \small\printfield{title}%
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
  \small\printfield{title}%
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
  \small\printfield{title}%
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
  {\ifhyperref
      {\footnotesize\href{#1}{#1}}
      {\nolinkurl{#1}{#1}}
  }}

\DeclareFieldFormat{shorturl}{%
  \mkbibparens{\ifhyperref
      {\href{#1}{#1}}
      {\nolinkurl{#1}{#1}}
  }}

\DeclareBibliographyDriver{blogpost}{%
  \small\printfield{title}%
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
    \printfield{year}\addperiod%
  }%
  \newblock
  \par
  {
    \printfield{url}%
  }
  \par\vspace{0.2\baselineskip}
}


\DeclareBibliographyDriver{misc}{%
  \small\printfield{title}%
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
  \small\printfield{title}%
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


\DeclareFieldFormat*{title}{\small\addfontfeature{Color=black}{#1}\par}

\DeclareNameFormat{author}{%
  \footnotesize\addfontfeature{Color=lightgray}%
  \nameparts{#1}\ifblank{\namepartgiven}{}{\namepartgiven\space}\namepartfamily%
  \ifthenelse{\value{listcount}<\value{liststop}}
    {\addcomma\space}
    {}%
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
\RequirePackage[left=1.25cm,top=2cm,right=1.75cm,bottom=1.0cm,nohead,nofoot]{geometry}
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