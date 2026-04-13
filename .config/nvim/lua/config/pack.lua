vim.cmd.packadd("nvim.undotree")

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind

    if kind ~= "install" and kind ~= "update" then
      return
    end

    if name == "nvim-treesitter" then
      if not ev.data.active then
        vim.cmd.packadd("nvim-treesitter")
      end

      vim.cmd("TSUpdate")
      return
    end

    if name == "LuaSnip" then
      vim.system({ "make", "install_jsregexp" }, { cwd = ev.data.path }):wait()
      return
    end
  end,
})
