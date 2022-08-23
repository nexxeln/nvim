local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup {}

vim.cmd [[
  nnoremap <silent><TAB> :BufferLineCycleNext<CR>
  nnoremap <silent><S-TAB> :BufferLineCyclePrev<CR>
  nnoremap <silent>;x :bdelete<CR>
]]
