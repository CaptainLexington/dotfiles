{ config, pkgs, ... }:
let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    # If you are not running an unstable channel of nixpkgs, select the corresponding branch of Nixvim.
    rev = "15d85781db008ebbd85c2a8833694e01e1669b0c";
    ref = "nixos-25.05";
  });
in
{
  home.username = "captain";
  home.homeDirectory = "/home/captain";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them

    home-manager
    neofetch
    ranger
    ncdu

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils  # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc  # it is a calculator for the IPv4/v6 addresses
    lynx

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
    rsync

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    glow # markdown previewer in terminal

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    settings = {
      user.name = "C. Warren Dale";
      user.email = "adventureonthehighseas@gmail.com";
      init.defaultBranch = "main";
    };
  };

  programs.bash = {
    enable = true;
    # TODO add your custom bashrc here
    initExtra = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
   };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';

    shellAbbrs = {
      nxrb = "sudo nixos-rebuild switch --flake ~/.config/nixos";
      nxrbt = "sudo nixos-rebuild test --flake ~/.config/nixos";
    };

    shellAliases = {
      ls = "eza -A --group-directories-first -g";
      ll = "ls -lb --git --total-size --no-permissions";
    };

    functions = {
      __fish_command_not_found_handler = {
        body = "__fish_default_command_not_found_handler $argv[1]";
        onEvent = "fish_command_not_found";
      };
    };
  };



  imports = [
    nixvim.homeModules.nixvim
  ];
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    colorscheme = "slate";
    extraConfigLua = ''
      vim.wo.number = true
      vim.o.hlsearch = false
      vim.o.breakindent = true
      vim.g.mapleader = "\\"
      vim.o.shell = "fish"
      vim.opt.termguicolors = true
      vim.o.signcolumn = "yes"
      vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

      vim.keymap.set('n', '<leader>ft', ':FloatermNew<CR>')
      vim.keymap.set('n', 't', ':FloatermToggle<CR>')
      vim.keymap.set('t', '<Esc>', '<C-\\><C-n>:q<CR>')
      vim.keymap.set('t', '<C-t>', '<C-\\><C-n>:FloatermNew<CR>')
      vim.keymap.set('t', '<C-n>', '<C-\\><C-n>:FloatermNext<CR>')
      vim.keymap.set('t', '<C-b>', '<C-\\><C-n>:FloatermPrev<CR>')
    '';


    plugins = {
      fugitive.enable = true;
      vim-surround.enable = true;
      conform-nvim = {
        enable = true;
	settings = {};
      };
      none-ls = {
        enable = true;
        sources.diagnostics.clj_kondo = {
	  enable = true;
	  settings = {
            virtual_text = true;
	  };
	};
      };
      treesitter = {
        enable = true;
	settings = {};
      };
      floaterm = {
        enable = true;
	settings = {
	  keymap_kill = "<Leader>fk";
	  rootmarkers = [ "build/CMakeFiles"
			  ".project"
			  ".git"
			  ".hg"
			  ".svn"
			  ".root" ];
	};
      };
      zen-mode.enable = true;
      hop = {
        enable = true;
      	luaConfig.post = ''
          vim.keymap.set('n', 'h', ':HopWord<CR>')
	       '';
      };
      web-devicons.enable = true;
      telescope = {
        enable = true;
	keymaps = {
          "<leader>ff" = "find_files";
	  "<leader>fr" = "frecency";
	  "<leader>fg" = "live_grep";
	};
	extensions = {
          frecency.enable = true;
	  fzf-native.enable = true;
	};
      };
    };

    extraPlugins = [
      pkgs.vimPlugins.vim-wordmotion
      pkgs.vimPlugins.vim-clojure-highlight
      pkgs.vimPlugins.vim-clojure-static
      pkgs.vimPlugins.vim-repeat
      pkgs.vimPlugins.vim-easy-align
      pkgs.vimPlugins.vim-sexp
      pkgs.vimPlugins.vim-sexp-mappings-for-regular-people

    ];
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";
}
