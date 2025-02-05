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

    -- {
    --     'iamcco/markdown-preview.nvim',
    --     cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    --     build = 'cd app && yarn install',
    --     init = function()
    --         vim.g.mkdp_filetypes = { 'markdown' }
    --         vim.g.mkdp_theme = 'light'
    --     end,
    --     ft = { 'markdown' },
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
