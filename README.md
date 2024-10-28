# RunMe

The simple program runner(experimental)🚀

## 🚀 How to use

To run the following command on NeoVim.

```
:RunMe
```

### Settings

In `setup()`, specify a table of extensions and commands to run. Below is a sample.

```lua
require("runme").setup({
  commands = {
    ts = "ts-node %", -- Run if current buffer has 'ts' extension.
    py = "python %"  -- Run if current buffer has 'py' extension.
  },
  opts = {
    size = 10,
    position = "top", -- the value must be one of 'top', 'topleft', 'topright', 'below', 'belowleft' or 'belowright'. Default value is 'belowright'
  }
})

vim.keymap,set("n", "<leader>rnh", ":RunMe<CR>")
vim.keymap,set("n", "<leader>rnv", ":RunMeVertical<CR>")
```

## Install

`lazy.vim`

```lua
{
    'wf001/runme.nvim'
}
```


## License

MIT

## Affected projects

[runit.nvim](https://github.com/Comamoca/runit.nvim)
