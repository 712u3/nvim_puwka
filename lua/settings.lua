vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "~/.local/share/nvim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true  -- Case insensitive searching UNLESS /C or capital in search

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "121"
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 20

-- vim.opt.listchars = 'eol:↴,tab:>-,trail:~,extends:>,precedes:<,space:⋅'
vim.opt.listchars:append "eol:↴"
-- vim.opt.path = vim.opt.path + '**'  -- vrode bez etogo rabotaet
-- vim.opt.mouse = ''
-- vim.opt.wrap = true
vim.opt.cursorline = true
-- vim.opt.hidden = false  -- pohodu poumolchaniu
-- vim.opt.laststatus = 2  -- pohodu poumolchaniu
-- vim.opt.ruler = true    -- pohodu poumolchaniu
-- vim.o.completeopt = 'menuone,noselect'

vim.api.nvim_set_option("clipboard","unnamed")
