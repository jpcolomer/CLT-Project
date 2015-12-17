\LoadClass[12pt]{article}
\ProvidesClass{project}

\RequirePackage[utf8]{inputenc}
\RequirePackage{ifthen}
\RequirePackage{fancyhdr}
\RequirePackage{amsmath,amsthm,amsfonts,amssymb}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{enumitem}
\RequirePackage{hyperref}
% \RequirePackage{pstricks}
% \RequirePackage{pst-node}
\RequirePackage[margin=1.2in]{geometry}

\theoremstyle{plain}
\theoremstyle{definition}
\theoremstyle{remark}

\newtheorem{theorem}{Theorem}
\newtheorem{corollary}{Corollary}
\newtheorem{lemma}{Lemma}
\newtheorem{proposition}{Proposition}
\newtheorem{defn}{Definition}
\newtheorem{Conjecture}{Conjecture}
\newtheorem{claim}{Claim}
\newtheorem{property}{Property}
\newtheorem*{sketch}{Sketch}
\newtheorem{remark}{Remark}
\newtheorem{example}{Example}
\newtheorem{algorithm}{Algorithm}

\newcommand{\studnameA}[1]{\gdef\@studnameA{#1}}
\newcommand{\studnameB}[1]{\gdef\@studnameB{#1}}
\newcommand{\studuniA}[1]{\gdef\@studuniA{#1}}
\newcommand{\studuniB}[1]{\gdef\@studuniB{#1}}
\newcommand{\coursename}[1]{\gdef\@coursename{#1}}
\newcommand{\norm}[1]{\left\lVert#1\right\rVert}

\let\Oldmaketitle\maketitle
\renewcommand{\maketitle}
{
	\Oldmaketitle
	\thispagestyle{plain}
}

\newcounter{begin}
\setcounter{begin}{1}

\let\Oldsection=\section
\renewcommand*{\section}{
	\ifthenelse{\equal{\value{begin}}{1}}
	{
		\setcounter{begin}{0}
	}
	{
	}
	\Oldsection
}

\fancypagestyle{plain}
{
	\fancyhead{}
	\fancyfoot{}
	\fancyfoot[LE,LO]{\@studuniA \ \& \@studuniB}
	\fancyfoot[RE,RO] {\thepage}
	\renewcommand{\headrulewidth}{0pt}
}

\pagestyle{fancy}

\fancyhead{}
\fancyfoot{}
\fancyhead[RE,RO]{Final Project}
\fancyhead[LE,LO]{\@coursename}
\fancyfoot[RE,RO] {\thepage}
\fancyfoot[LE,LO]{\@studuniA \ \& \@studuniB}
\renewcommand{\footrulewidth}{0.4 pt}

\newcounter{emptypages}
\setcounter{emptypages}{0}

\newcounter{sum}

\newcommand*{\skipevenpage}{
	\newpage
	\if@twoside
	\setcounter{sum}{\value{page}}
	\addtocounter{sum}{\value{emptypages}}
	\ifthenelse{\isodd{\value{sum}}}
	{
	}
	{
		\thispagestyle{empty}
		\hbox{}
		\newpage
		\addtocounter{page}{-1}
		\addtocounter{emptypages}{1}
	}
	{
	}
	\fi
}

\title{\@coursename \\ Final Project}
\author{\@studnameA \ - \texttt{\@studuniA @columbia.edu} \\ \@studnameB \ - \texttt{\@studuniB @columbia.edu}}
\date{\today}

\endinput
