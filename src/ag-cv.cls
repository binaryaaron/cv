\ProvidesClass{ag-cv}[2012/04/30 CV class]
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

\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%
% Fonts %
%%%%%%%%%
\RequirePackage[quiet]{fontspec}
\RequirePackage{unicode-math}
\defaultfontfeatures{Mapping=tex-text}

\newfontfamily{\FAFR}{Font Awesome 6 Free Regular}[Scale=0.6]
\newfontfamily{\FAFS}{Font Awesome 6 Free Solid}
\newfontfamily{\FAB}{Font Awesome 6 Brands Regular}[Scale=0.6]
\def\faEmail{{\FAFR \symbol{"F0E0}}} % Email
\def\faPhone{\FAFS \symbol{"F095}} % Phone
\def\faLinkedin{\FAB \symbol{"F08C}} % Linkedin
\def\faGithub{\FAB \symbol{"F09B}} % Github
\def\faStackOverflow{\FAB \symbol{"F16C}} % StackOverflow

\newcommand{\tripicon}{\includegraphics[scale=0.05]{trip_logo.jpg}}%
\newcommand{\twittericon}{\includegraphics[scale=0.05]{Twitter_Logo_Blue.png}}%

\setmainfont[Mapping=tex-text,Color=textcolor, Scale=0.9]{Helvetica Neue}
\newfontfamily\bodyfont[Mapping=tex-text,Color=textcolor]{Helvetica Neue}
\newfontfamily\thinfont[Mapping=tex-text,Color=textcolor]{Helvetica Neue}

\newfontfamily\headingfont[Mapping=tex-text,Color=headercolor, Scale=1.5]{Fira Code}
\newfontfamily\largeheaderfont[Color=textcolor, Scale=1]{Fira Code}
\newfontfamily\smallheaderfont[Color=textcolor, Scale=0.85]{Fira Code}
\newfontfamily\mono{Fira Code}
\newcommand{\smallmono}[1]{{%
  \scriptsize \mono{#1}%
}}




%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}
\RequirePackage{fancyhdr}


%%%%%%%%%%%%%%%%%%%%
% List and description environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}

\newenvironment{myitemize}
  {\begin{itemize}%
    { \setlength{\labelwidth}{0em}%
     \setlength{\labelsep}{0em}%
     \setlength{\itemsep}{1mm}%
     \setlength{\parsep}{0mm}%
     \setlength{\parskip}{2mm}%
     \setlength{\leftmargin}{0cm}%
     \setlength{\rightmargin}{0.25cm}%
     \setlength{\itemindent}{0em} %
    }%
  }%
{\end{itemize}}



\RequirePackage{titlesec}


\titleformat{name=\section,numberless}[hang]
{\bfseries\headingfont} % format
{} % label
{0.0em} % sep, all the way left since this has no label
{} % before-code
[\vspace{1mm}\titlerule]

\titleformat{name=\subsection}[runin]
{\vspace{1mm}\titlerule \vspace{1mm}\bfseries\largeheaderfont} % format
{-} % label
{0.0em} % sep, all the way left since this has no label
{} % before-code
[]



% icon, title, company, start date, end date, location, body
\newenvironment{job}[7]{%gt
\subsection{#1 #2,~#3}
{\smallheaderfont \hspace{\wordsep}#6 \hfill #4\textemdash#5\par}%
  #7%
}
{}



\newenvironment{edu}[3]{%
% degree, year, school
\begin{description} \itemsep5pt \parskip0pt \parsep0pt%
\item[\smallheaderfont{#1}.]{\smallheaderfont{#3}, #2.}%
}%
{\end{description}}



\newenvironment{skilltype}[2]{%
% name, skills
\begin{description} \itemsep1pt \parskip0pt \parsep0pt%
\item[\smallheaderfont{#1}:]{\footnotesize {#2} \hfill}%
}%
{\end{description}
}
% \newenvironment{job}[7]{%
% % icon, title, company, start date, end date, location, body
% \subsection[#1~#2, #3]
% \parbox[t]{0.95\textwidth}{
% \begin{description} \itemsep1pt \parskip1pt \parsep1pt%
%   \item[#1~\largeheaderfont{#2, #3}]{\hfill \smallheaderfont{#4\textemdash#5}, \emph{#6}\par}%
%   \par\vspace{0.10cm}%
%   % \begin{sloppypar}
%   #7%
%   \par\vspace{0.45\baselineskip}% manual spacing
%   % \end{sloppypar}
% \end{description} }%
% }




%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%
\RequirePackage[style=ieee, maxnames=13, sorting=ydnt, backend=biber, natbib=true, autocite=superscript]{biblatex}
\usepackage{xurl}

\DeclareFieldFormat*{title}{\addfontfeature{Color=black}{\small{\textbf{#1}}\par}}
\DeclareFieldFormat*{date}{\footnotesize\addfontfeature{Color=lightgray}{\mkbibparens{#1}}}
\DeclareFieldFormat*{type}{\footnotesize\addfontfeature{Color=lightgray}{#1}}
\DeclareFieldFormat*{institution}{\footnotesize\addfontfeature{Color=lightgray}{\textit{#1}}}
\DeclareFieldFormat*[article]{pages}{\mkbibparens{#1}}


\DeclareFieldFormat{url}{%
  {\ifhyperref
    {\smallmono{\url{#1}}}%
    {\smallmono{\nolinkurl{#1}}}%
  }}

% \DeclareFieldFormat{shorturl}{%
%   \mkbibparens{\ifhyperref
%       {\footnotesize\url{#1}{#1}}
%       {\footnotesize\nolinkurl{#1}{#1}}
%   }}


\DeclareNameFormat{author}{%
  \footnotesize\addfontfeature{Color=darkgray}%
  \nameparts{#1}\ifblank{\namepartgiven}{}{\namepartgiven\space}\namepartfamily%
  \ifthenelse{\value{listcount}<\value{liststop}}
    {\addcomma\space}
    {\addperiod}%
}

\newcommand{\bibtitleauthor}{%
  \usebibmacro{bibindex}%
  \usebibmacro{begentry}%
  \usebibmacro{title}%
  \setunit{\addspace}%
  \usebibmacro{author}%
  \newunit\newblock%
}


%% manually adds vspace at the end after calling finentry
\newcommand{\bibend}{%
  \usebibmacro{finentry}%
  \par\vspace{0.2\baselineskip}%
}

% % each of these is finnicky.
% % 
\DeclareBibliographyDriver{article}{%
  \bibtitleauthor
    {%
    \footnotesize\addfontfeature{Color=lightgray}%
    \usebibmacro{date}%
    \setunit{\addperiod\space}%
    \usebibmacro{journal+issuetitle}%
    \usebibmacro{eprint}%
    \setunit{\addspace}\newblock
    \setunit*{\addperiod}%
    \printfield{pages}%
    \setunit*{\addperiod}%
  }
  \bibend
}

\DeclareBibliographyDriver{book}{%
\bibtitleauthor
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
  \bibend
}


\DeclareBibliographyDriver{inproceedings}{%
  \bibtitleauthor
  {%
    \footnotesize\addfontfeature{Color=lightgray}%
    \printfield{booktitle}%
    \setunit{\addcomma\space}%
    \usebibmacro{date}%
    \setunit{\period\space}%
    \printlist{location}%
    \setunit{\addperiod}
  }
  \bibend
}


\DeclareBibliographyDriver{talk}{%
  \bibtitleauthor
  {%
    \footnotesize\addfontfeature{Color=lightgray}%
    \printfield{type}%
    \setunit{\addcomma\space}%
    \printlist{institution}%
    \setunit{\addcomma\space}%
    \usebibmacro{date}%
    \setunit{\addperiod\space}%
  }
  \printfield{urlraw}%
  \bibend%
}

\DeclareBibliographyDriver{blogpost}{%
  \bibtitleauthor
  {%
    \footnotesize\addfontfeature{Color=lightgray}%
    \printfield{type}%
    \setunit{\addcomma\space}%
    \printlist{institution}%
    \setunit{\addperiod\space}%
    \usebibmacro{date}
    \setunit{\addperiod\space}%
  }%
  \printfield{url}%
  \bibend%
}


\DeclareBibliographyDriver{misc}{%
  \bibtitleauthor
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{type}%
    \setunit*{\addcomma\space}%
    \printfield{institution}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \bibend
}

\DeclareBibliographyDriver{report}{%
  \bibtitleauthor
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{type}%
    \setunit{\space}%
    \printfield{institution}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \bibend
}


\DeclareSortingTemplate{chronological}{
  \sort[direction=descending]{\field{year}}
  \sort[direction=descending]{\field{month}}
}



%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

%original is bottom=2.5 cm
%\RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage[left=1.15cm,top=1.75cm,right=1.75cm,bottom=1.25cm,nohead,nofoot]{geometry}

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
