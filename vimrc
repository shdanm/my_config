
" Убираем совместимость с vi
set nocompatible                                    

" no backup files
set nobackup         

" only in case you don't want a backup file while editing
set nowritebackup    

" no swap files
set noswapfile       

" set charset translation encoding
set encoding=utf-8                                  
"пернос длинны[] строк с отступом
set breakindent 
" переключение кодировок  по F6 tab
set wcm=<TAB>
menu Encoding.utf-8 :e! ++enc=utf-8<CR> :set fileencodings=utf8
menu Encoding.cp866 :e! ++enc=866<CR> :set fileencodings=utf8
menu Encoding.windows-1251 :e! ++enc=cp1251<CR> :set fileencodings=utf8
menu Encoding.koi8-r :e! ++enc=koi8-r<CR> :set fileencodings=utf8
map <F6> :emenu Encoding.<TAB>

"tab настройка
set smarttab
set expandtab

"Автоматическое обновление файла при его изменении
set autoread         

"Вкл подсветки
syntax on            

" подсветка результатов поиска
set hlsearch 

" предварительный просмотр поиск
set incsearch 

"Отступы
set autoindent
set smartindent

"Выделить строку на которой курсор
set cursorline                              

"нумерация строк
set number                                  

"шрифт
set guifont=Lucida_Console:h12:cRUSSIAN::   

" переключение между кириллицей и латиницей нажатием Ctrl+^
set keymap=russian-jcukenwin  
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

"Vim может не признавать русские буквы за буквы,
"из-за чего не будут корректно работать команды,
"связанные с выделением слов.
set iskeyword=@,a-z,A-Z,48-57,_,128-175,192-255

" проверка орфографии
" setlocal spell spelllang=ru_ru,en_us

"===========================================================
" Vim-Plug  менеджер пакетов
"===========================================================

call plug#begin()

" color scheme
Plug 'morhetz/gruvbox'

"строка статуса/состояния
Plug 'vim-airline/vim-airline'                          
Plug 'vim-airline/vim-airline-themes'

"навигация по директориям
Plug 'scrooloose/nerdtree' , {'on': 'NERDTreeToggle'}   

"навигация по/функциям/переменным
Plug 'majutsushi/tagbar'                                

"парные скобки
Plug 'jiangmiao/auto-pairs'                             

"комментарии
Plug 'tomtom/tcomment_vim'                              

"окружить выделение парой двойных скобок
Plug 'tpope/vim-surround'                               

"поиск файлов  
Plug 'kien/ctrlp.vim'

"table
Plug 'dhruvasagar/vim-table-mode'                       

" HTML
Plug 'mattn/emmet-vim'
call plug#end()

"===========================================================
" Setting plug
"===========================================================

" color scheme
set background=dark
colorscheme gruvbox


" setting Emmett
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall 

" setting Vim-Airline
set laststatus=2  " всегда показываем статус бар
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'


"===========================================================
"mappings
"===========================================================

" перемещение по строкам 
map j gj
map k gk

" on nerd tree
map <C-n> :NERDTreeToggle<CR>:vertical resize 25<cr>

" on tag bar
nnoremap <F4> :TagbarToggle<CR>

" удаление буфера
inoremap <C-q> <Esc>:bd<CR>
nnoremap <C-q> :bd<CR>
"переключение буфера
nmap [b :bn<CR>
nmap ]b :bp<CR>
"Управление окнами
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" отключение подсветки поиска
nnoremap <silent> <C-\> :<C-u>nohlsearch<CR><C-l>

if has("autocmd")
  "Включаем определение типов файлов
  filetype on
  autocmd FileType python setlocal ts=4 sts=4 sw=4 et
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noet
  autocmd FileType html setlocal ts=2 sts=2 sw=2 noet
  autocmd FileType xml setlocal ts=2 sts=2 sw=2 noet
  autocmd FileType css setlocal ts=2 sts=2 sw=2 noet
  autocmd FileType vim setlocal ts=2 sts=2 sw=2 noet

endif
"=============НАСТРОЙКИ СВОРАЧИВАНИЯ БЛОКОВ КОДА (фолдинг)=============
set foldenable " отклключить фолдинг по умолчанию
set foldmethod=syntax " определять блоки на основе синтаксиса файла
"set foldmethod=indent " определять блоки на основе отступов
set foldnestmax=3       "deepest fold is 3 levels
"set foldcolumn=10 " показать полосу для управления сворачиванием
set foldlevel=1 " Первый уровень вложенности открыт, остальные закрыты
"set foldopen=all " автоматическое открытие сверток при заходе в них
