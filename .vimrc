" Eklenti yöneticisi: vim-plug
call plug#begin('~/.vim/plugged')

" Kod tamamlama ve dil sunucusu entegrasyonu
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Dosya gezgini
Plug 'preservim/nerdtree'

" Durum çubuğu
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Hata denetleme ve formatlama
Plug 'dense-analysis/ale'

" Kod biçimlendirme
Plug 'rhysd/vim-clang-format'

" Debugging
Plug 'puremourning/vimspector'

call plug#end()

" Genel Ayarlar
set number                " Satır numaralarını göster
set relativenumber        " Göreceli satır numaraları
set tabstop=4             " Tab genişliği 4 boşluk
set shiftwidth=4          " Otomatik girinti genişliği
set expandtab             " Tab yerine boşluk kullan
set autoindent            " Otomatik girinti
set cursorline            " İmleç satırını vurgula
syntax on                 " Sözdizimi vurgulama
set background=dark       " Koyu tema
set showmatch             " Parantez eşleşmelerini göster

" Arama Ayarları
set ignorecase            " Büyük/küçük harf duyarsız arama
set smartcase             " Büyük harf kullanılırsa duyarlı hale getir
set incsearch             " Arama sırasında sonuçları göster
set hlsearch              " Arama sonuçlarını vurgula

" NERDTree Ayarları
nnoremap <C-n> :NERDTreeToggle<CR> " Ctrl+n ile NERDTree aç/kapat

" Airline Tema
let g:airline_theme='dark'

" ClangFormat Kısayolu
nnoremap <F3> :ClangFormat<CR>

" Kod Tamamlama (CoC.nvim)
" C++ için clangd kullanımı
let g:coc_global_extensions = ['coc-clangd']

" ALE Ayarları
let g:ale_linters = {
\   'cpp': ['clang', 'cppcheck'],
\}
let g:ale_fixers = {
\   'cpp': ['clang-format'],
\}
let g:ale_cpp_clang_executable = 'clang'
let g:ale_fix_on_save = 1

" Derleme ve Çalıştırma Kısayolu
autocmd FileType cpp nnoremap <F5> :!g++ -std=c++17 -Wall % -o %< && ./%<<CR>

" Vimspector Ayarları (Debugging)
nnoremap <F9> :call vimspector#Launch()<CR>
nnoremap <F10> :call vimspector#StepOver()<CR>
nnoremap <F11> :call vimspector#StepInto()<CR>
nnoremap <F12> :call vimspector#StepOut()<CR>
inoremap <silent> <expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"
