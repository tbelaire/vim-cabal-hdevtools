
echom "HI THERE"
function! s:FindCabalSandbox()
   let l:sandbox    = finddir('.cabal-sandbox', './;../')
   let l:absSandbox = fnamemodify(l:sandbox, ':p')
   return l:absSandbox
endfunction

function! s:FindCabalSandboxPackageConf()
   return glob(s:FindCabalSandbox() . '*-packages.conf.d')
endfunction

function! s:HaskellSourceDir()
    " let l:cabal_file = findfile('*.cabal', '.;')
    " shell("normal! !extract-haskell-source-dir " . l:cabal_file)
    " exec 
    " exec "normal! !extract-haskell-source-dir " . l:cabal_file
    return "src"
endfunction

let g:hdevtools_options  = '-g-package-conf=' . s:FindCabalSandboxPackageConf()
let g:hdevtools_options .= ' ' . '-g-i' . s:HaskellSourceDir()

Bundle 'bitc/vim-hdevtools'
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell command! Type HdevtoolsType

