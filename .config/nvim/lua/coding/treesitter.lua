local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

ts.setup {
  ensure_installed = { "c", "lua", "bash", "cpp", "tsx", "javascript", "html", "css" },
  sync_install = false,
  auto_install = true,

  indent = {
    enable = true,
    disable = {}
  },

  highlight = {
    enable = true,
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,

    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true,
  },
}
