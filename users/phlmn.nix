{ pkgs, ... }: {
  # home.packages = [ pkgs.atool pkgs.httpie ];
  # programs.bash.enable = true;
  home.packages = [
    pkgs.lima
    pkgs.tilt
    pkgs.azure-cli
  ];

  programs.git = {
    enable = true;
    userName = "Philipp Mandler";
    userEmail = "info@philipp-mandler.com";
    aliases = {
      lol = "log --graph --decorate --pretty=oneline --abbrev-commit --all";

      # Get the current branch name (not so useful in itself, but used in
      # other aliases)
      branch-name = "!git rev-parse --abbrev-ref HEAD";

      # Push the current branch to the remote "origin", and set it to track
      # the upstream branch
      publish = "!git push -u origin $(git branch-name)";

      # Delete the remote version of the current branch
      unpublish = "!git push origin :$(git branch-name)";
    };

    extraConfig = {
      core = {
        excludesFile = "~/.gitignore";
        hooksPath = "~/.githooks";
        ignorecase = "false";
      };

      "merge \"npm-merge-driver\"" = {
        name = "automatically merge npm lockfiles";
        driver = "npx npm-merge-driver merge %A %O %B %P";
      };
    };
  };

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

  programs.zsh = {
    enable = true;
    enableSyntaxHighlighting = true;
    enableCompletion = true;
    enableAutosuggestions = true;

    history = {
      size = 100000;
      save = 2000000;
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "history"
      ];
    };

    initExtra = ''
      # Detect which `ls` flavor is in use
      if ls --color > /dev/null 2>&1; then # GNU `ls`
              colorflag="--color"
              export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
      else # macOS `ls`
              colorflag="-G"
              export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
      fi

      # Always use color output for `ls`
      alias ls="command ls ''${colorflag}"
    '';

    shellAliases = {
      # Open notes
      notes = "code ~/notes/";

      # Reload the shell (i.e. invoke as a login shell)
      reload = "exec $SHELL -l";

      # Copy to clipboard
      pb = "pbcopy";

      vim = "nvim";
      vi = "nvim";
    };

    dirHashes = {
      # Shortcuts for popular locations
      mm  = "$HOME/Micromata";
      dev = "$HOME/Coding";
      dl  = "$HOME/Downloads";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.alacritty = import ./programs/alacritty.nix;

  programs.tmux = {
    enable = true;
    sensibleOnTop = true;

    extraConfig = ''
      # Keep directory when creating new windows or panes
      bind c      new-window          -c "#{pane_current_path}"
      bind %      split-window    -h  -c "#{pane_current_path}"
      bind '"'    split-window    -v  -c "#{pane_current_path}"

      # move windows with ctrl-shift left or right
      #bind-key -n C-S-Left swap-window -t -1
      #bind-key -n C-S-Right swap-window -t +1
      bind -n S-down new-window
      bind -n S-left prev
      bind -n S-right next
      bind -n M-left swap-window -t -1\; select-window -t -1
      bind -n M-right swap-window -t +1\; select-window -t +1

      # order sessions by name
      bind s choose-tree -sZ -O name

      # enable mouse support
      set -g mouse on
    '';

    plugins =
      with pkgs; [
        tmuxPlugins.copycat
        tmuxPlugins.yank
        tmuxPlugins.open
        {
          plugin = tmuxPlugins.resurrect;
          extraConfig = "set -g @resurrect-capture-pane-contents on";
        }
        {
          plugin = tmuxPlugins.continuum;
          extraConfig = "set -g @continuum-restore on";
        }
        {
          plugin = tmuxPlugins.better-mouse-mode;
          extraConfig = ''
            set -g @scroll-speed-num-lines-per-scroll "1"
            set -g @emulate-scroll-for-no-mouse-alternate-buffer "on"
          '';
        }
      ];
  };
}
