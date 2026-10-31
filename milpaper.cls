\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{milpaper}[2026/10/31 Military theory course paper]
\LoadClass[UTF8,a4paper,zihao=-4,fontset=fandol,scheme=plain]{ctexart}
% Increase header-to-text separation while keeping the header's page position.
\RequirePackage[left=20mm,right=20mm,top=21.2mm,bottom=16mm,headheight=15pt,headsep=6mm,footskip=8mm]{geometry}
\RequirePackage{fontspec}
% Use fonts bundled with TeX Live / Overleaf; no system font uploads required.
\setmainfont{texgyretermes-regular.otf}[
  BoldFont=texgyretermes-bold.otf,
  ItalicFont=texgyretermes-italic.otf,
  BoldItalicFont=texgyretermes-bolditalic.otf]
\setCJKfamilyfont{paperhei}{FandolHei-Regular.otf}[BoldFont=FandolHei-Bold.otf]
\setCJKfamilyfont{paperkai}{FandolKai-Regular.otf}[AutoFakeBold=2]
\renewcommand{\heiti}{\CJKfamily{paperhei}}
\renewcommand{\kaishu}{\CJKfamily{paperkai}}
\newfontfamily\paperSongLatin{FandolSong-Regular.otf}
\newfontfamily\paperKaiLatin{FandolKai-Regular.otf}
\RequirePackage{graphicx,booktabs,tabularx,array}
\RequirePackage{tikz}
\usetikzlibrary{arrows.meta,positioning,calc}
\RequirePackage{caption}
\RequirePackage{needspace}
\RequirePackage{url}
\RequirePackage[hidelinks,unicode,pdfencoding=auto]{hyperref}
% GB/T 7714-2025 numerical references, generated from .bib data by Biber.
\RequirePackage[backend=biber,style=gb7714-2025,sorting=none,
  maxbibnames=3,minbibnames=3]{biblatex}
% Course preference: Chinese author separators and italic English et al.
\DeclareDelimFormat[bib,biblist]{multinamedelim}{%
  \iffieldequalstr{userf}{chinese}{，}{\addcomma\space}}
\DeclareDelimFormat[bib,biblist]{finalnamedelim}{\printdelim{multinamedelim}}
\DeclareDelimFormat[bib,biblist]{andothersdelim}{\printdelim{multinamedelim}}
\DefineBibliographyStrings{english}{andothers={\mkbibemph{et\addabbrvspace al\adddot}}}
\RequirePackage{etoolbox}
\RequirePackage{fancyhdr}
\urlstyle{same}
\setlength{\parindent}{2em}
\setlength{\parskip}{0pt}
\linespread{1.42}
\newcommand{\paperRunningTitle}{}
\newcommand{\paperPageStyle}{%
  \fancyhf{}%
  \fancyhead[C]{{\linespread{1}\zihao{-5}\songti\paperSongLatin\authorname：\paperRunningTitle}}%
  \fancyhead[R]{{\linespread{1}\zihao{-5}\songti\paperSongLatin\thepage}}%
  \renewcommand{\headrulewidth}{0.4pt}%
  \renewcommand{\footrulewidth}{0pt}%
}
\pagestyle{fancy}
\paperPageStyle
\fancypagestyle{plain}{\paperPageStyle}
\setlength{\emergencystretch}{2em}
\widowpenalty=10000
\clubpenalty=10000
\ctexset{
  section={format=\heiti\bfseries\zihao{4}\raggedright,number=\arabic{section},
    aftername=\hspace{.6em},beforeskip=13pt,afterskip=6pt,afterindent=true},
  subsection={format=\heiti\bfseries\zihao{-4}\raggedright,number=\thesection.\arabic{subsection},
    aftername=\hspace{.6em},beforeskip=8pt,afterskip=4pt,afterindent=true},
  subsubsection={format=\kaishu\zihao{-4}\raggedright,number=\thesubsection.\arabic{subsubsection},afterindent=true}
}
\captionsetup{font=small,labelsep=quad,skip=5pt}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}
\renewcommand{\refname}{参考文献}
\renewcommand{\thefigure}{\arabic{figure}}
\renewcommand{\thetable}{\arabic{table}}
\setlength{\textfloatsep}{10pt}
\setlength{\intextsep}{10pt}
\newcommand{\sourceNote}[1]{\par\vspace{2pt}{\centering\zihao{-5} #1\par}}
\newcommand{\paperTitle}[2]{%
  \gdef\paperRunningTitle{#1}%
  \if\relax\detokenize\expandafter{#2}\relax\else
    \gdef\paperRunningTitle{#1——#2}%
  \fi
  % Set metadata before the first page is shipped out.
  \hypersetup{pdftitle={\paperRunningTitle},pdfsubject={军事理论课程论文},pdfauthor={},pdfkeywords={}}%
  \begin{center}
    \vspace*{.5mm}% Leave breathing room below the first-page running header.
    {\heiti\zihao{-2} #1\par}
    \if\relax\detokenize\expandafter{#2}\relax\else
      \vspace{4pt}
      {\heiti\zihao{-2} #2\par}
    \fi
    \vspace{8pt}
    {\kaishu\paperKaiLatin\zihao{4} \authorname{}，\studentnumber\par}
  \end{center}\vspace{1pt}}
\newenvironment{cnabstract}{\begingroup\zihao{-5}\kaishu\setlength{\parindent}{0pt}\noindent\textnormal{\heiti\bfseries 摘\quad 要：}}{\par\endgroup\vspace{3pt}}
\newcommand{\cnkeywords}[1]{{\zihao{-5}\noindent\textnormal{\heiti\bfseries 关键词：}\kaishu #1\par}}
\newcommand{\englishTitle}[1]{\begin{center}\vspace{4pt}{\bfseries\fontsize{12}{15}\selectfont #1\par}\vspace{5pt}{\fontsize{10.5}{13}\selectfont \authorenglish, Student No.\ \studentnumber\par}\end{center}}
\newenvironment{enabstract}{\begingroup\linespread{1}\fontsize{9}{12}\selectfont\setlength{\parindent}{0pt}\noindent\textbf{Abstract: }}{\par\endgroup\vspace{3pt}}
\newcommand{\enkeywords}[1]{{\linespread{1}\fontsize{9}{12}\selectfont\noindent\textbf{Key words: }#1\par}\vspace{5pt}}
\defbibheading{bibliography}[\refname]{\subsection*{#1}}
\renewcommand*{\bibfont}{\rmfamily\kaishu\zihao{6}\linespread{1.18}\selectfont}
\setlength{\bibitemsep}{3pt}
\setlength{\bibparsep}{0pt}
