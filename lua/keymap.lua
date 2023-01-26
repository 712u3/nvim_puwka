M = {}

vim.g.mapleader = " "

-- Better window movement
vim.keymap.set("n", "J", "<C-w>j")
vim.keymap.set("n", "K", "<C-w>k")
vim.keymap.set("n", "L", "<C-w>l")  -- look custom_functions/NetrwMapping
vim.keymap.set("n", "H", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>-")
vim.keymap.set("n", "<C-k>", "<C-w>+")
-- vim.keymap.set("n", "<C-l>", "<C-w>>")  -- look custom_functions/NetrwMapping
vim.keymap.set("n", "<C-h>", "<cmd>vertical res -5<CR>")

-- Save file by CTRL-S
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("i", "<C-s>", "<ESC> :w<CR>")

-- misc
vim.keymap.set("n", "<F8>", ":mksession .mysession.vim<CR>")
vim.keymap.set("n", "<F9>", ":source .mysession.vim<CR>")
vim.keymap.set("n", "<F11>", "<cmd>exec &nu==&rnu? 'se nu!' : 'se rnu!'<CR>")
vim.keymap.set("n", "<F12>", ":set list!<CR>")
vim.keymap.set("n", "<ESC>", ":noh<CR><ESC>")
vim.keymap.set("i", "<C-c>", "<Esc>") -- exit from vertical insert without insert
vim.keymap.set("n", "q", "<nop>")
vim.keymap.set("n", "Q", "<nop>")

-- Step on each wrapped line
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Verymagic
vim.keymap.set("n", "/", "/\\v")
vim.keymap.set("v", "/", "/\\v")
vim.keymap.set("n", "?", "?\\v")
vim.keymap.set("v", "?", "?\\v")

-- Move lines like a batya
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", "<Leader>j", "mzJ`z") -- join next line

-- Keep cursor in the middle of the screen. n/N in searching
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Nice copy/paste
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
-- vim.keymap.set("n", "Y", "yg$")
-- vim.keymap.set('n', '<Leader>y', '"*y')
-- vim.keymap.set('n', '<Leader>p', '"*p')
-- vim.keymap.set('n', '<Leader>Y', '"+y')
-- vim.keymap.set('n', '<Leader>P', '"+p')

-- Don't yank on delete
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "X", '"_X')
vim.keymap.set("v", "x", '"_x')
vim.keymap.set("v", "X", '"_X')
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<Leader>t", ":enew<CR>")
vim.keymap.set("n", "<leader>[", ":bp!<CR>")
vim.keymap.set("n", "<leader>]", ":bn!<CR>")
vim.keymap.set("n", "<leader>q", ":bd<CR>")
vim.keymap.set("n", "<leader>Q", ":qa!<CR>")
vim.keymap.set("n", "<leader>R", ":e!<CR>")
vim.keymap.set("n", "<Leader>z", ":exec 'call CloseAllBuffersButCurrentSoft()'<CR>")
vim.keymap.set("n", "<Leader>Z", ":exec 'call CloseAllBuffersButCurrentHard()'<CR>")


-- debug starts with d
vim.keymap.set("n", "<Leader>dt", ":lua require('dapui').toggle()<CR>")
vim.keymap.set("n", "<Leader>db", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<Leader>dr", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<Leader>do", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<Leader>di", ":lua require'dap'.step_into()<CR>")

-- Default filetree
vim.keymap.set("n", "<leader>e", ":call ToggleNetrw()<CR>")

-- telescope starts with f
local telescope = require('telescope.builtin')
vim.keymap.set("n", "<leader>fp", telescope.find_files, {})
vim.keymap.set("n", "<leader>fg", telescope.git_files, {})
vim.keymap.set("n", "<leader>ff", require('telescope').extensions.live_grep_args.live_grep_args)
vim.keymap.set("n", "<leader>fb", telescope.buffers, {})
vim.keymap.set("n", "<leader>fh", telescope.help_tags, {})   -- vim help
vim.keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>", {})   -- vim help
vim.keymap.set("n", "<leader>fr", telescope.oldfiles, { desc = "[?] Find recently opened files" })
-- vim.keymap.set("n", "<leader>fs", telescope.lsp_document_symbols) -- useless
-- vim.keymap.set("n", "<leader>fs", telescope.lsp_dynamic_workspace_symbols) -- useless
-- vim.keymap.set("n", "---------", telescope.lsp_references, { desc = "[G]oto [R]eferences" }) -- not telescope for some reason
-- vim.keymap.set('n', '<leader>fp', function() telescope.grep_string({ search = vim.fn.input("Grep > ") }) end) -- useless

vim.keymap.set("n", "<Leader>,", ":cp<CR>")
vim.keymap.set("n", "<Leader>.", ":cn<CR>")

-- Fun, rename word in file (sed)
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")


function M.lsp_mappings(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)                -- definition
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)               -- declaration
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)            -- implementation
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)                -- references
  vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)            -- rename
  vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)     -- diagnostic
  vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, opts)             -- hover
  vim.keymap.set("n", "<leader>lt", vim.lsp.buf.type_definition, opts)                    -- type_definition
  -- vim.keymap.set("n", "<leader>ls", function() vim.lsp.buf.workspace_symbol() end, opts)  -- kakoito useless
  -- vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)              -- next diagnostic
  -- vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)              -- prev diagnostic
  -- vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)      -- hz
  -- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)         -- hz
end

--   nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
--   nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
--   nmap('<leader>wl', function()
--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--   end, '[W]orkspace [L]ist Folders')
-- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
--     vim.lsp.buf.format()
--   end, { desc = 'Format current buffer with LSP' })
-- vim.keymap.set("n", "<leader>lf", function()
--   vim.lsp.buf.format()
-- end)




function M.git_mappings(bufnr)
  local gs = package.loaded.gitsigns

  local function map(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
  end

  -- Navigation
  map('n', '<leader>g[', function()
    if vim.wo.diff then return ']c' end
    vim.schedule(function() gs.next_hunk() end)
    return '<Ignore>'
  end, {expr=true})

  map('n', '<leader>g]', function()
    if vim.wo.diff then return '[c' end
    vim.schedule(function() gs.prev_hunk() end)
    return '<Ignore>'
  end, {expr=true})

  -- Actions
  -- map({'n', 'v'}, '<leader>gq', ':Gitsigns stage_hunk<CR>')    -- NEVER
  -- map({'n', 'v'}, '<leader>gw', ':Gitsigns reset_hunk<CR>')    -- NEVER
  -- map('n', '<leader>ge', gs.stage_buffer)                      -- NEVER
  -- map('n', '<leader>gr', gs.undo_stage_hunk)                   -- NEVER
  -- map('n', '<leader>gt', gs.reset_buffer)                      -- NEVER
  map('n', '<leader>gp', gs.preview_hunk)
  map('n', '<leader>gP', gs.toggle_deleted)
  map('n', '<leader>gB', function() gs.blame_line{full=true} end)
  map('n', '<leader>gb', gs.toggle_current_line_blame)
  map('n', '<leader>gd', gs.diffthis)
  map('n', '<leader>gD', function() gs.diffthis('~') end)

  -- Text object
  map({'o', 'x'}, '<leader>gc', ':<C-U>Gitsigns select_hunk<CR>')
end

return M

-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })







































