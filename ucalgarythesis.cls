%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                    %%
%% This is file `ucalgarythesis.cls'. -- a document class for         %%
%% graduate theses at the University of Calgary. This class document  %%
%% is to be used in conjunction with the the thesis template file     %%
%% `ucalgarythesis.tex'.                                              %%
%%                                                                    %%   
%% Created by M.W. Girard, last updated 10 April 2016.                %%
%%                                                                    %%
%% This template was created to be in compliance with the University  %%
%% of Calgary thesis guidelines (version 14 April 2014)               %%
%%       https://grad.ucalgary.ca/current/thesis/guidelines.          %%
%%                                                                    %% 
%% The title page format is based on the previous class document      %%
%% (ucalgthes1.cls) that was provided by the University of Calgary,   %%
%% which was modified from Report Style by Deborah Teale January      %%
%% 1987 and last modified on 15 April 2012 by T.Zhang.                %%
%%                                                                    %% 
%%                                                                    %% 
%% This work may be distributed and/or modified under the conditions  %%
%% of the LaTeX Project Public License, either version 1.3c of this   %%
%% license or (at your option) any later version.                     %%
%% The latest version of this license is in                           %%
%%     http://www.latex-project.org/lppl.txt                          %%
%% and version 1.3c or later is part of all distributions of LaTeX    %%
%% version 2005/12/01 or later.                                       %%
%%                                                                    %% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                    %%
%%  ****************************************                          %%       
%%  *            REVISION HISTORY          *                          %%
%%  ****************************************                          %%
%%  01 Feb 2016 -- Document created (M.W. Girard)                     %%
%%                   - loads LaTeX standard book class                %%
%%  04 Feb 2016 -- Minor changes for simplification                   %%
%%  28 Mar 2016 -- Minor changes (as requested by FGS)                %%
%%  10 Apr 2016 -- Changed default font size to 12                    %% 
%%                                                                    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\providecommand{\classname}{ucalgarythesis}
\ProvidesClass{\classname}[2016/02/01 v1.0]

%%   ****************************************                         %%
%%   *               BASE CLASS             *                         %%
%%   ****************************************                         %%
%% Load base class using current setting for basic options.
\providecommand{\baseclass}{book}
\LoadClass[letterpaper,12pt]{\baseclass}

%%   ****************************************                         %%
%%   *             CLASS OPTIONS            *                         %%
%%   ****************************************                         %%

%% New option: binding (adds extra margins on binding side)
\newif\if@binding
\@bindingfalse

%% Options for binding 
\DeclareOption{binding}{\@bindingtrue}
\DeclareOption{nobinding}{\@bindingfalse}

%% Options for twosided or onesided printing
%% (For some reason, this needs to be here 
%% if though it already is part of the book
%% class)
\DeclareOption{twoside}{\@twosidetrue}
\DeclareOption{oneside}{\@twosidefalse}

%% Options for spacing (default is 1.5 spacing)
\DeclareOption{singlespaced}{\AtEndOfClass{\singlespacingnoskip}}
\DeclareOption{onehalfspaced}{\AtEndOfClass{\onehalfspacing}}
\DeclareOption{doublespaced}{\AtEndOfClass{\doublespacing}}

%% All other options are passed to the base class directly.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}

%%%%%%%%%%%%       OPTION EXECUTION       %%%%%%%%%%%%

%% Default settings.
 \ExecuteOptions{nobinding,oneside,doublespaced}

%% Process options.
 \ProcessOptions

%%   ****************************************                         %%
%%   *            NECESSARY COMMANDS        *                         %%
%%   ****************************************                         %%
%% If hyperref is not loaded, \phantomsection is defined to be empty.
\providecommand\phantomsection{}

%%   ****************************************                         %%
%%   *               PACKAGES               *                         %%
%%   ****************************************                         %%

\RequirePackage{geometry}
\RequirePackage{setspace}

%% As required by the University of Calgary 2014 thesis guidelines, 
%% all margins must be exactly 1 inch on all sides.

\geometry{hmargin={1in,1in},vmargin={1in,1in}}  

