\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{ipsreport}
              [2005/09/16 v1.4f.a Modified from Standard LaTeX document
              class book.cls by Khaireel A. Mohamed April 2007
              and by Tobias Langner November 2009 and June 2011]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LOAD OWN PACKAGES AND STUFF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtEndOfClass{
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{setspace}
\RequirePackage{listings}
\RequirePackage{float}

\numberwithin{equation}{chapter}

\theoremstyle{plain}
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{observation}[theorem]{Observation}

\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{problem}[theorem]{Problem}
\newtheorem{assumption}[theorem]{Assumption}
\newtheorem{example}[theorem]{Example}

\theoremstyle{remark}
\newtheorem{claim}[theorem]{Claim}
\newtheorem{remark}[theorem]{Remark}

% Enables the use of colours
\usepackage{xcolor}
\definecolor{darkblue}{rgb}{0,0,.5}
% Enables clickable links in the PDF and additional PDF specific configuration options.
\usepackage[
            colorlinks=true,
            linkcolor=black, urlcolor=black, citecolor=black,
            raiselinks=true,
            bookmarks=true,
            bookmarksopenlevel=1,
            bookmarksopen=true,
            bookmarksnumbered=true,
            hyperindex=true,
            plainpages=false,
            pdfpagelabels=true,
            pdfstartview=FitH,
            pdfstartpage=1,
            pdfpagelayout=OneColumn
            ]{hyperref}

% Allows to use nice todo notes on the paper margin
\usepackage{todonotes}

% ::::::::::::::::::::::::::::::::::::::::::::::::: MARK MAROLF CUSTOM PACKAGES AND SETTINGS ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% for plotting graphs
\usepackage{tikz}
\usetikzlibrary{arrows.meta}
\usepackage{pgfplots}
\pgfplotsset{compat=newest, ticks=none}

%% The AMS-LaTeX extensions for mathematical typesetting. Do not remove.
\usepackage{amsmath,amssymb,amsfonts,mathrsfs}

% Line spacing - Palatino needs more space between lines
\linespread{1.05}

% Document margins
\usepackage[hmarginratio=1:1,top=32mm,columnsep=20pt]{geometry}
% \geometry{margin=1in}

% Custom captions under/above floats in tables or figures
\usepackage[hang, small,labelfont=bf,up,textfont=it,up]{caption}

% \usepackage{etoolbox}% http://ctan.org/pkg/etoolbox

% \makeatletter
% \patchcmd{\@makechapterhead}{\vspace*{50\p@}}{}{}{}% Removes space above \chapter head
% \patchcmd{\@makeschapterhead}{\vspace*{50\p@}}{}{}{}% Removes space above \chapter* head
% \makeatother



\usepackage{lettrine} % The lettrine is the first enlarged letter at the beginning of the text
\usepackage{enumitem} % Customized lists

\usepackage{titlesec}
\titleformat{\chapter}[display]
{\normalfont\huge}{}{16pt}{\Huge}

% decrease spacing before chapter title
% https://tex.stackexchange.com/questions/63390/how-to-decrease-spacing-before-chapter-title
\titlespacing*{\chapter}{0pt}{-50pt}{40pt}

\titleformat*{\section}{\LARGE}

\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}

\lstdefinestyle{mystyle}{
    backgroundcolor=\color{backcolour},
    commentstyle=\color{codegreen},
    keywordstyle=\color{magenta},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    keepspaces=true,
    numbers=left,
    numbersep=5pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    tabsize=2
}

