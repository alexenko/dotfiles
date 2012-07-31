" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=4
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

"Set the textwidth of each line to 100
set textwidth=100

"Force vsplit to open on the right, not left
set splitright

"Enable spellcheck
"set spell

let g:Tex_CompileRule_pdf = 'latexmk -pdf $*'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_pdf = 'evince'
let g:Tex_GotoError = 1
nnoremap \z (j>>gq)
