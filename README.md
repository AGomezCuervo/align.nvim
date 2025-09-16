# align.nvim
A simple Neovim plugin to align text by a chosen delimiter.

### Install
**lazy.nvim**

```lua
{
  'agomezcuervo/align.nvim',
  config = function()
    require('align').setup()
  end
}
```

**vim.pack**

```lua
vim.pack.add({
	{ src = "https://github.com/agomezcuervo/align.nvim" },
})

require ("align").setup()

```

**vim-plug**

```vim script
Plug 'agomezcuervo/align.nvim'
lua require('align').setup()
```

### Usage
Run the `:<range>Align <delimiter>` to align by the delimiter.
