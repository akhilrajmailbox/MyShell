# My Custom MacOS Terminal

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

### Installing Cowsay and Lolcat

```shell
brew install cowsay
sudo gem install lolcat
```

### Customizing Profile

```shell
mkdir ~/Documents/TerminalBin
cp -r MyScript ~/Documents/TerminalBin/
echo "source ~/Documents/TerminalBin/MyScript" >> ~/.zshrc
## cowsay and lolcal customization
cp -r Cowsay ~/Documents/TerminalBin/
echo "source ~/Documents/TerminalBin/Cowsay/cowsay.sh" >> ~/.zshrc
```




[reference](https://www.freecodecamp.org/news/how-to-configure-your-macos-terminal-with-zsh-like-a-pro-c0ab3f3c1156/)