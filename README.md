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

- Make zsh default shell
    ```
    chsh -s /bin/zsh
    ```


## Inspiration from:

* [https://github.com/mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
* [https://github.com/holman/dotfiles](https://github.com/holman/dotfiles)
* [https://gist.github.com/oli/1637874](https://gist.github.com/oli/1637874)
