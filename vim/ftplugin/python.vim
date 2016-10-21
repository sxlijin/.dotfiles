setlocal    ts=4 sts=4 sw=4  et

" use autopep8 with 120 max line width
set formatprg=autopep8\ --max-line-length\ 120\ -
nnoremap <F8> mx gggqG `x :delmarks x<CR>

