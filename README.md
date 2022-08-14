This is my nvim config. Forked from [craftzdog's config](https://github.com/craftzdog/dotfiles-public).

To use it, first install [Packer](https://github.com/wbthomason/packer.nvim).

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Then make a backup of your current config.

```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

Clone this repository.

```bash
git clone https://github.com/nexxeln/nvim ~/.config/nvim
```

Now open Neovim and run `:PackerSync`

```bash
nvim +PackerSync
```