%% Submitted theses must not be bound. Extra copies of the thesis 
%% that are printed for personal use may be bound, in which case 
%% 1.5 inch margins shall be used on the binding edge.
\if@binding
 \geometry{bindingoffset=0.5in}
\fi

%%   ****************************************                         %%
%%   *              TITLE PAGE              *                         %%
%%   ****************************************                         %%

\newcommand{\makethesistitle}{
      \begin{titlepage}
      \thispagestyle{empty}
      \begin{center}
       UNIVERSITY OF CALGARY \\
       \vfill
        {\@title \par}          % Set title in size.
       \vfill                   % Vertical space after title.
       by \\
       \vfill
        {\@author \par }        % Set author 
       \vfill
        {A \@thesis} \par       % Allow the word dissertation to be used here
        SUBMITTED TO THE FACULTY OF GRADUATE STUDIES \par
        IN PARTIAL FULFILLMENT OF THE REQUIREMENTS FOR THE \par
        {DEGREE OF \@degree}
       \vfill
        \@dept \par
       \vfill
        {CALGARY, ALBERTA \par}
        {{\@monthname}, {\@gradyear} \par}
       \vfill
        {\copyright\ {\@author}~~{\@gradyear} \par}
      \end{center}
      \end{titlepage}
      \if@twoside\thispagestyle{empty}\else\fi
      \setcounter{page}{2}
      \cleardoublepage
}
%%
%% Commands for the thesis title page
%%
\def\dept#1{\gdef\@dept{\uppercase{#1}}}
\def\degree#1{\gdef\@degree{\uppercase{#1}}}
\def\monthname#1{\gdef\@monthname{#1}}
\def\gradyear#1{\gdef\@gradyear{#1}}
\def\thesis#1{\gdef\@thesis{\uppercase{#1}}}

%%   ****************************************                         %%
%%   *       FRONT MATTER SECTIONS          *                         %%
%%   ****************************************                         %%

%% *** Abstract environment ***
\newenvironment{thesisabstract}{
      \phantomsection
      \addcontentsline{toc}{chapter}{Abstract}
      \begin{center}%
        \section*{Abstract}
      \end{center}
      }{}

%% *** Dedication environment ***
\newenvironment{dedication}{\par\vspace*{.15\textheight}\centering}%
     {\par}

%% *** Define addsymbol macro for list of symbols ***
\def\addsymbol #1: #2{$#1$ \> \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \   \parbox{5in}{#2}\\}

%% *** Epigraph quote environment  ***
%% (For placing quotes in the epigraph)

%% (As per 2014 thesis guidelines, quotes in the epigraph must be 
%% 20 spaces from the left margin. Since a standard space is 
%% typically .333em, this distance is set to 6.6666em.)

\def\epiquote{\list{}{\leftmargin 6.666em}\item[]}
\let\endepiquote=\endlist

%%    ****************************************                        %%
%%    *             PAGE STYLES              *                        %%
%%    ****************************************                        %%

%% Redefine plain page style to have page numbers in upper outer 
%% corner if twoside option is used (as regulated by the University 
%% of Calgary 2014 thesis guidelines). Normally, theses should not 
%% be printed double sided and page numbers should always be in the 
%% bottom center of the page. 
%%
%% The location of the page number must be consistent throughout the 
%% entire document.

\if@twoside
\def\ps@plain{\let\@mkboth\@gobbletwo%
     \def\@oddhead{\reset@font\hfil\thepage}
     \let\@oddfoot\@empty%
     \def\@evenhead{\reset@font\thepage\hfil}%
     \let\@evenfoot\@empty
     }
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%    ****************************************                         %%
%    *           INITIALIZATION             *                         %%
%    ****************************************                         %%

\setcounter{secnumdepth}{2}      % Section numbering goes only down to 
                                 %  subsection (not subsubsection, etc).
\thesis{thesis}                  % Default is thesis.
\ps@plain                        % Default page style is plain.
\onecolumn                       % Single column.
\if@twoside\else\raggedbottom\fi % Ragged bottom unless twoside option.
\doublespacing                   % Double spacing.

%%
%% End of file `ucalgarythesis.cls'.
