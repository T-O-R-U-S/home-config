{ lib, config, pkgs, ... }:

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
        trash-cli
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.shellAliases = {
      nixedit = "nix-build edit";
      nixswitch = "sudo nixos-rebuild switch";
      nixmod = "nixedit && gum confirm \"Switch to config?\" && nixswitch";
      homeedit = "home-manager edit";
      homeswitch = "home-manager switch";
      homemod = "homeedit && gum confirm \"Switch to config?\" && homeswitch";
      vimmod = "nvim $HOME/.config/home-manager/vimConfig/(gum choose \"init.lua\" \"init.vim\")";
      rm = "trash-rm";
  };

  programs.fish.enable = true;

  programs.git.signing.signByDefault = true;

  programs.neovim = {
  	defaultEditor = true;
	vimAlias = true;
        enable = true;
        extraConfig = builtins.readFile ./vimConfig/init.vim;
        # traditional lua require() does not work; this is why I have to manually concatenate
        extraLuaConfig = 
          lib.concatStrings (map (name: ((builtins.readFile ./vimConfig/${name}.lua) + "\n"))
            # Add any lua files that you wish to add to the config here!
            ["init" "coc" "bubbles"]);
        plugins = with pkgs.vimPlugins; [
		vim-monokai-pro

		vim-nix

                vim-startify

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
