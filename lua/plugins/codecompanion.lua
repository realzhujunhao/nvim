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
                        model = "qwen2.5-coder:7b"
                    }
                },
                inline = {
                    adapter = {
                        name = "ollama",
                        model = "qwen2.5-coder:7b"
                    }
                },
                background = {
                    adapter = {
                        name = "ollama",
                        model = "qwen2.5-coder:7b"
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
