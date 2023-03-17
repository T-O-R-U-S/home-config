set termguicolors
set number

colorscheme monokai_pro

" Bind SPC-t-o to NvimTreeOpen
nnoremap <Space>to :NvimTreeOpen<CR>

" Bind SPC-f-f to Telescope
nnoremap <Space>ff :Telescope find_files<CR>

" Bind SPC-v-b to create a bottom terminal
nnoremap <Space>vb <C-w>s<C-w><down>:terminal<CR>i

tnoremap <Esc> <C-\><C-n>
