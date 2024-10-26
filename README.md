# RunMe

The simple program runner🚀

## 🚀 How to use

To run the following command on NeoVim.

```
:RunIt
```

### Settings

In `setup()`, specify a table of extensions and commands to run. Below is a sample.

```lua
require("runme").setup({
  commands = {
    ts = "ts-node %",
    py = "python %"
  },
  opts = {
    size = 10,
    position = "top",
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
