-- Standalone plugins with less than 10 lines of config go here
return {
    {
        -- autoclose tags
        'windwp/nvim-ts-autotag',
    },
    {
        -- detect tabstop and shiftwidth automatically
        'tpope/vim-sleuth',
    },
    {
        -- Powerful Git integration for Vim
        'tpope/vim-fugitive',
    },
    {
        -- GitHub integration for vim-fugitive
        'tpope/vim-rhubarb',
    },
    {
        -- Hints keybinds
        'folke/which-key.nvim',
        opts = {
            -- win = {
            --   border = {
            --     { '┌', 'FloatBorder' },
            --     { '─', 'FloatBorder' },
            --     { '┐', 'FloatBorder' },
            --     { '│', 'FloatBorder' },
            --     { '┘', 'FloatBorder' },
            --     { '─', 'FloatBorder' },
            --     { '└', 'FloatBorder' },
            --     { '│', 'FloatBorder' },
            --   },
            -- },
        },
    },
    {
        -- Autoclose parentheses, brackets, quotes, etc.
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = true,
        opts = {},
    },
    {
        -- this is a todo:
        -- Highlight todo, notes, etc in comments
        -- Need to use : after a keyword for it to work
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            merge_keywords = true,
            signs = true,
            keywords = {
                FIX = {
                    icon = ' ', -- icon used for the sign, and in search results
                    color = 'error', -- can be a hex color, or a named color (see below)
                    alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' }, -- a set of other keywords that all map to this FIX keywords
                    -- signs = false, -- configure signs for some keywords individually
                },
                TODO = { icon = ' ', color = 'info', alt = { 'todo', 'Todo' } },
                HACK = { icon = ' ', color = 'warning', alt = { 'Hack' } },
                WARN = { icon = ' ', color = 'warning', alt = { 'Warn', 'XXX' } },
                PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
                NOTE = { icon = ' ', color = 'hint', alt = { 'INFO', 'Note', 'Info' } },
                TEST = { icon = '⏲ ', color = 'test', alt = { 'TESTING', 'PASSED', 'FAILED', 'Testing', 'Testing', 'Passed', 'passed', 'Failed', 'failed' } },
                REQUIRE = { icons = '*', color = 'default', alt = { 'REQ', 'Require', 'Requirement', 'REQUIREMENT' } },
            },
            gui_style = {
                fg = 'NONE', -- The gui style to use for the fg highlight group.
                bg = 'BOLD', -- The gui style to use for the bg highlight group.
            },
            colors = {
                error = { 'DiagnosticError', 'ErrorMsg', '#DC2626' },
                warning = { 'DiagnosticWarn', 'WarningMsg', '#FBBF24' },
                info = { 'DiagnosticInfo', '#2563EB' },
                hint = { 'DiagnosticHint', '#10B981' },
                default = { 'Identifier', '#7C3AED' },
                test = { 'Identifier', '#FF00FF' },
            },
        },
    },
    {
        -- high-performance color highlighter
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end,
    },
    -- BUG: Fix the bug, not rendering pdf file: pdftex not avilable
    -- !pandoc markdown.md -o pdfFile.pdf
    -- returns error
    -- Need to install pdflatex to render the markdown file as pdf
    {
        'arminveres/md-pdf.nvim',
        branch = 'main', -- you can assume that main is somewhat stable until releases will be made
        lazy = true,
        keys = {
            {
                '<leader>,',
                function()
                    require('md-pdf').convert_md_to_pdf()
                end,
                desc = 'Markdown preview',
            },
        },
        opts = {},
        config = function()
            require('md-pdf').setup()
        end,
    },
    {
        'iamcco/markdown-preview.nvim',
        cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
        build = 'cd app && yarn install',
        init = function()
            vim.g.mkdp_filetypes = { 'markdown' }
            vim.g.mkdp_theme = 'light'
        end,
        ft = { 'markdown' },
    },
    {
        'derektata/lorem.nvim',
        config = function()
            require('lorem').opts {
                sentenceLength = 'medium',
                comma_chance = 0.2,
                max_commas_per_sentence = 2,
            }
        end,
    },
    { 'echasnovski/mini.nvim', version = '*' },
}
