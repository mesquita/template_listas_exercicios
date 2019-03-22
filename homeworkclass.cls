\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homeworkclass}

\LoadClass{article}


\usepackage[brazil]{babel}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}

\usepackage{fancyhdr} % Required for custom headers
\usepackage{lastpage} % Required to determine the last page for the footer
\usepackage{extramarks} % Required for headers and footers
\usepackage[usenames,dvipsnames]{color} % Required for custom colors
\usepackage{graphicx} % Required to insert images
\usepackage{listings} % Required for insertion of code
\usepackage{courier} % Required for the courier font
\usepackage{lipsum} % Used for inserting dummy 'Lorem ipsum' text into the template

\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{epstopdf}
\usepackage{subcaption}

% Margins
\topmargin=-0.45in
\evensidemargin=0in
\oddsidemargin=0in
\textwidth=6.5in
\textheight=9.0in
\headsep=0.25in

\linespread{1.1} % Line spacing

% Set up the header and footer
\pagestyle{fancy}
\lhead{\show@hmwkAuthorShortName} % Top left header
\chead{\show@hmwkTitle} % Top center head
\rhead{\firstxmark} % Top right header
\lfoot{\lastxmark} % Bottom left footer
\cfoot{} % Bottom center footer
\rfoot{Pág.\ \thepage\ de\ \protect\pageref{LastPage}} % Bottom right footer
\renewcommand\headrulewidth{0.4pt} % Size of the header rule
\renewcommand\footrulewidth{0.4pt} % Size of the footer rule

\setlength\parindent{0pt} % Removes all indentation from paragraphs

%----------------------------------------------------------------------------------------
%	CODE INCLUSION CONFIGURATION
%----------------------------------------------------------------------------------------

\definecolor{MyDarkGreen}{rgb}{0.0,0.4,0.0} % This is the color used for comments
\lstloadlanguages{Matlab} % Load Perl syntax for listings, for a list of other languages supported see: ftp://ftp.tex.ac.uk/tex-archive/macros/latex/contrib/listings/listings.pdf

