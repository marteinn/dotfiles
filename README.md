## Install

- Clone repo
    ```
    cd ~ && git clone git@github.com:marteinn/dotfiles.git
    ```

- Setup files
    ```
    source $HOME/dotfiles/script/setup.sh
    ```

- Install prezto
    ```
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    ```

- MacOS: Install brew

    ```
    cd ~/dotfiles && brew bundle
    ```

- Install vim-plug
    ```
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```

- MacOS: Open iTerm2 and activate solarized dark
    ```
    cmd+i -> colors preset -> colarized dark
    ```

- Make zsh default shell
    ```
    chsh -s /bin/zsh
    ```

- MacOS: Open ~/dotfiles/.osx and run customizations

- Done!


## Inspiration from:

* [https://github.com/mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
* [https://github.com/holman/dotfiles](https://github.com/holman/dotfiles)
* [https://gist.github.com/oli/1637874](https://gist.github.com/oli/1637874)
