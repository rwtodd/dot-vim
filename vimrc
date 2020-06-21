vim9script

" I don't like to reach for escape...
inoremap fj <Esc>

" General settings I want as defaults -------------------------
set nocompatible
let mapleader = "-"
let localmapleader = "\\"
set hidden
set nohlsearch   
set visualbell
set number
set relativenumber
set encoding=utf8
set textwidth=0
set expandtab
setglobal fileencoding=utf8
syntax enable

" some variables used in commands -----------------------------
let g:rwt_blog = "~/src/ghio_pages"

" some global mappings ----------------------------------------
" UPPERCASE the current word while in insert mode
inoremap <c-u> <esc>viwUwa

" settings for blog posts... ----------------------------------
" Easy access to blog post directories
cabbrev <expr> bd@ g:rwt_blog .. '/_drafts'
cabbrev <expr> bp@ g:rwt_blog .. '/_posts/2020/2020'

" set up a blog post...
augroup blogging
  autocmd!
  execute "autocmd BufNewFile" g:rwt_blog .. "/*.md :execute \":normal"
      \ "I---\\<cr>layout: post\\<cr>title: \\\"\\\"\\<cr>tags:"
      \ "[ ]\\<cr>categories: [ ]\\<cr>---\\<cr>\\<esc>\""
  execute "autocmd BufNewFile,BufRead" g:rwt_blog .. "/*.md setlocal tw=77"
augroup END

autocmd!
autocmd FileType markdown :nnoremap <buffer> <localleader>h1 :execute "normal! I##\n\eka  "<cr>
autocmd FileType markdown :nnoremap <buffer> <localleader>h2 :execute "normal! I####\n\ekla  "<cr>
autocmd FileType markdown :nnoremap <buffer> <localleader>h3 :execute "normal! I######\n\ek2la  "<cr>
autocmd FileType markdown :nnoremap <buffer> <localleader>sc :execute "normal! I```\n```\n\ekO"<cr>
