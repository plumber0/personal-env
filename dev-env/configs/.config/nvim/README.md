# Neovim Setup

This directory is the source of truth for my Neovim setup.

- Managed config path: `~/personal/dev-env/configs/.config/nvim`
- Live config path: `~/.config/nvim`
- Plugin install path: `~/.local/share/nvim/lazy`

Notes:

- `lazy.nvim` is not stored in this repo.
- It is installed automatically the first time Neovim starts.
- `lazy-lock.json` should stay in git.
- `lazyvim.json` is tracked here because it is currently part of my copied setup, but it is mostly LazyVim state.

## Daily Process

### 1. Change config

Edit files in:

`~/personal/dev-env/configs/.config/nvim`

Do not treat `~/.config/nvim` as the main source.

### 2. Apply config to home directory

From `~/personal/dev-env`:

```bash
./copy_configs.sh
```

This copies the managed Neovim config to:

`~/.config/nvim`

### 3. Open Neovim

```bash
nvim
```

If this is the first run after a clean setup, wait for plugin installation to finish.

### 4. If I updated plugins on purpose

Inside Neovim:

```vim
:Lazy update
```

Then copy the updated lockfile back into the repo:

```bash
cp ~/.config/nvim/lazy-lock.json ~/personal/dev-env/configs/.config/nvim/lazy-lock.json
```

If I changed extras in the `:LazyExtras` UI, also copy:

```bash
cp ~/.config/nvim/lazyvim.json ~/personal/dev-env/configs/.config/nvim/lazyvim.json
```

### 5. Commit changes

After config or lockfile changes:

```bash
git -C ~/personal add dev-env/configs/.config/nvim
git -C ~/personal commit -m "Update nvim config"
```

## New Machine Setup

### 1. Clone repo

Clone `personal` to:

`~/personal`

### 2. Install Neovim dependencies

From `~/personal/dev-env`:

```bash
./install_scripts/neovim.sh
```

This installs:

- `neovim`
- `ripgrep`
- `fd`
- `fzf`
- `lazygit`
- `tree-sitter-cli`

### 3. Copy config to home directory

From `~/personal/dev-env`:

```bash
./copy_configs.sh
```

### 4. Start Neovim

```bash
nvim
```

On first start:

- `lazy.nvim` will bootstrap itself
- plugins will install under `~/.local/share/nvim/lazy`
- Mason tools and LSP servers should install automatically

### 5. Restore pinned plugin versions

Inside Neovim:

```vim
:Lazy restore
```

This uses `lazy-lock.json` so the machine matches the repo.

## Quick Rule

Use this order:

1. Edit in `dev-env`
2. Copy to `~/.config/nvim`
3. Run `nvim`
5. If plugin versions changed, copy `lazy-lock.json` back
