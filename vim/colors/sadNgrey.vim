" sadNgrey
" Author:  MikereDD
" URL:     http://github.com/MikereDD/home/blob/master/vim/colors/sadNgrey.vim
" My WIP vim colorscheme ...

set background=dark
if version > 580
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif

set t_Co=256
let g:colors_name = "sadNgrey"

" Basic Layout {{{

hi Normal          ctermfg=252 ctermbg=234 cterm=NONE
hi Folded          ctermfg=181 ctermbg=234 cterm=NONE
hi CursorLine      ctermbg=237 cterm=NONE
hi CursorColumn    ctermfg=NONE ctermbg=237 cterm=NONE
hi ColorColumn     ctermfg=NONE ctermbg=237 cterm=NONE
hi LineNr          ctermfg=8 ctermbg=234 cterm=NONE
hi FoldColumn      ctermfg=181 ctermbg=238 cterm=NONE
hi VertSplit       ctermfg=236 ctermbg=252 cterm=NONE
hi Search          ctermfg=NONE ctermbg=131 cterm=NONE
hi IncSearch       ctermfg=NONE ctermbg=131 cterm=NONE
hi Operator        ctermfg=15 ctermbg=NONE cterm=NONE
hi MatchParen      ctermfg=230 ctermbg=16 cterm=NONE

" }}}

" Syntax {{{

hi Boolean         ctermfg=181 ctermbg=NONE cterm=bold
hi Comment         ctermfg=8 ctermbg=NONE cterm=NONE
hi Character       ctermfg=181 ctermbg=NONE cterm=bold
hi Number          ctermfg=145 ctermbg=234 cterm=NONE
hi String          ctermfg=174 ctermbg=NONE cterm=NONE
hi Conditional     ctermfg=15 ctermbg=NONE cterm=bold
hi Constant        ctermfg=181 ctermbg=NONE cterm=bold
hi Debug           ctermfg=181 ctermbg=NONE cterm=bold
hi Define          ctermfg=223 ctermbg=NONE cterm=bold
hi Delimiter       ctermfg=245 ctermbg=NONE cterm=NONE
hi Float           ctermfg=103 ctermbg=NONE cterm=NONE
hi Function        ctermfg=228 ctermbg=NONE cterm=NONE
hi Identifier      ctermfg=15 ctermbg=NONE cterm=NONE
hi Error           ctermfg=196 ctermbg=237 cterm=NONE
hi Keyword         ctermfg=15 ctermbg=NONE cterm=bold
hi Label           ctermfg=123 ctermbg=NONE cterm=underline
hi Macro           ctermfg=223 ctermbg=NONE cterm=bold
hi SpecialKey      ctermfg=8 ctermbg=NONE cterm=NONE

" }}}

" Diffs {{{

hi DiffAdd        ctermfg=NONE ctermbg=95 cterm=NONE
hi DiffChange     ctermfg=NONE ctermbg=236 cterm=NONE
hi DiffDelete     ctermfg=236 ctermbg=238 cterm=NONE
hi DiffText       ctermfg=15 ctermbg=234 cterm=bold

" }}}

" Cursor {{{

hi Cursor        ctermfg=NONE ctermbg=145 cterm=NONE
hi iCursor       ctermfg=NONE ctermbg=145 cterm=NONE
hi vCursor       ctermfg=NONE ctermbg=145 cterm=NONE

" }}}

" Block Colors {{{

hi BlockColor1   ctermfg=244 ctermbg=NONE cterm=NONE
hi BlockColor2   ctermfg=246 ctermbg=NONE cterm=NONE
hi BlockColor3   ctermfg=248 ctermbg=NONE cterm=NONE
hi BlockColor4   ctermfg=250 ctermbg=NONE cterm=NONE

" }}}

" Makegreen {{{

hi GreenBar ctermfg=NONE ctermbg=40 cterm=NONE term=reverse
hi RedBar   ctermfg=NONE ctermbg=52 cterm=NONE term=reverse

