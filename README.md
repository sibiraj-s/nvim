# nvim

This repository hosts my [Neovim] configuration for MacOS. The entry point for the configuration is `init.lua`, and it uses [lazy.nvim] for managing plugins.

### Install Neovim

To install [Neovim], use [Homebrew]:

```bash
brew install neovim
```

Once neovim is installed, clone this repo to a desired location and create a symlink to nvim config directory, by running

```bash
ln -s ~/path/to/your/nvim-config ~/.config/nvim
```

### Font

I use the [JetBrains Nerd Font Mono](https://www.nerdfonts.com/font-downloads) for optimal compatibility with icons and ligatures in Neovim. Install it via Homebrew:

```bash
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
```

Once installed, set JetBrains Nerd Font Mono as the default font in your terminal.

## Plugins

This configuration uses [lazy.nvim] for plugin management. Below is a list of plugins that are currently configured:

- [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim): A fast and customizable start screen for Neovim.
- [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim): A clean dark theme for Neovim.
- [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive): Git integration for Neovim.
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim): A fast and easy status line.
- [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim): A modern file explorer.
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim): Fuzzy finder for files, buffers, and more.
- [nvim-telescope/telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim): UI Select for Neovim.
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Syntax highlighting and code parsing.
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim): Easy installation of LSP servers.
- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim): LSP configuration support for Mason.
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): Quickstart configurations for LSP in Neovim.
- [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim): Lightweight yet powerful formatter plugin for Neovim.
- [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons): Beautiful and configurable icons for Neovim.

### How to Install Plugins

Once Neovim is installed, run the following command to install all the plugins:

```bash
nvim
```

Upon launching Neovim, [lazy.nvim] will automatically handle plugin installation and setup.

### Additional Dependencies

In addition, some plugins require the following utilities to be installed:

- [ripgrep]: For fast text searching within Neovim.
- [fd]: A simple, fast alternative to `find`.
- [stylua] - Lua code formatter

Install them via Homebrew:

```bash
brew install ripgrep fd stylua
```

### Diagnostics

Once everything is setup and running, run the `:checkhealth` command, which runs a series of diagnostic tests to check the health of the Neovim installation.

### Use nvim as git editor

To use nvim as git editor instead of vim, run

```bash
git config --global core.editor nvim
```

### Uninstall

To uninstall neovim, run the following script

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/sibiraj-s/nvim/master/uninstall.sh)"
```

or manually by following the steps below

```bash
brew uninstall neovim
```

After uninstalling Neovim, there will be still some residual configuration and state files. These can be deleted manually.

```bash
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.config/nvim
rm -rf ~/.cache/nvim
```

Once Neovim is uninstalled, utilities like `ripgrep`, `sharkdp/fd`, or other tools installed via Homebrew may no longer be necessary. If these tools are not needed for other tasks, you can safely uninstall them as well.

To remove these utilities, use the following command:

```bash
brew uninstall ripgrep fd stylua
```

<!-- Links -->

[Homebrew]: https://brew.sh
[ripgrep]: https://github.com/BurntSushi/ripgrep
[fd]: https://github.com/sharkdp/fd
[stylua]: https://github.com/JohnnyMorganz/StyLua
[Neovim]: https://neovim.io
[lazy.nvim]: https://github.com/folke/lazy.nvim