\lstdefinelanguage{JavaScript}{
  keywords={await, process, async, break, case, catch, continue, debugger, default, delete, do, else, finally, for, function, if, in, instanceof, new, return, switch, this, throw, try, typeof, var, void, while, with},
  morecomment=[l]{//},
  morecomment=[s]{/*}{*/},
  morestring=[b]',
  morestring=[b]",
  sensitive=true
}

\lstset{style=mystyle}

% disable indentation of new paragraphs
% ::::::::::::::::::::::::::::::::::::::::::::::::: END OF MARK MAROLF CUSTOM PACKAGES AND SETTINGS ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

% Defines to specific todo commands
\setlength{\marginparwidth}{2.5cm}
\newcommand{\TODO}[1]
{\todo[prepend, caption={\textbf{Todo}}, size=\footnotesize]{\renewcommand{\baselinestretch}{0.85} \selectfont#1\par}}
\newcommand{\REMARK}[1]
{\todo[prepend, color=green, caption={\textbf{Remark}}, size=\footnotesize]{\renewcommand{\baselinestretch}{0.85} \selectfont#1\par}}
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagetrue
\newif\if@openright
\newif\if@mainmatter \@mainmattertrue
\newif\if@appendix \@appendixtrue
\if@compatibility\else
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}
   {\setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}}
\DeclareOption{b5paper}
   {\setlength\paperheight {250mm}%
    \setlength\paperwidth  {176mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{legalpaper}
   {\setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{executivepaper}
   {\setlength\paperheight {10.5in}%
    \setlength\paperwidth  {7.25in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\fi
\if@compatibility
  \renewcommand\@ptsize{0}
\else
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\fi
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\if@compatibility\else
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\fi
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\if@compatibility\else
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\fi
\DeclareOption{titlepage}{\@titlepagetrue}
\if@compatibility\else
\DeclareOption{notitlepage}{\@titlepagefalse}
\fi
\if@compatibility
\@openrighttrue
\else
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\fi
\if@compatibility\else
\DeclareOption{onecolumn}{\@twocolumnfalse}
\fi
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}
%kai \ExecuteOptions{letterpaper,10pt,twoside,onecolumn,final,openright}
%\ExecuteOptions{a4paper,11pt,oneside,onecolumn,final,openany,reqno}
\ExecuteOptions{a4paper,11pt,twoside,onecolumn,final,openright}%,reqno}	%kai
\ProcessOptions

\newcommand\keywords[1]{\gdef\@keywords{#1}}	   %kai
\newcommand\categories[1]{\gdef\@categories{#1}}   %kai
\newcommand\supervisors[1]{\gdef\@supervisors{#1}} %kai
\newcommand\email[1]{\gdef \@email{#1}}            % tobias
\newcommand\institute[1]{\gdef \@institute{#1}}    % tobias
\newcommand\thesistype[1]{\gdef \@thesistype{#1}}  % tobias
\newcommand\logo[1]{\gdef\@logo{#1}} % tobias

\logo{}
\keywords{}
\categories{}

\input{bk1\@ptsize.clo}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
%kai \setlength\parskip{0\p@ \@plus \p@}
\setlength\parskip{5\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\thepage\hfil\slshape\leftmark}%
      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
    \def\chaptermark##1{%
%kai      \markboth {\MakeUppercase{%
      \markright {{%
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
%kai            \@chapapp\ \thechapter. \ %
            \normalfont \thechapter. \ %
          \fi
        \fi
%tobias        ##1}}{}}%
        \scshape ##1}}{}}%
    \def\sectionmark##1{%
%     \markright {\MakeUppercase{%
%         \ifnum \c@secnumdepth >\z@
%           \thesection. \ %
%         \fi
%         \scshape ##1}}}}
% tobias
      \markright { %\MakeUppercase{%
        \ifnum \c@secnumdepth >\z@
          \normalfont \thesection. \ %
        \fi
        \scshape ##1}}}
\else
  \def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\chaptermark##1{%
%kai      \markright {\MakeUppercase{%
      \markright {{%
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
%kai            \@chapapp\ \thechapter. \ %
            \normalfont \thechapter. \ %
          \fi
        \fi
%tobias         ##1}}}}
        \scshape ##1}}}}
\fi
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
    }


  \if@titlepage
  \newcommand\maketitle{
  \hypersetup{pdfauthor=\@author}												%kai
	\hypersetup{pdftitle=\@title}													%kai
	\hypersetup{pdfkeywords=\@keywords}										%kai
	\hypersetup{pdfsubject=A Computer Science Thesis}%kai
  \pagenumbering{arabic} 		%kai
%  \refstepcounter{part} 		%kai
  \begin{titlepage}%
		\noindent
		\includegraphics[width=0.15\linewidth]{figures/logo_kantibaden.eps} \hfill
		\includegraphics[width=0.2\linewidth]{figures/ips}

		\vspace{1cm}

		\let\footnotesize\small
		\let\footnoterule\relax
		\let \footnote \thanks

		\begin{center}
			\begin{spacing}{1.8}
			  {\huge \bfseries \@title}
			\end{spacing}

			\large \@thesistype
		\end{center}

		% \vspace{0.2cm}

		\begin{center}
			\large
			\@author

			% \texttt{\small \@email}
    \end{center}%


		\begin{center}
			\@institute
		\end{center}

    \begin{figure}[h]
      \centering
      \includegraphics[width=\linewidth]{./figures/setup.jpg}
    \end{figure}

		\vfill

    \vspace{0.2cm}

    \begin{center}
      \vspace{0.2cm}
      \textbf{Primary Supervisor, Secondary Evaluator:}
      \\[2pt] \@supervisors
    \end{center}

		\begin{center}
			\@date
		\end{center}
  \end{titlepage}%
  %\refstepcounter{page}	 	%kai
  %\thispagestyle{plain}\@thanks


  \setcounter{footnote}{0}%
  \global\let\maketitle\relax
  \global\let\thanks\relax
  \global\let\@thanks\@empty
  \global\let\title\relax
  \global\let\@title\@empty
  \global\let\author\relax
  \global\let\@author\@empty
  \global\let\date\relax
  \global\let\@date\relax
  \global\let\and\relax
  \global\let\logo\relax
  \global\let\@logo\relax
  \global\let\email\relax
  \global\let\@email\relax
  \global\let\institute\relax
  \global\let\@institute\relax
  \global\let\supervisors\relax
  \global\let\@supervisors\relax
  \global\let\thesistype\relax
  \global\let\@thesistype\relax
}
\else
\newcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\LARGE \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em}
\fi

%kai: Comfortable marginal notes
\newcommand{\mParNotes}[1]{%
   \hskip 1sp \marginpar{\footnotesize\sffamily\raggedright #1}}

\newcommand{\mParNotesL}[1]{%
   \hskip 1sp \marginpar{\footnotesize\sffamily\raggedright
   \begin{flushright}\color{blue}#1 \\$\spadesuit$\end{flushright}}}

\newcommand{\mParNotesR}[1]{%
   \hskip 1sp \marginpar{\footnotesize\sffamily\raggedright
   \color{blue}#1\\$\spadesuit$}}



% \newtheorem{theorem}{Theorem}										%kai
% %\newtheorem{definition}[theorem]{Definition}		%kai
% %\newtheorem{lemma}[theorem]{Lemma}							%kai
% %\newtheorem{proposition}[theorem]{Proposition}	%kai
% %\newtheorem{example}[theorem]{Example}					%kai
% %\newtheorem{corollary}[theorem]{Corollary}			%kai
% %\newtheorem{condition}[theorem]{Condition}			%kai
% \newtheorem{axiom}[theorem]{Axiom}							%kai
% \newtheorem{case}[theorem]{Case}								%kai
% \newtheorem{claim}[theorem]{Claim}							%kai
% \newtheorem{conclusion}[theorem]{Conclusion}		%kai
% \newtheorem{conjecture}[theorem]{Conjecture}		%kai
% \newtheorem{criterion}[theorem]{Criterion}			%kai
% \newtheorem{exercise}[theorem]{Exercise}				%kai
% \newtheorem{notation}[theorem]{Notation}				%kai
% \newtheorem{problem}[theorem]{Problem}					%kai
% \newtheorem{remark}[theorem]{Remark}						%kai
% \newtheorem{summary}[theorem]{Summary}					%kai
%
% \newenvironment{proof}[1][Proof]{%
% %	\noindent\textbf{#1.} }{\hfill \rule{0.5em}{0.5em}}					%kai
% \noindent\textbf{#1.} }{\hfill $\Box$}      %tobias
% \newenvironment{solution}[1][Solution]{%
% 	\textbf{#1.} }{\ \rule{0.5em}{0.5em}}					%kai
%
% \@addtoreset {theorem}{chapter}                 %kai
% \renewcommand \thetheorem                       %kai
%      {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@theorem} %kai

\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{2}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\newcounter {appendix}

\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@arabic\c@chapter}
\renewcommand \thesection {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}

\newcommand\frontmatter{%
  \cleardoublepage
  \@mainmatterfalse
  \@appendixfalse
  \pagenumbering{arabic}}

\newcommand\mainmatter{%
  \cleardoublepage
  \@mainmattertrue
  \@appendixfalse
  \pagenumbering{arabic}}

\newcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmatterfalse}

\newcommand\appendix{
	\backmatter \par
	\@appendixtrue
	\refstepcounter{part} 		%kai
	\setcounter{chapter}{20}%
  \setcounter{section}{0}%
  \setcounter{appendix}{0}
  \gdef\thechapter{\Alph{appendix}}
  \gdef\@chapapp{\appendixname}%
  \setcounter{page}{1}
	\renewcommand{\thepage}{\Alph{appendix}-\arabic{page}}}

\newcommand\part{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{plain}%
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
  \null\vfil
  \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{Part \thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \huge\bfseries \partname\nobreakspace\thepart
       \par
       \vskip 20\p@
     \fi
     \Huge \bfseries #2\par}%
    \@endpart}
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
%kai     \Huge \bfseries #1\par}%
     \Large #1\par}%
    \@endpart}
\def\@endpart{\vfil\newpage
              \if@twoside
               \if@openright
                \null
                \thispagestyle{empty}%
                \newpage
               \fi
              \fi
              \if@tempswa
                \twocolumn
              \fi}
\newcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#1}%
                       \else
											   \if@appendix
											     \stepcounter{appendix}
													 \refstepcounter{chapter}
													 \setcounter{page}{1}
												 \fi
												 \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}

\def\@makechapterhead#1{%
	\ifnum\c@part=\@ne				%kai
		\ifnum\c@chapter=\@ne		%kai
		\pagenumbering{arabic}	%kai
		\fi											%kai
	\fi												%kai

	\begin{flushright}
		\parindent \z@ \normalfont
    \ifnum \c@secnumdepth >\m@ne
				\Large \textsc{\@chapapp} \space \thechapter
				\par \nobreak
		\fi
		\interlinepenalty\@M
		{\Huge \bfseries #1 \par\nobreak}
		\vskip 30\p@
		\hrule
		\vskip 80\p@
	\end{flushright}\par}

\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi}

\def\@makeschapterhead#1{%
% \vspace*{50\p@}%
  % \vspace*{-15\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
%kai    \Huge \bfseries  #1\par\nobreak
    \flushright \bfseries \Huge #1\par\nobreak
    % \vskip 40\p@
  }
  }
\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
																	 {\normalfont\Large\bfseries}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\large\bfseries}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}
\if@twocolumn
  \setlength\leftmargini  {2em}
%  \setlength\marginparwidth {.6@tempdima} %kai
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}

\newenvironment{abstract}
	{\chapter*{Abstract}}
	{\vfill					%kai
	\noindent				%kai
	\ifx \@keywords \@empty
		\relax
	\else
		{\bf Keywords:} \@keywords \\[6pt] %tobias
	\fi
%
	\ifx \@categories \@empty
		\relax
	\else
		{\bf CR Categories:} \@categories	%tobias
	\fi

	\addcontentsline{toc}{chapter}{Abstract}
	}

\newenvironment{zusammenfassung}
	{\chapter*{Zusammenfassung}}
	{\vfill					%kai
	\noindent				%kai
	%{\bf Keywords:} \@keywords \\			%kai
	%{\bf CR Categories:} \@categories	%kai
	\addcontentsline{toc}{chapter}{Zusammenfassung}
	}

\newenvironment{acknowledgements}
	{\chapter*{Acknowledgements}}												%kai
	{\addcontentsline{toc}{chapter}{Acknowledgements}}	%kai

\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\if@compatibility
\newenvironment{titlepage}
    {%
      \cleardoublepage
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\z@
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
    }
\else
\newenvironment{titlepage}
    {%
      \cleardoublepage
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\fi

\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset {equation}{chapter}
\newcounter{figure}[chapter]
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}[chapter]
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.85em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{2}
\newcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsname
        \@mkboth{\textsc{\contentsname}}{\textsc{\contentsname}}}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\newcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}
\newcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\chapter*{\bibname}%
      \addcontentsline{toc}{chapter}{\bibname}%kai
      \@mkboth{\textsc{\bibname}}{\textsc{\bibname}}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \twocolumn[\@makeschapterhead{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \columnseprule \z@
                \columnsep 35\p@
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\contentsname{Table of Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\bibname{Bibliography}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\chaptername{Chapter}
\newcommand\appendixname{Appendix}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{headings}
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi

\addtolength{\textwidth}{21.4pt}	%kai
\endinput
%%
%% End of file `book.cls'.
