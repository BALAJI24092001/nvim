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
            win = {
                border = {
                    { '┌', 'FloatBorder' },
                    { '─', 'FloatBorder' },
                    { '┐', 'FloatBorder' },
                    { '│', 'FloatBorder' },
                    { '┘', 'FloatBorder' },
                    { '─', 'FloatBorder' },
                    { '└', 'FloatBorder' },
                    { '│', 'FloatBorder' },
                },
            },
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
        comments_only = true,
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
                QUES = { icon = '', color = 'question' },
                ANS = { icon = '', color = 'answer' },
                TODO = { icon = ' ', color = 'info', alt = { 'todo', 'Todo' } },
                HACK = { icon = ' ', color = 'warning', alt = { 'Hack' } },
                WARN = { icon = ' ', color = 'warning', alt = { 'Warn', 'XXX' } },
                PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
                NOTE = { icon = ' ', color = 'hint', alt = { 'INFO', 'Note', 'Info' } },
                TEST = { icon = '⏲ ', color = 'test', alt = { 'TESTING', 'PASSED', 'FAILED', 'Testing', 'Testing', 'Passed', 'passed', 'Failed', 'failed' } },
                REQUIRE = { icons = '*', color = 'default', alt = { 'REQ', 'Require', 'Requirement', 'REQUIREMENT' } },
                REF = { icon = '', color = 'test', alt = { 'Reference', 'REFERENCE' } },
                OPTIONAL = { icon = '', color = 'default', alt = { 'OPT' } },
                OUTPUT = { icon = '', color = 'test', alt = { 'Output' } },
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
                question = { 'Identifier', '#691544' },
                answer = { 'Identifier', '#61d40f' },
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
    -- {
    --     'codota/tabnine-nvim',
    --     build = 'pwsh.exe -file .\\dl_binaries.ps1',
    --     disable_auto_comment = true,
    --     accept_keymap = '<Tab>',
    --     dismiss_keymap = '<C-]>',
    --     debounce_ms = 800,
    --     suggestion_color = { gui = '#808080', cterm = 244 },
    --     exclude_filetypes = { 'TelescopePrompt', 'NvimTree' },
    --     log_file_path = nil, -- absolute path to Tabnine log file
    --     ignore_certificate_errors = false,
    --     -- workspace_folders = {
    --     --   paths = { "/your/project" },
    --     --   get_paths = function()
    --     --       return { "/your/project" }
    --     --   end,
    --     -- },
    -- },
    --  [markdown markmap]
    --  https://github.com/Zeioth/markmap.nvim
    {
        'Zeioth/markmap.nvim',
        build = 'yarn global add markmap-cli',
        cmd = { 'MarkmapOpen', 'MarkmapSave', 'MarkmapWatch', 'MarkmapWatchStop' },
        opts = {
            html_output = '/tmp/markmap.html', -- (default) Setting a empty string "" here means: [Current buffer path].html
            hide_toolbar = false,              -- (default)
            grace_period = 3600000,            -- (default) Stops markmap watch after 60 minutes. Set it to 0 to disable the grace_period.
        },
        config = function(_, opts)
            require('markmap').setup(opts)
        end,
    },
}
