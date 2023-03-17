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

  programs.neovim = {
  	defaultEditor = true;
	vimAlias = true;
        enable = true;
        extraConfig = ''
          set termguicolors
          colorscheme monokai_pro
        '';
        extraLuaConfig = ''
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black, bg = colors.black },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { 'fileformat' },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}
        '';
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
