%===================================================

%===================================================

%导入需要的宏包
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm,mathrsfs,upgreek}
\RequirePackage{fancyhdr}


%依赖的Latex版本
\NeedsTeXFormat{LaTeX2e}[2005/12/01]
%声明本文档为模板类
\ProvidesClass{BJTU-thesis}[2018/4/27]


%根据用户选项LoadClass
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\newif\if@isEnMaster\@isEnMasterfalse
\newif\if@isAcMaster\@isAcMasterfalse
\newif\if@isDoctor\@isDoctorfalse
\newif\if@isTwoSide\@isTwoSidefalse
%专硕
\DeclareOption{EnMaster}{\@isEnMastertrue}
%学硕
\DeclareOption{AcMaster}{\@isAcMastertrue}
%博士
\DeclareOption{Doctor}{\@isDoctortrue}
\DeclareOption{twoside}{\@isTwoSidetrue}
\ProcessOptions\relax
\if@isTwoSide
\LoadClass[zihao=-4,a4paper,twoside,openright,UTF8,space=auto]{ctexbook}
\else
\LoadClass[zihao=-4,a4paper,oneside,openright,UTF8,space=auto]{ctexbook}
\fi



%定义使用者需要填写的标签
\def\BJTU@label@schoolNumber{学校代码:~}
\def\BJTU@label@classification{密级:~}
\def\BJTU@label@author{作者姓名:~}
\def\BJTU@label@studentNumber{学~~~~~~号:~}
\def\BJTU@label@advisor{导师姓名:~}
\def\BJTU@label@advisorTitle{职~~~~~~称:~}
\def\BJTU@label@engineeringMasterField{工程硕士专业领域:~}
\def\BJTU@label@degreeLevel{学位级别:~}
\def\BJTU@label@degreeType{学位类别:~}
\def\BJTU@label@major{学科专业:~}
\def\BJTU@label@researchArea{研究方向:~}

%定义上述标签的默认值
\def\BJTU@value@schoolNumber{10004}
\def\BJTU@value@classification{公开}
\def\BJTU@value@author{XXXX}
\def\BJTU@value@studentNumber{XXXX}
\def\BJTU@value@advisor{XXXX}
\def\BJTU@value@advisorTitle{XXXX}
\def\BJTU@value@engineeringMasterField{XXXX}
\if@isDoctor
\def\BJTU@value@degreeLevel{博士}
\else
\def\BJTU@value@degreeLevel{硕士}
\fi
\def\BJTU@value@degreeType{XXXX}
\def\BJTU@value@major{XXXX}
\def\BJTU@value@researchArea{XXXX}
\def\BJTU@value@title{中文题目}
\def\BJTU@value@englishtitle{英文题目}




