-- Keymaps for better default experience

-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- For conciseness
local opts = { noremap = true, silent = true }

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Allow moving the cursor through wrapped lines with j, k
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- clear highlights
vim.keymap.set('n', '<Esc>', ':noh<CR>', opts)

-- save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- save file without auto-formatting
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- quit file
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', ':Bdelete!<CR>', opts)   -- close buffer
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer

-- Increment/decrement numbers
vim.keymap.set('n', '<leader>+', '<C-a>', opts) -- increment
vim.keymap.set('n', '<leader>-', '<C-x>', opts) -- decrement

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', opts)      -- split window vertically
vim.keymap.set('n', '<leader>h', '<C-w>s', opts)      -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts)     -- make split windows equal width & height
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts)   -- open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts)     --  go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts)     --  go to previous tab

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Press jk fast to exit insert mode
vim.keymap.set('i', 'jk', '<ESC>', opts)
vim.keymap.set('i', 'kj', '<ESC>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Move text up and down
vim.keymap.set('v', '<A-j>', ':m .+1<CR>==', opts)
vim.keymap.set('v', '<A-k>', ':m .-2<CR>==', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Replace word under cursor
vim.keymap.set('n', '<leader>j', '*``cgn', opts)

-- Explicitly yank to system clipboard (highlighted and entire row)
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

-- Toggle diagnostics
local diagnostics_active = true

vim.keymap.set('n', '<leader>do', function()
    diagnostics_active = not diagnostics_active
    if diagnostics_active then
        vim.diagnostic.enable(false)
    else
        vim.diagnostic.disable(false)
    end
end)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Save and load session
vim.keymap.set('n', '<leader>ss', ':mksession! .session.vim<CR>',
    { noremap = true, silent = false, desc = 'Save Session' })
vim.keymap.set('n', '<leader>sl', ':source .session.vim<CR>',
    { noremap = true, silent = false, desc = 'Save and Load session' })

vim.keymap.set('n', '<leader>mpt', ':MarkdownPreviewToggle<CR>', { desc = 'Toggle Markdown Preview' })

-- Markdown Keybindings
-- vim.api.nvim_set_keymap('n', '<leader>mt', ':PeekOpen<CR>',
-- { noremap = true, silent = true, desc = 'Toggle Markdown Preview' })
-- END Markdown Preiview Keybindings

vim.keymap.set('n', '<leader>,', function()
    require('md-pdf').convert_md_to_pdf()
end)

vim.keymap.set('n', '<leader>wf', ':set nowrap<CR>')
vim.keymap.set('n', '<leader>wt', ':set wrap<CR>')

-- BUG: Not working
vim.keymap.set('i', '<C-BS>', '<C-W>')

-- HACK: Create table of contents in neovim with markdown-toc
-- https://youtu.be/BVyrXsZ_ViA
--
-- Generate/update a Markdown TOC
-- To generate the TOC I use the markdown-toc plugin
-- https://github.com/jonschlinkert/markdown-toc
-- And the markdown-toc plugin installed as a LazyExtra
-- Function to update the Markdown TOC with customizable headings
local function update_markdown_toc(heading2, heading3)
    local path = vim.fn.expand '%' -- Expands the current file name to a full path
    local bufnr = 0                -- The current buffer number, 0 references the current active buffer
    -- Save the current view
    -- If I don't do this, my folds are lost when I run this keymap
    vim.cmd 'mkview'
    -- Retrieves all lines from the current buffer
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    local toc_exists = false  -- Flag to check if TOC marker exists
    local frontmatter_end = 0 -- To store the end line number of frontmatter
    -- Check for frontmatter and TOC marker
    for i, line in ipairs(lines) do
        if i == 1 and line:match '^---$' then
            -- Frontmatter start detected, now find the end
            for j = i + 1, #lines do
                if lines[j]:match '^---$' then
                    frontmatter_end = j
                    break
                end
            end
        end
        -- Checks for the TOC marker
        if line:match '^%s*<!%-%-%s*toc%s*%-%->%s*$' then
            toc_exists = true
            break
        end
    end
    -- Inserts H2 and H3 headings and <!-- toc --> at the appropriate position
    if not toc_exists then
        local insertion_line = 1 -- Default insertion point after first line
        if frontmatter_end > 0 then
            -- Find H1 after frontmatter
            for i = frontmatter_end + 1, #lines do
                if lines[i]:match '^#%s+' then
                    insertion_line = i + 1
                    break
                end
            end
        else
            -- Find H1 from the beginning
            for i, line in ipairs(lines) do
                if line:match '^#%s+' then
                    insertion_line = i + 1
                    break
                end
            end
        end
        -- Insert the specified headings and <!-- toc --> without blank lines
        -- Insert the TOC inside a H2 and H3 heading right below the main H1 at the top lamw25wmal
        vim.api.nvim_buf_set_lines(bufnr, insertion_line, insertion_line, false, { heading2, heading3, '<!-- toc -->' })
    end
    -- Silently save the file, in case TOC is being created for the first time
    vim.cmd 'silent write'
    -- Silently run markdown-toc to update the TOC without displaying command output
    -- vim.fn.system("markdown-toc -i " .. path)
    -- I want my bulletpoints to be created only as "-" so passing that option as
    -- an argument according to the docs
    -- https://github.com/jonschlinkert/markdown-toc?tab=readme-ov-file#optionsbullets
    vim.fn.system('markdown-toc --bullets "-" -i ' .. path)
    vim.cmd 'edit!'        -- Reloads the file to reflect the changes made by markdown-toc
    vim.cmd 'silent write' -- Silently save the file
    vim.notify('TOC updated and file saved', vim.log.levels.INFO)
    -- -- In case a cleanup is needed, leaving this old code here as a reference
    -- -- I used this code before I implemented the frontmatter check
    -- -- Moves the cursor to the top of the file
    -- vim.api.nvim_win_set_cursor(bufnr, { 1, 0 })
    -- -- Deletes leading blank lines from the top of the file
    -- while true do
    --   -- Retrieves the first line of the buffer
    --   local line = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1]
    --   -- Checks if the line is empty
    --   if line == "" then
    --     -- Deletes the line if it's empty
    --     vim.api.nvim_buf_set_lines(bufnr, 0, 1, false, {})
    --   else
    --     -- Breaks the loop if the line is not empty, indicating content or TOC marker
    --     break
    --   end
    -- end
    -- Restore the saved view (including folds)
    vim.cmd 'loadview'
end

-- HACK: Create table of contents in neovim with markdown-toc
-- https://youtu.be/BVyrXsZ_ViA
--
-- Keymap for English TOC
vim.keymap.set('n', '<leader>mtt', function()
    update_markdown_toc('## Contents', '### Table of contents')
end, { desc = '[P]Insert/update Markdown TOC (English)' })