" }}}

" EasyMotion {{{

hi EasyMotionTarget   ctermfg=15 ctermbg=303030 cterm=bold
hi EasyMotionShade    ctermfg=238 ctermbg=NONE cterm=NONE

" }}}

hi Directory       ctermfg=15 ctermbg=NONE cterm=bold
hi ErrorMsg        ctermfg=NONE ctermbg=44 cterm=NONE
hi Exception       ctermfg=123 ctermbg=NONE cterm=underline
hi Ignore          ctermfg=NONE ctermbg=NONE cterm=NONE


hi InterestingWord1  ctermfg=227 ctermbg=NONE cterm=NONE
hi InterestingWord2  ctermfg=177 ctermbg=NONE cterm=NONE
hi InterestingWord3  ctermfg=105 ctermbg=NONE cterm=NONE


hi ModeMsg         ctermfg=181 ctermbg=NONE cterm=bold
hi MoreMsg         ctermfg=15 ctermbg=NONE cterm=bold

" Completion Menu {{{
hi PMenu           ctermfg=236 ctermbg=252 cterm=NONE
hi PMenuSel        ctermfg=236 ctermbg=210 cterm=NONE
hi PMenuSbar       ctermfg=NONE ctermbg=235 cterm=NONE
hi PMenuThumb      ctermfg=NONE ctermbg=8 cterm=NONE
" }}}

hi PrieCondit      ctermfg=180 ctermbg=235 cterm=bold
hi PreProc         ctermfg=223 ctermbg=NONE cterm=bold
hi Question        ctermfg=15 ctermbg=NONE cterm=bold
hi Repeat          ctermfg=123 ctermbg=NONE cterm=underline

" marks column
hi IndentGuides    ctermfg=NONE ctermbg=237 cterm=NONE
hi SignColumn      ctermfg=228 ctermbg=232 cterm=NONE
hi SpecialChar     ctermfg=181 ctermbg=NONE cterm=bold
hi SpecialComment  ctermfg=181 ctermbg=NONE cterm=bold
hi Special         ctermfg=8 ctermbg=NONE cterm=NONE
hi SpecialKey      ctermfg=8 ctermbg=NONE cterm=NONE
hi Statement       ctermfg=123 ctermbg=NONE cterm=NONE
hi StatusLine      ctermfg=236 ctermbg=210 cterm=NONE
"hi StatusLineNC
hi StorageClass    ctermfg=15 ctermbg=NONE cterm=bold
hi Structure       ctermfg=15 ctermbg=NONE cterm=bold,underline
hi Tag             ctermfg=181 ctermbg=NONE cterm=bold
hi Title           ctermfg=15 ctermbg=236 cterm=bold
hi Todo            ctermfg=15 ctermbg=NONE cterm=bold

hi Typedef         ctermfg=15 ctermbg=NONE cterm=bold,underline
hi Type            ctermfg=15 ctermbg=NONE cterm=bold
"hi Underlined

hi WarningMsg      ctermfg=15 ctermbg=236 cterm=bold
hi WildMenu        ctermfg=NONE ctermbg=235 cterm=NONE

"hi MyTagListFileName

" Spelling {{{
if has("spell")
    hi SpellBad    ctermfg=93 ctermbg=NONE cterm=bold,underline
    hi SpellCap    ctermfg=NONE ctermbg=93 cterm=bold
    hi SpellLocal  ctermfg=81 ctermbg=NONE cterm=bold,underline
    hi SpellRare   ctermfg=NONE ctermbg=81 cterm=bold
endif
" }}}
" Visual Mode {{{
hi VisualNOS  ctermfg=236 ctermbg=210 cterm=bold,underline
hi Visual     ctermfg=236 ctermbg=210 cterm=NONE
" }}}
" Invisible character colors {{{
highlight NonText     ctermfg=234 ctermbg=NONE cterm=NONE
highlight SpecialKey  ctermfg=8 ctermbg=NONE cterm=NONE
" }}}
