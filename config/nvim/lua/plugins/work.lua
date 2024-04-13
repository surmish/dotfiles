if os.getenv("USER") == "urmishs" then
  return {
    {
      url = "https://gitlab-master.nvidia.com/asubramaniam/gp.nvim",
      lazy = false,
      keys = {
        { "<leader>ai", "<cmd>GpChatNew<cr>", desc = "New Chat" },
      },
      opts = {},
    },
  }
end
