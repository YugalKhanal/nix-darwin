{
  programs.nixvim = {
    config = {
      plugins = {
        nvim-autopairs = {
          enable = true;
        };
      };

      keymaps = [
        { mode = "n"; key = "<space>cd"; action = "<cmd>Copilot disable<CR>"; options.desc = "Disable copilot"; }
      ];
    };
  };
}
