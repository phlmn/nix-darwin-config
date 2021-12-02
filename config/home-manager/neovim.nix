{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    extraConfig = ''
      " show line numbers
      set number

      " tab configuration
      set shiftwidth=4
      set tabstop=4
      set expandtab

      " substitute all matches on a line by default (adding g at the end then
      " reverts it back to only substitute the first match)
      set gdefault

      " show substitution effects as you are typing
      set inccommand=nosplit

      " disable standard mode display in cmdline, bc. lightline does it better
      set noshowmode

      " enable full color support
      set termguicolors

      " save cursor position
      autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

      " set leader key for easymotion
      let mapleader = ","

      " make patterns case-insensitive if they don't contain uppercase letters
      set ignorecase
      set smartcase

      " always use "very magic" regex syntax
      " FIXME: Breaks things.. :/
      "nnoremap / /\v
      "nnoremap ? ?\v
    '';

    plugins = with pkgs.vimPlugins; [
      {
        plugin = gruvbox;
        config = ''
          " gruvbox configuration
          let g:gruvbox_italic=1
          colorscheme gruvbox
          set background=dark
        '';
      }
      vim-devicons
      vim-better-whitespace
      ctrlp
      vim-easymotion
      vim-startify
      nerdtree
      lightline-vim
      tabular
      vim-toml
      editorconfig-nvim
      rust-vim
    ];
  };
}
