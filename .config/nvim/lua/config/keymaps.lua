local map = vim.keymap

vim.g.mapleader = " "

-- exit insert mode
map.set("i", "jj", "<ESC>")

-- exit visual mode
map.set("v", "<leader>jj", "<ESC>")

-- dont copy to buffer on deleting char
map.set("n", "x", '"_x')

-- clear search highlights
map.set("n", "<leader>nh", ":nohl<CR>")

-- increment / decrement
map.set("n", "+", "<C-a>")
map.set("n", "-", "<C-x>")

-- indentation
map.set("v", "<", "<gv")
map.set("v", ">", ">gv")

-- window management
map.set("n", "<leader>sv", "<C-w>v") -- split window vertically
map.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
map.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
map.set("n", "<leader>sx", ":close<CR>") -- close current split window

map.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
-- map.set("n", "<leader>tx", ":bd<CR>") -- close current tab
-- map.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
-- map.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- restart lsp server (not on youtube nvim video)
map.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- barbar
map.set("n", "<Tab>", "<Cmd>BufferNext<CR>", {})
map.set("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", {})

map.set("n", "<A->>", "<Cmd>BufferMoveNext<CR>", {})
map.set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", {})

map.set("n", "<leader>1", "<Cmd>BufferGoto 1<CR>")
map.set("n", "<leader>2", "<Cmd>BufferGoto 2<CR>")
map.set("n", "<leader>3", "<Cmd>BufferGoto 3<CR>")
map.set("n", "<leader>4", "<Cmd>BufferGoto 4<CR>")
map.set("n", "<leader>5", "<Cmd>BufferGoto 5<CR>")
map.set("n", "<leader>6", "<Cmd>BufferGoto 6<CR>")
map.set("n", "<leader>7", "<Cmd>BufferGoto 7<CR>")
map.set("n", "<leader>8", "<Cmd>BufferGoto 8<CR>")
map.set("n", "<leader>9", "<Cmd>BufferGoto 9<CR>")
map.set("n", "<leader>0", "<Cmd>BufferLast<CR>")

map.set("n", "<leader>tp", "<Cmd>BufferPin<CR>")
map.set("n", "<leader>tx", "<Cmd>BufferClose<CR>")

map.set("n", "<leader>tj", "<Cmd>BufferPick<CR>")
map.set("n", "<leader>td", "<Cmd>BufferPick<CR>")

map.set("n", "<leader>tsn", "<Cmd>BufferOrderByBufferNumber<CR>")
map.set("n", "<leader>tsd", "<Cmd>BufferOrderByDirectory<CR>")
map.set("n", "<leader>tsl", "<Cmd>BufferOrderByLanguage<CR>")
map.set("n", "<leader>tsw", "<Cmd>BufferOrderByWindowNumber<CR>")

-- trouble
map.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
map.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
map.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
map.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
map.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
map.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })
