return {
    {
        "olimorris/codecompanion.nvim",
        version = "^18.0.0",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            interactions = {
                chat = {
                    adapter = {
                        name = "ollama",
                        model = "gpt-oss:20b"
                    }
                },
                inline = {
                    adapter = {
                        name = "ollama",
                        model = "gpt-oss:20b"
                    }
                },
                background = {
                    adapter = {
                        name = "ollama",
                        model = "gpt-oss:20b"
                    }
                }
            }
        },
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown", "codecompanion" }
    }
}