%定义用户填写上述标签对应值的命令,需要用户在主文档自行调用
\newcommand\schooNumber[1]{\def\BJTU@value@schoolNumber{#1}}
\newcommand\classification[1]{\def\BJTU@value@classification{#1}}
\renewcommand\author[1]{\def\BJTU@value@author{#1}}
\newcommand\studentNumber[1]{\def\BJTU@value@studentNumber{#1}}
\newcommand\advisor[1]{\def\BJTU@value@advisor{#1}}
\newcommand\advisorTitle[1]{\def\BJTU@value@advisorTitle{#1}}
\newcommand\engineeringMasterField[1]{\def\BJTU@value@engineeringMasterField{#1}}
\newcommand\degreeType[1]{\def\BJTU@value@degreeType{#1}}
\newcommand\major[1]{\def\BJTU@value@major{#1}}
\newcommand\researchArea[1]{\def\BJTU@value@researchArea{#1}}
\newcommand\englishtitle[1]{\def\BJTU@value@englishtitle{#1}}
\renewcommand\title[1]{\def\BJTU@value@title{#1}}


%版权授权书
\newcommand{\makeAuthorization}{
	\chapter*{学位论文版权使用授权书}
	\thispagestyle{empty}
	本学位论文作者完全了解北京交通大学有关保留、使用学位论文的规定。特授权北京交通大学可以将学位论文的全部或部分内容编入有关数据库进行检索，提供阅览服务，并采用影印、缩印或扫描等复制手段保存、汇编以供查阅和借阅。同意学校向国家有关部门或机构送交论文的复印件和磁盘。学校可以为存在馆际合作关系的兄弟高校用户提供文献传递服务和交换服务。
	
	（保密的学位论文在解密后适用本授权说明）
	
	\vspace{72pt}
	学位论文作者签名：~~~~~~~~~~~~~~~~~~~~~~~导师签名：
	
	\vspace{12pt}
	签字日期：~~~~~~年~~~月~~~日~~~~~~~~~~~~~~签字日期：~~~~~年~~~月~~~日 
}


%制作内封
\newcommand{\makeInfo}{
	\newpage
	\pagenumbering{roman}
	\thispagestyle{plain}
	{\songti\zihao{5}\noindent\BJTU@label@schoolNumber\BJTU@value@schoolNumber}
	\hfill
	{\songti\zihao{5}\BJTU@label@classification\BJTU@value@classification}
	%这里控制上下间距
	\vspace{31.5pt}
	\begin{center}
		{\kaishu\zihao{0}北~京~交~通~大~学\\}
		%这里控制上下间距
		\if@isDoctor
		{\songti\zihao{2}博~士~学~位~论~文\\}
		\else
		{\songti\zihao{2}硕~士~学~位~论~文\\}
		\fi
		%这里控制上下间距
		\vspace{44pt}
		{\songti\zihao{-3}\BJTU@value@title\\}
		%这里控制上下间距
		\vspace{15pt}
		{\songti\zihao{-3}\BJTU@value@englishtitle\\}
	\end{center}
	%这里控制上下间距
	\vspace{48pt}
	{\songti\zihao{4}
		\begin{tabular}{lp{30mm}l}
			\BJTU@label@author \BJTU@value@author& &\BJTU@label@studentNumber \BJTU@value@studentNumber \\
			\\
			\BJTU@label@advisor \BJTU@value@advisor& &\BJTU@label@advisorTitle \BJTU@value@advisorTitle \\
			\\
			\if@isEnMaster
			\BJTU@label@engineeringMasterField \BJTU@value@engineeringMasterField& &\BJTU@label@degreeLevel \BJTU@value@degreeLevel \\
			\else
			\BJTU@label@degreeType \BJTU@value@degreeType& &\BJTU@label@degreeLevel \BJTU@value@degreeLevel \\
			\\
			\BJTU@label@major \BJTU@value@major& &\BJTU@label@researchArea \BJTU@value@researchArea \\
			\fi
		\end{tabular}
	}
	\vfill
	\begin{center}
		{\songti\zihao{4}北京交通大学\\ \vspace{10pt}2018年4月}
	\end{center}
}


%重新定义致谢环境
\renewenvironment{thanks}{
	\chapter*{致谢}\thispagestyle{plain}
}{}



%定义中文摘要环境
%%页眉部分加章标题的问题尚未解决
\newenvironment{abstract}{
	\chapter*{摘要}
	\markboth{摘要}{摘要}
	\addcontentsline{toc}{chapter}{摘要}
}{}

%定义英文摘要环境
\newenvironment{englishabstract}{
	\chapter*{ABSTRACT}
	\markboth{ABSTRACT}{ABSTRACT}
	\addcontentsline{toc}{chapter}{ABSTRACT}
}{}

%定义中英文关键词命令
\newcommand{\keywords}[1]{\textbf{关键词：}#1}
\newcommand{\englishkeywords}[1]{\textbf{KEYWORDS:~}#1}



%%定义正文的页眉页脚格式
\def\BJTU@chapter{}
\fancypagestyle{BJTU@heading}{
	\fancyhf{}
	\fancyhead[L]{
		\if@isDoctor
		北京交通大学博士学位论文
		\else
		北京交通大学硕士学位论文
		\fi
	}
	\fancyhead[R]{\leftmark}
	\fancyfoot[C]{\thepage}
}



%%设置页边距和装订线
\usepackage[
top=3.5cm,
bottom=2.5cm,
left=2.5cm,
right=2.5cm,
bindingoffset=1cm,
headheight=15pt
]{geometry}

%% 设置章节格式
\ctexset{chapter={
		name={},
		number = {\arabic{chapter}},
		format = {\heiti \centering \zihao{3}},
		pagestyle = {BJTU@heading},
		beforeskip = 28bp,
		afterskip = 20bp,
		fixskip = true,
	}
}

%% 设置一级章节格式
\ctexset{section={
		format={\raggedright \bfseries \sffamily \zihao{4}},
		beforeskip = 28bp plus 1ex minus .2ex,
		afterskip = 24bp plus .2ex,
		fixskip = true,
	}
}

% 设置二级标题格式

%黑体小四加粗顶左，单倍行距，序号与题目间空一个汉字符

\ctexset{subsection={
		format = {\bfseries \sffamily \raggedright \zihao{-4}},
		beforeskip =28bp plus 1ex minus .2ex,
		afterskip = 24bp plus .2ex,
		fixskip = true,
	}
}

% 设置三节标题格式：黑体小四居左书写，单倍行距，序号与题目间空一个汉字符

\ctexset{subsubsection={
		format={\heiti \raggedright \zihao{-4}},
		beforeskip=28bp plus 1ex minus .2ex,
		afterskip=24bp plus .2ex,
		fixskip=true,
	}
}


%目录
\ifxetex  % xelatex
\RequirePackage[xetex]{hyperref}
\hypersetup{
	bookmarksnumbered,
	colorlinks,
	linkcolor=black,
	citecolor=black,
	plainpages=false,
	pdfstartview=FitH
}
\else
\ifpdf
\RequirePackage[pdftex,unicode]{hyperref}
\else
\RequirePackage[dvipdfmx,unicode]{hyperref}
\fi
\fi

%\addtocontents{toc}{\protect\hypersetup{hidelinks}}
\addtocontents{lot}{\protect\hypersetup{hidelinks}}
\addtocontents{lof}{\protect\hypersetup{hidelinks}}

\RequirePackage{titletoc}
\titlecontents{chapter}[0pt]{\songti \zihao{4}}
{\thecontentslabel\hspace{\ccwd}}{}
{\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{section}[2\ccwd]{\songti \zihao{-4}}
{\thecontentslabel\hspace{\ccwd}}{}
{\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{subsection}[4\ccwd]{\songti \zihao{-4}}
{\thecontentslabel\hspace{\ccwd}}{}
{\hspace{.5em}\titlerule*{.}\contentspage}

\titlecontents{figure}[0pt]{\songti\zihao{-4}}
{\figurename~\thecontentslabel\quad}{\hspace*{-1.5cm}}
{\hspace{.5em}\titlerule*{.}\contentspage}

\titlecontents{table}[0pt]{\songti\zihao{-4}}
{\tablename~\thecontentslabel\quad}{\hspace*{-1.5cm}}
{\hspace{.5em}\titlerule*{.}\contentspage}

\renewcommand\tableofcontents{%
	\chapter*{\contentsname}%目录里显示“目录”，否则\chapter*
	\@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
	\pdfbookmark[0]{目录}{bittoc}
	\@starttoc{toc}%
}



%设定文档页眉页脚
\pagestyle{BJTU@heading}
%必须在设置完文档的页眉页脚格式之后再重定义此命令
\renewcommand{\chaptermark}[1]{
	\markboth{#1}{}
}




\endinput