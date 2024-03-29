# My Custom MacOS Terminal

![MyShell](img/myShell.png)

### Install iterm2

Install iterm2 in your macbook

### Configure homebrew

```shell
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Adding powerline

```shell
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
```

### Install zsh and customize with ohmyzsh

```shell
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sed -i 's|^ZSH_THEME=.*|ZSH_THEME="agnoster"|g' ~/.zshrc
echo 'RPROMPT="%@"' >> ~/.oh-my-zsh/themes/agnoster.zsh-theme
```

### Installing Cowsay, Lolcat, cliclick and Terminal Notifier

```shell
brew install cowsay
sudo gem install lolcat
brew install terminal-notifier
brew install cliclick
```

### Customizing Profile

```shell
mkdir ~/Documents/TerminalBin
cd ~/Documents/TerminalBin
git clone git@github.com:akhilrajmailbox/MyShell.git
echo "source ~/Documents/TerminalBin/MyShell/bin/MyScript" >> ~/.zshrc
rm -rf ~/.oh-my-zsh/themes/agnoster.zsh-theme
cp -r ~/Documents/TerminalBin/MyShell/conf/agnoster.zsh-theme ~/.oh-my-zsh/themes/agnoster.zsh-theme
```


[reference](https://www.freecodecamp.org/news/how-to-configure-your-macos-terminal-with-zsh-like-a-pro-c0ab3f3c1156/)
