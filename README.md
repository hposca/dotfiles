# dotfiles

Configure dotfiles using [GNU Stow](https://www.gnu.org/software/stow/manual/stow.html):

```bash
yay -Syu --noconfirm stow
stow -t ~/ .

# If due to some installation some dotfiles were already created, use:
# stow --adopt -t ~/ .
```

## Next steps

After running `stow` it will create a `~/.gitconfig.base`, copy and update it:

```bash
cp ~/.gitconfig.base ~/.gitconfig
# Configure it...
# nvim ~/.gitconfig
```

---
