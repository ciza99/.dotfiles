local map = vim.keymap

vim.g.mapleader = " "

-- exit insert mode
map.set("i", "jk", "<ESC>")

-- exit visual mode
map.set("v", "<leader>jk", "<ESC>")

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

-- quickfix list
map.set("n", "<leader>q", ":copen<CR>")
map.set("n", "<leader>qn", ":cnext<CR>")
map.set("n", "<leader>qp", ":cprev<CR>")

-- split management
map.set("n", "<leader>s|", "<C-w>v") -- split vertically
map.set("n", "<leader>s_", "<C-w>s") -- split horizontally
map.set("n", "<leader>sV", "<C-w>_") -- change split vertical size
map.set("n", "<leader>sH", "<C-w>|") -- change split horizontal size
map.set("n", "<leader>sk", "<C-w>+") -- increase split height
map.set("n", "<leader>sj", "<C-w>-") -- decrease split height
map.set("n", "<leader>sh", "<C-w><") -- decrease split width
map.set("n", "<leader>sl", "<C-w>>") -- increase split width
map.set("n", "<leader>se", "<C-w>=") -- make splits equal size
map.set("n", "<leader>sx", ":close<CR>") -- close current split window
map.set("n", "<leader>sw", "<C-w>o") -- wipeout other splits

map.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
-- map.set("n", "<leader>tx", ":bd<CR>") -- close current tab
-- map.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
-- map.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- restart lsp server
map.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- buffers
vim.api.nvim_set_keymap("n", "<leader>bk", "<Cmd>blast<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "<leader>bj", "<Cmd>bfirst<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "<leader>bh", "<Cmd>bprev<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "<leader>bl", "<Cmd>bnext<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "<leader>bd", "<Cmd>bdelete<enter>", { noremap = false })

-- map.set("n", "<Tab>", "<Cmd>BufferNext<CR>", {})
-- map.set("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", {})
--
-- map.set("n", "<A->>", "<Cmd>BufferMoveNext<CR>", {})
-- map.set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", {})
--
-- map.set("n", "<leader>1", "<Cmd>BufferGoto 1<CR>")
-- map.set("n", "<leader>2", "<Cmd>BufferGoto 2<CR>")
-- map.set("n", "<leader>3", "<Cmd>BufferGoto 3<CR>")
-- map.set("n", "<leader>4", "<Cmd>BufferGoto 4<CR>")
-- map.set("n", "<leader>5", "<Cmd>BufferGoto 5<CR>")
-- map.set("n", "<leader>6", "<Cmd>BufferGoto 6<CR>")
-- map.set("n", "<leader>7", "<Cmd>BufferGoto 7<CR>")
-- map.set("n", "<leader>8", "<Cmd>BufferGoto 8<CR>")
-- map.set("n", "<leader>9", "<Cmd>BufferGoto 9<CR>")
-- map.set("n", "<leader>0", "<Cmd>BufferLast<CR>")
--
-- map.set("n", "<leader>tp", "<Cmd>BufferPin<CR>")
-- map.set("n", "<leader>tx", "<Cmd>BufferClose<CR>")
--
-- map.set("n", "<leader>tj", "<Cmd>BufferPick<CR>")
-- map.set("n", "<leader>td", "<Cmd>BufferPickDelete<CR>")
--
-- map.set("n", "<leader>tw", "<Cmd>BufferWipeout<CR>")
--
-- map.set("n", "<leader>tsn", "<Cmd>BufferOrderByBufferNumber<CR>")
-- map.set("n", "<leader>tsd", "<Cmd>BufferOrderByDirectory<CR>")
-- map.set("n", "<leader>tsl", "<Cmd>BufferOrderByLanguage<CR>")
-- map.set("n", "<leader>tsw", "<Cmd>BufferOrderByWindowNumber<CR>")
