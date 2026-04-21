return {
  {
    "nvim-lua/plenary.nvim",
    keys = {
      {
        "<leader>gu",
        function()
          -- Check if we're in a git repository
          local is_git_repo = vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null"):match("true")
          if not is_git_repo then
            vim.notify("Not in a git repository", vim.log.levels.ERROR)
            return
          end

          -- Get remote URL
          local remote_url = vim.fn.system("git config --get remote.origin.url 2>/dev/null"):gsub("%s+", "")
          if remote_url == "" then
            vim.notify("No git remote configured", vim.log.levels.ERROR)
            return
          end

          -- Get current branch
          local branch = vim.fn.system("git branch --show-current 2>/dev/null"):gsub("%s+", "")
          local is_detached = branch == ""

          -- Parse the remote URL
          local domain, path

          -- Handle SSH format: git@github.com:user/repo.git
          if remote_url:match("^git@") then
            domain, path = remote_url:match("git@([^:]+):(.+)%.git$")
            if not domain then
              domain, path = remote_url:match("git@([^:]+):(.+)$")
            end
          -- Handle HTTPS format: https://github.com/user/repo.git
          elseif remote_url:match("^https://") then
            domain, path = remote_url:match("https://([^/]+)/(.+)%.git$")
            if not domain then
              domain, path = remote_url:match("https://([^/]+)/(.+)$")
            end
          end

          if not domain or not path then
            vim.notify("Could not parse git remote URL: " .. remote_url, vim.log.levels.ERROR)
            return
          end

          -- Construct browser URL based on provider
          local browser_url = "https://" .. domain .. "/" .. path

          if not is_detached then
            -- Add branch path based on provider
            if domain:match("github%.com") then
              browser_url = browser_url .. "/tree/" .. branch
            elseif domain:match("gitlab%.com") or domain:match("gitlab%.") then
              browser_url = browser_url .. "/-/tree/" .. branch
            elseif domain:match("bitbucket%.org") then
              browser_url = browser_url .. "/branch/" .. branch
            else
              -- Generic fallback (GitHub-style)
              browser_url = browser_url .. "/tree/" .. branch
            end
          else
            vim.notify("In detached HEAD state, opening repository root", vim.log.levels.WARN)
          end

          -- Open in browser
          vim.fn.system("open '" .. browser_url .. "'")
        end,
        desc = "Open Git repository in browser",
      },
    },
  },
}
