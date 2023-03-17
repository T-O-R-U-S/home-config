{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "donut";
  home.homeDirectory = "/home/donut";
  

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  home.packages = with pkgs; [
        ntfs3g
        firefox
	neovide
	rustup
	python3
	nodejs
	spotify
	nodejs
	llvm
	lld
	ripgrep
	lazygit
	bottom
	gdu
	tree-sitter
	tdesktop # tdesktop is Telegram's desktop client
	discord
	gum
	qemu
	nix
        git
        gh
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.fish.enable = true;

  programs.git.signing.signByDefault = true;

  programs.neovim = {
  	defaultEditor = true;
	vimAlias = true;
        enable = true;
        extraConfig = builtins.readFile ./vimConfig/init.vim;
        extraLuaConfig = builtins.readFile ./vimConfig/init.lua;
	plugins = with pkgs.vimPlugins; [
		vim-monokai-pro

		vim-nix

		coc-nvim
		coc-rust-analyzer
		coc-toml
		coc-lua
                coc-html

                lualine-nvim
		
		nvim-tree-lua
                nvim-web-devicons

                telescope-nvim
	];
  };
}
