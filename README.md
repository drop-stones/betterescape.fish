# betterescape.fish 🐟⎋

A lightweight Fish plugin that provides customizable escape sequences for vi-mode, inspired by [better-escape.nvim](https://github.com/max397574/better-escape.nvim).

## 🔍 Overview

Type two keys quickly (like `jk` or `jj`) to exit insert mode in Fish's vi-mode — no more awkward `<Esc>` reaches!

## ✨ Key Features

- ⚡ **Customizable Sequences**: Set any two-character combination (e.g., `jk`, `jj`, `fd`)
- ⏱️ **Timeout Control**: Configure how quickly keys must be pressed (default: 300ms)
- 🔄 **Dynamic Reconfiguration**: Change sequences on the fly without restarting your shell

## 🚀 Quick Start

Install with [Fisher](https://github.com/jorgebucaran/fisher):

```fish
fisher install drop-stones/betterescape.fish
```

Set your escape sequence in `~/.config/fish/config.fish`:

```fish
set -g betterescape_sequence jk
```

Start typing in vi-mode insert mode, press `j` then `k` quickly — you're back in normal mode!

## 📋 Requirements

### Linux

- `date` command (pre-installed on most systems)

### macOS

- `gdate` command (GNU coreutils)

```fish
brew install coreutils
```

> [!NOTE]
> macOS's built-in `date` doesn't support millisecond precision. `betterescape.fish` requires `gdate` for accurate timeout detection.

## ⚙️ Configuration

### Escape Sequence

Set a two-character escape sequence:

```fish
set -g betterescape_sequence jk  # Default: undefined (must be set)
```

### Timeout

Set the maximum time (in milliseconds) between key presses:

```fish
set -g betterescape_timeout 300  # Default: 300ms
```

- Lower values (100-200ms): Faster escape, but may trigger accidentally
- Higher values (400-500ms): More forgiving, but slower to respond

## 🎯 How It Works

1. **First Key**: When you press the first key (e.g., `j`), it's inserted into the command line and the timestamp is recorded
2. **Second Key**: When you press the second key (e.g., `k`) within the timeout:
   - If the previous character matches the first key → Escape to normal mode
   - Otherwise → Insert the second key normally
3. **Timeout**: If too much time passes, the keys are treated as normal input

## 📜 License

MIT License. See [LICENSE](LICENSE).

## 🙏 Credits

Inspired by [better-escape.vim](https://github.com/max397574/better-escape.vim) and [better-escape.nvim](https://github.com/max397574/better-escape.nvim).
