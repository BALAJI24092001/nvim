-- REQUIRE: Add more functionality to Markdown Preview
return {
    {
        'toppair/peek.nvim',
        event = { 'VeryLazy' },
        build = 'deno task --quiet build:fast',
        config = function()
            require('peek').setup {
                app = 'browser',
                theme = 'light',
            }
            vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
            vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
        end,
    },

    -- OPTIONAL:

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

    -- OPTIONAL:
    -- This is used for rendering images on the neovim editor itself for reference and integration with peek and markdown preview windows.
    -- {
    --     '3rd/diagram.nvim',
    --     dependencies = {
    --         '3rd/image.nvim',
    --     },
    --     config = function()
    --         require('diagram').setup {
    --             -- integrations = {
    --             --     require 'diagram.integrations.markdown',
    --             --     require 'diagram.integrations.neorg',
    --             -- },
    --             renderer_options = {
    --                 mermaid = {
    --                     theme = 'forest',
    --                 },
    --                 plantuml = {
    --                     charset = 'utf-8',
    --                 },
    --             },
    --         }
    --
    --         renderer_options = {
    --             mermaid = {
    --                 background = 'white', -- nil | "transparent" | "white" | "#hex"
    --                 theme = 'dark',       -- nil | "default" | "dark" | "forest" | "neutral"
    --                 scale = 1,            -- nil | 1 (default) | 2  | 3 | ...
    --                 width = nil,          -- nil | 800 | 400 | ...
    --                 height = nil,         -- nil | 600 | 300 | ...
    --             },
    --             plantuml = {
    --                 charset = nil,
    --             },
    --             d2 = {
    --                 theme_id = nil,
    --                 dark_theme_id = nil,
    --                 scale = nil,
    --                 layout = nil,
    --                 sketch = nil,
    --             },
    --             gnuplot = {
    --                 size = nil,  -- nil | "800,600" | ...
    --                 font = nil,  -- nil | "Arial,12" | ...
    --                 theme = nil, -- nil | "light" | "dark" | custom theme string
    --             },
    --         }
    --     end,
    --     opts = {},
    -- },

    --
    -- BUG: Fix the bug, not rendering pdf file: pdftex not avilable
    -- !pandoc markdown.md -o pdfFile.pdf
    -- returns error
    -- Need to install pdflatex to render the markdown file as pdf
    -- {
    --     'arminveres/md-pdf.nvim',
    --     branch = 'main', -- you can assume that main is somewhat stable until releases will be made
    --     lazy = true,
    --     keys = {
    --         {
    --             '<leader>,',
    --             function()
    --                 require('md-pdf').convert_md_to_pdf()
    --             end,
    --             desc = 'Markdown preview',
    --         },
    --     },
    --     opts = {},
    --     config = function()
    --         require('md-pdf').setup()
    --     end,
    -- },
}
