vim9script

" I don't like to reach for escape...
inoremap fj <Esc>

" General settings I want as defaults -------------------------
set nocompatible
let g:mapleader = "-"
let g:localmapleader = "\\"
set hidden
set nohlsearch   
set visualbell
set number
set relativenumber
set encoding=utf8
set textwidth=0
set expandtab
setglobal fileencoding=utf8

" some variables used in commands -----------------------------
let g:rwt_blog = "~/src/ghio_pages"

" some global mappings ----------------------------------------
" UPPERCASE the current word while in insert mode
inoremap <c-u> <esc>viwUwa
nnoremap <leader>ev :edit $MYVIMRC<cr>

" settings for blog posts... ----------------------------------
" Easy access to blog post directories
cabbrev <expr> bd@ g:rwt_blog .. '/_drafts'
cabbrev <expr> bp@ g:rwt_blog .. '/_posts/2020/2020'

# set up a blog post...
augroup rwtBlogging
  autocmd!
  execute "autocmd BufNewFile" g:rwt_blog .. "/*.md :execute \":normal"
      \ "I---\\<cr>layout: post\\<cr>title: \\\"\\\"\\<cr>tags:"
      \ "[ ]\\<cr>categories: [ ]\\<cr>---\\<cr>\\<esc>\""
  execute "autocmd BufNewFile,BufRead" g:rwt_blog .. "/*.md setlocal tw=77"
  autocmd FileType markdown :inoreabbrev <buffer> h1# <esc>i# <esc>a#<esc>hi
  autocmd FileType markdown :inoreabbrev <buffer> h2# <esc>i## <esc>a##<esc>2hi
  autocmd FileType markdown :inoreabbrev <buffer> h3# <esc>i### <esc>a###<esc>3hi
  autocmd FileType markdown :inoreabbrev <buffer> h4# <esc>i#### <esc>a####<esc>4hi
  autocmd FileType markdown :inoreabbrev <buffer> sc# ```<cr>```<cr><esc>2kA
augroup END

syntax on
