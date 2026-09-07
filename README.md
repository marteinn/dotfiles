## Install

- Clone repo
    ```
    cd ~ && git clone git@github.com:marteinn/dotfiles.git
    ```

- Setup files
    ```
    bash $HOME/dotfiles/script/setup.sh
    ```

- Install prezto
    ```
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    ```

- MacOS: Install brew

    ```
    cd ~/dotfiles && brew bundle
    ```

    `.zprofile` runs `brew shellenv` to put brew tools on `PATH`, but it is only
    sourced for login shells.

- Neovim: start it once (requires 0.12+)
    ```
    nvim
    ```

    First launch installs the plugins and treesitter parsers. Commit the
    resulting `vim/nvim-pack-lock.json`; update later with
    `:lua vim.pack.update()`.

- Neovim: install the language servers
    ```
    uv tool install basedpyright              # python
    uv tool install ruff                      # python
    npm i -g @vtsls/language-server           # javascript, typescript
    npm i -g vscode-langservers-extracted     # eslint, css, html, json
    npm i -g intelephense                     # php
    ```

    `elixir-ls` comes from the Brewfile. Verify with `:checkhealth vim.lsp`.

- Cloudflare Zero Trust: build the CA bundle, or `elixir-ls` will not start
    ```
    refresh_ca_bundle
    ```

- MacOS: Open iTerm2 and activate solarized dark
    ```
    cmd+i -> colors preset -> solarized dark
    ```

- MacOS: Open ~/dotfiles/.osx and run customizations

- Done!


## Inspiration from:

* [https://github.com/mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
* [https://github.com/holman/dotfiles](https://github.com/holman/dotfiles)
* [https://gist.github.com/oli/1637874](https://gist.github.com/oli/1637874)
