return {
    "goolord/alpha-nvim",
    event = "VimEnter", -- load plugin after all configuration is set
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                     ]],
            [[       ████ ██████           █████      ██                     ]],
            [[      ███████████             █████                             ]],
            [[      █████████ ███████████████████ ███   ███████████   ]],
            [[     █████████  ███    █████████████ █████ ██████████████   ]],
            [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
            [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
            [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
        }

        _Gopts = {
            position = "center",
            hl = "Type",
            wrap = "overflow";
        }

        -- Set menu
        dashboard.section.buttons.val = {
            dashboard.button("n", "   New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("f", "   Find file", ":cd $HOME/ | Telescope find_files<CR>"),
            dashboard.button("r", "   Recent", ":Telescope oldfiles<CR>"),
            dashboard.button("l", "󰒲   Lazy", ":Lazy<CR>"),
            --dashboard.button("u", "   Update plugins", "<cmd>lua require('lazy').sync()<CR>"),
            dashboard.button("w", "󰱼   Find word", ":Telescope live_grep<CR>"),
            dashboard.button("m", "󰂖   Mason", ":Mason<CR>"),
            dashboard.button("s", "󱌣   Settings", ":e $MYVIMRC <CR>"),
            dashboard.button("q", "   Quit NVIM", ":qa<CR>"),
        }

        dashboard.opts.opts.noautocmd = true
        alpha.setup(dashboard.opts)

        require("alpha").setup(dashboard.opts)

        local fortune = require("alpha.fortune")
        dashboard.section.footer.val = fortune()

        -- Disable folding on alpha buffer
        vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])

    end,
}

