%===================================================

%===================================================

%导入需要的宏包
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm,mathrsfs,upgreek}

%依赖的Latex版本
\NeedsTeXFormat{LaTeX2e}[2005/12/01]
%声明本文档为模板类
\ProvidesClass{BJTU-Thesis}[2018/4/27]

%设置页面
\usepackage[%
paper=a4paper,
top=3cm,%
bottom=2.5cm,
left=2.5cm,
right=2.5cm,
headheight=1.0cm,
footskip=0.7cm
]{geometry}



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
\def\BJTU@label@studentNumber{学~~~~~~~~号:~}
\def\BJTU@label@advisor{导师姓名:~}
\def\BJTU@label@advisorTitle{职~~~~~~~~称:~}
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
\def\BJTU@value@degreeLevel{硕士/博士}
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
\newcommand\degreeLevel[1]{\def\BJTU@value@degreeLevel{#1}}
\newcommand\degreeType[1]{\def\BJTU@value@degreeType{#1}}
\newcommand\major[1]{\def\BJTU@value@major{#1}}
\newcommand\researchArea[1]{\def\BJTU@value@researchArea{#1}}
\newcommand\englishtitle[1]{\def\BJTU@value@englishtitle{#1}}
\renewcommand\title[1]{\def\BJTU@value@title{#1}}


\newcommand{\makeInfo}{
	\newpage
	\pagenumbering{roman}
	\thispagestyle{plain}
	{\songti\zihao{5}\noindent\BJTU@label@schoolNumber\BJTU@value@schoolNumber}
	\hfill
	{\songti\zihao{5}\BJTU@label@classification\BJTU@value@classification}
	%这里控制上下间距
	\begin{center}
		{\kaishu\zihao{0}北京交通大学\\}
		%这里控制上下间距
		\if@isDoctor
		{\songti\zihao{2}博士学位论文\\}
		\else
		{\songti\zihao{2}硕士学位论文\\}
		\fi
		%这里控制上下间距
		{\songti\zihao{-3}\BJTU@value@title\\}
		%这里控制上下间距
		{\songti\zihao{-3}\BJTU@value@englishtitle\\}
	\end{center}
	%这里控制上下间距
	{\songti\zihao{4}
		\begin{tabular}{lp{30mm}l}
			\BJTU@label@author \BJTU@value@author& &\BJTU@label@studentNumber \BJTU@value@studentNumber \\
			\\
			\BJTU@label@advisor \BJTU@value@advisor& &\BJTU@label@advisorTitle \BJTU@value@advisorTitle \\
			\\
			\if@isAcMaster
			\BJTU@label@degreeType \BJTU@value@degreeType& &\BJTU@label@degreeLevel \BJTU@value@degreeLevel \\
			\\
			\BJTU@label@major \BJTU@value@major& &\BJTU@label@researchArea \BJTU@value@researchArea \\
			\fi
			\if@isEnMaster
			\BJTU@label@engineeringMasterField \BJTU@value@engineeringMasterField& &\BJTU@label@degreeLevel \BJTU@value@degreeLevel \\
			\fi
		\end{tabular}
	}
}
































\endinput