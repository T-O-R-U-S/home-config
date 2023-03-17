  require('dashboard').setup({
    theme = 'hyper',
    config = {
      week_header = {
       enable = true,
      },
      shortcut = {
        { desc = ' Update', group = '@property', action = 'Lazy update', key = 'u' },
        {
          icon = ' ',
          icon_hl = '@variable',
          desc = 'Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
        {
          desc = ' Manpages',
          group = 'DiagnosticHint',
          action = 'Telescope man_pages',
          key = 'h',
        },
        {
          desc = ' Home config files',
          group = 'Number',
          action = 'e $XDG_CONFIG_HOME/home-manager',
          key = 'd',
        },
      },
    },
  })
