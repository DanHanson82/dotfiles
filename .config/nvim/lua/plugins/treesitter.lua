local M = { "nvim-treesitter/nvim-treesitter" }

-- install rust and then run the following to install a working version of tree-sitter-cli
-- cargo install tree-sitter-cli --git https://github.com/tree-sitter/tree-sitter.git --tag v0.19.5
M.dependencies = {
  "nvim-treesitter/playground",
}

M.build = ":TSUpdate"

function M.config()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "bash",
      "css",
      "diff",
      "elixir",
      "gitignore",
      "heex",
      "help",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "query",
      "regex",
      "sql",
      "toml",
      "yaml",
    },
    highlight = { enable = true },
    indent = { enable = true },
  })
end

return M
