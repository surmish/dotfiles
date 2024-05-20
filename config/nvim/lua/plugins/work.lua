if os.getenv("USER") == "urmishs" then
  return {
    {
      url = "https://oauth2:glpat-BfxY5xCVygxC6dYRb9cx@gitlab-master.nvidia.com/asubramaniam/gp.nvim",
      disable_updates = true,
      lazy = false,
      keys = {
        { "<leader>ai", "<cmd>GpChatNew<cr>", desc = "New Chat" },
      },
      opts = {},
    },
  }
end
