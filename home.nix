{ pkgs, unstable,inputs,system, ... }:

let
    upkgs = with unstable; [
    ## Tools
    air
    biome
    go-swag
    helix
    jujutsu
    neofetch
    poetry
    tailwindcss
    templ
       
     ## Db
    tigerbeetle

    ## Runtimes
    bun

    ## Languages
    cbqn-replxx
    factor-lang
    go_1_22
    hare
    j
    jelly
    nim-unwrapped-2
    uiua
    unison-ucm
    zig


    ## LSP
    nimlsp
    nil
    nixpkgs-fmt
    vscode-langservers-extracted
    typescript
    nodePackages.typescript-language-server
    lua-language-server
    marksman
    yaml-language-server
    taplo
    zls

    ##Game engines
    raylib
    
    ##GUI
    floorp
    godot_4
    hyprland
    zed-editor
  ];
inherit (inputs) bqnlsp;
inherit system;

in

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    homeDirectory = "/home/prince";
    stateVersion = "23.11";
    username = "prince";
    packages = with pkgs; [
      # CLI Tools
      awscli2
      awsebcli
      bat
      bash
      butane
      cmake
      cfssl
      coreutils-full
      darcs
      fd
      fish
      gnumake
      gnupatch
      gzip
      htop
      jq
      lazygit
      lsd
      mercurial
      mariadb
      neovim
      openssh
      openssl
      parallel
      ##Podman
      podman
      podman-compose
      podman-desktop
      ##
      ripgrep
      rsync
      sshs
      starship
      tealdeer
      traceroute
      tree-sitter
      unzip
      wget
      wl-clipboard
      yarn
      zip
      zoxide

      # Programming languages
      ghc
      gforth
      io
      ## janet
      janet
      jpm
      ##
      ## Kotlin
      kotlin
      kotlin-language-server
      ##
      ## lua
      lua
      luarocks
      ##
      mercury
      ## Ocaml
      ocaml
      opam
      ##
      perl
      ## python
      python311
      python311Packages.pip
      python311Packages.ruff-lsp
      python311Packages.python-lsp-server
      ##
      racket
      rakudo
      rustup
           
      # Runtimes
      nodejs_21
      wasmtime
    
      # Build Tools
      #clang-tools
      libclang
      gfortran
      git
      lldb
    
      #Fonts
      fantasque-sans-mono
      hack-font
      julia-mono
      redhat-official-fonts

      #LSP
      inputs.bqnlsp.packages.${system}.lsp 
      # GUI
      blender    
      dbeaver
      inkscape
      mpv
      vscode
      wezterm
    ] ++  upkgs;
  };

  home.file = {
    ".config/fish/config.fish".source = dotfiles/fish/config.fish;
    ".config/starship.toml".source = dotfiles/starship.toml;
    ".config/helix/languages.toml".source = dotfiles/helix/languages.toml;
    ".config/helix/config.toml".source = dotfiles/helix/config.toml;
    ".config/wezterm/wezterm.lua".source = dotfiles/wezterm/wezterm.lua;
  };

   programs.git = {
    enable = true;
    userName = "Prince Junior Mguni";
    userEmail = "princem@bestforu.co.za";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      safe = {
        directory = "/etc/nixos";
      };
    };
  };

  home.sessionVariables = {
    EDITOR = "hx";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
