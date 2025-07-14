# ARC's dotfiles 2

## Pre-requisite

* Neovim (v0.11.2)
  * Installation
    ```bash
    $ curl -LO https://github.com/neovim/neovim/releases/download/v0.11.2/nvim-linux-x86_64.tar.gz
    $ sudo rm -rf /opt/nvim
    $ sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
    ```
    Note: Might work on later version but not tested.
  * Add the following at the end of your `.bashrc`.
    ```bash
    export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
    ```
  * Source your `.bashrc` and check nvim version if correct.
    ```bash
    $ source ~/.bashrc
    $ nvim --version
    NVIM v0.11.2
    Build type: Release
    LuaJIT 2.1.1741730670
    Run "nvim -V1 -v" for more info
    ```

* Node Version Manager (NVM)
  * Installation
    ```bash
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    ```
    * This will add the following in your .bashrc
      ```bash
      export NVM_DIR="$HOME/.nvm"
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
      [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
      ```
  * Source your `.bashrc` and install the lts version
    ```bash
    nvm install --lts
    npm install -g neovim
    ```
* (Optional) apt packages
  ```bash
  sudo apt install tmux sudo apt install cscope universal-ctag
  ```

## Installation

1. If you have previous neovim configuration. You may want to backup it first.
  ```bash
  mv ~/.config/nvim ~/.config/nvim.backup
  mv ~/.local/share/nvim ~/.local/share/nvim.backup
  mv ~/.local/state/nvim ~/.local/state/nvim.backup
  mv ~/.cache/nvim ~/.cache/nvim.backup
  ```
2. Clone this repository to your $HOME folder
  ```bash
  $ git clone https://github.com/arc34/dotfiles2.git ~/.dotfiles
  ```
3. !!IMPORTANT!! Replace `~/.dotfiles/.gitconfig` with your own `.gitconfig`.
  ```bash
  $ cp .gitconfig ~/.gitconfig/.gitconfig
  ```
  Otherwise your `.gitconfig` will be overwritten by my `.gitconfig`.
4. In $HOME folder, execute the following
  ```bash
  $ dgit reset --hard
  ```
5. Open nvim once.
  ```bash
  $ nvim
  ```
  The `Lazy Package Manager` should install everything on initial run.