\lstset{language=Matlab, % Use Perl in this example
	frame=single, % Single frame around code
	basicstyle=\small\ttfamily, % Use small true type font
	keywordstyle=[1]\color{Blue}\bf, % Perl functions bold and blue
	keywordstyle=[2]\color{Purple}, % Perl function arguments purple
	keywordstyle=[3]\color{Blue}\underbar, % Custom functions underlined and blue
	identifierstyle=, % Nothing special about identifiers                                         
	commentstyle=\usefont{T1}{pcr}{m}{sl}\color{MyDarkGreen}\small, % Comments small dark green courier font
	stringstyle=\color{Purple}, % Strings are purple
	showstringspaces=false, % Don't put marks in string spaces
	tabsize=5, % 5 spaces per tab
	%
	%FIX para o problema de enconding
	extendedchars=true,
	literate={á}{{\'a}}1 {ã}{{\~a}}1 {é}{{\'e}}1 {ê}{{\^e}}1 {í}{{\'i}}1 {ú}{{\'u}}1 {ó}{{\'o}}1 {õ}{{\~o}}1 {ç}{{\c{c}}}1,
	% Put standard Perl functions not included in the default language here
	morekeywords={rand, exprnd,rng},
	%
	% Put Perl function parameters here
	morekeywords=[2]{on, off, interp},
	%
	% Put user defined functions here
	morekeywords=[3]{test},
	%
	morecomment=[l][\color{Blue}]{...}, % Line continuation (...) like blue comment
	numbers=left, % Line numbers on left
	firstnumber=1, % Line numbers start with line 1
	numberstyle=\tiny\color{Blue}, % Line numbers are blue and small
	stepnumber=5 % Line numbers go in steps of 5
}

%Muda Listing #: para Trecho #
\renewcommand{\lstlistingname}{Trecho}

% Creates a new command to include a perl script, the first parameter is the filename of the script (without .pl), the second parameter is the caption
\newcommand{\script}[2]{
	\begin{itemize}
		\item[]\lstinputlisting[caption=#2,label=#1]{#1}
	\end{itemize}
}

%----------------------------------------------------------------------------------------
%	DOCUMENT STRUCTURE COMMANDS
%	Skip this unless you know what you're doing
%----------------------------------------------------------------------------------------

% Header and footer for when a page split occurs within a problem environment
\newcommand{\enterProblemHeader}[1]{
	\nobreak\extramarks{#1}{#1 continua na próxima página\ldots}\nobreak
	\nobreak\extramarks{#1 (continuação)}{#1 continua na próxima página\ldots}\nobreak
	
}

% Header and footer for when a page split occurs between problem environments
\newcommand{\exitProblemHeader}[1]{
	\nobreak\extramarks{#1 (continuação)}{#1 continua na próxima página\ldots}\nobreak
	
	
	\addtocounter{homeworkProblemCounter}{1}
	\nobreak\extramarks{Questão \arabic{homeworkProblemCounter}}{}\nobreak
	\addtocounter{homeworkProblemCounter}{-1}
}

\setcounter{secnumdepth}{0} % Removes default section numbers
\newcounter{homeworkProblemCounter} % Creates a counter to keep track of the number of problems

\newcommand{\homeworkProblemName}{}


\newenvironment{homeworkProblem}[1][Questão \arabic{homeworkProblemCounter}]
{ % Makes a new environment called homeworkProblem which takes 1 argument (custom name) but the default is "Problem #"
	\stepcounter{homeworkProblemCounter} % Increase counter for number of problems
	\setcounter{homeworkItemCounter}{0}
	\renewcommand{\homeworkProblemName}{#1} % n \homeworkProblemName the name of the problem
	\section{\homeworkProblemName} % Make a section in the document with the custom problem count
	\enterProblemHeader{\homeworkProblemName} % Header and footer within the environment
}
{
	\exitProblemHeader{\homeworkProblemName} % Header and footer after the environment
}


\newcounter{homeworkItemCounter}
%\newcommand{\homeworkItemName}{}
%\new\hmwkTitleenvironment{homeworkItem}[1][Item \alph{homeworkItemCounter}]{
%\stepcounter{homeworkItemCounter}
%\renewcommand{\homeworkProblemName}{#1}
%\subsection{\homeworkItemName}
%}


\newcommand{\problemAnswer}[1]{ % Defines the problem answer command with the content as the only argument
	\noindent\framebox[\columnwidth][c]{\begin{minipage}{0.98\columnwidth}#1\end{minipage}} % Makes the box around the problem answer and puts the content inside
}

\newcommand{\homeworkSectionName}{}
\newenvironment{homeworkSection}[1][Item \alph{homeworkItemCounter})]{ % New environment for sections within homework problems, takes 1 argument - the name of the section
	\stepcounter{homeworkItemCounter}
	\renewcommand{\homeworkSectionName}{#1} % Assign \homeworkSectionName to the name of the section from the environment argument
	\subsection{\homeworkSectionName} % Make a subsection with the custom name of the subsection
	\enterProblemHeader{\homeworkProblemName\ [\homeworkSectionName]} % Header and footer within the environment
}{
	\enterProblemHeader{\homeworkProblemName} % Header and footer after the environment
}


%----------------------------------------------------------------------------------------
%	NAME AND CLASS SECTION
%----------------------------------------------------------------------------------------

% Assignment title
\global\let\@hmwkTitle\@empty
\newcommand{\sethmwkTitle}[1]{\def\@hmwkTitle{#1}}
\let\hmwkTitle\sethmwkTitle %
\newcommand{\show@hmwkTitle}{\@hmwkTitle}

% Due date
\global\let\@hmwkDueDate\@empty
\newcommand{\sethmwkDueDate}[1]{\def\@hmwkDueDate{#1}}
\let\hmwkDueDate\sethmwkDueDate %
\newcommand{\show@hmwkDueDate}{\@hmwkDueDate}

% Course/class
\global\let\@hmwkClass\@empty
\newcommand{\sethmwkClass}[1]{\def\@hmwkClass{#1}}
\let\hmwkClass\sethmwkClass %
\newcommand{\show@hmwkClass}{\@hmwkClass}

% Class/lecture time
\global\let\@hmwkClassTime\@empty
\newcommand{\sethmwkClassTime}[1]{\def\@hmwkClassTime{#1}}
\let\hmwkClassTime\sethmwkClassTime %
\newcommand{\show@hmwkClassTime}{\@hmwkClassTime}

% Teacher/lecturer
\global\let\@hmwkClassInstructor\@empty
\newcommand{\sethmwkClassInstructor}[1]{\def\@hmwkClassInstructor{#1}}
\let\hmwkClassInstructor\sethmwkClassInstructor %
\newcommand{\show@hmwkClassInstructor}{\@hmwkClassInstructor}

 % Your name
\global\let\@hmwkAuthorName\@empty
\newcommand{\sethmwkAuthorName}[1]{\def\@hmwkAuthorName{#1}}
\let\hmwkAuthorName\sethmwkAuthorName %
\newcommand{\show@hmwkAuthorName}{\@hmwkAuthorName}

% Nome que aparece no cabeçalho
\global\let\@hmwkAuthorShortName\@empty
\newcommand{\sethmwkAuthorShortName}[1]{\def\@hmwkAuthorShortName{#1}}
\let\hmwkAuthorShortName\sethmwkAuthorShortName %
\newcommand{\show@hmwkAuthorShortName}{\@hmwkAuthorShortName}


%----------------------------------------------------------------------------------------
%	TITLE PAGE
%----------------------------------------------------------------------------------------

\title{
	\vspace{2in}
	\textmd{\textbf{\show@hmwkClass:\\ \show@hmwkTitle}}\\
	\normalsize\vspace{0.1in}\small{Data\ de\ entrega:\ \show@hmwkDueDate}\\
	\vspace{0.1in}\large{\textit{\show@hmwkClassInstructor,\ \show@hmwkClassTime}}
	\vspace{3in}
}

\author{\textbf{\show@hmwkAuthorName}}
\date{} % Insert date here if you want it to appear below your name

%----------------------------------------------------------------------------------------