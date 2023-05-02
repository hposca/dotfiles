# dotfiles

``` bash
ln -s $(readlink -f tmux.conf) ~/.config/tmux/.tmux.conf
ln -s $(readlink -f vimrc) ~/.vimrc
ln -s $(readlink -f init.vim) ~/.config/nvim/init.vim
ln -s $(readlink -f vimrcs) ~/.config/nvim/vimrcs
ln -s $(readlink -f zshrc) ~/.zshrc
ln -s $(readlink -f bash_profile_aws-profile) ~/.bash_profile_aws-profile
ln -s $(readlink -f gitconfig) ~/.gitconfig
ln -s $(readlink -f git-commit-template.txt) ~/.git-commit-template.txt
ln -s $(readlink -f quicktile-non-keypad.cfg) ~/.config/quicktile.cfg
ln -s $(readlink -f philips.zsh-theme) ~/.oh-my-zsh/custom/philips.zsh-theme
ln -s $(readlink -f wtfutil.yml) ~/.config/wtf/config.yml
ln -s $(readlink -f i3-config) ~/.config/i3/config
ln -s $(readlink -f i3-bins) ~/.i3-bins
ln -s $(readlink -f polybar-config) ~/.config/polybar/config
ln -s $(readlink -f config.lua) ~/.config/lvim/config.lua
ln -s $(readlink -f luasnippets) ~/.config/lvim/
```
