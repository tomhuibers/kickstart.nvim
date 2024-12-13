vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- selecting
keymap.set("n", "gg", "gg0") --go the first line, first character
keymap.set("n", "<leader>a", "gg0vG$") -- select all

-- file management
-- vim.keymap.set('n', '<C-n>', ':e <C-r>=input("New file: ", "", "file")<CR><CR>', { noremap = true, silent = true })
vim.keymap.set("n", '<leader>ss', ':w<CR>', {noremap=true, silent=true})
vim.keymap.set("n", '<leader>ww', ':wq<CR>', {noremap=true, silent=true})

-- Create a new file in the directory highlighted in nvim-tree
keymap.set('n', '<leader>nn', function()
  -- Only proceed if we are currently in a nvim-tree buffer
  if vim.bo.filetype ~= 'NvimTree' then
    print("This action can only be performed inside nvim-tree.")
    return
  end

  local api = require('nvim-tree.api')
  local node = api.tree.get_node_under_cursor()
  
  if not node then
    print("No node found under cursor!")
    return
  end

  local dir
  if node.type == 'directory' then
    -- If the node is a directory, use its absolute path directly
    dir = node.absolute_path
  else
    -- If the node is a file, use its parent directory
    dir = vim.fn.fnamemodify(node.absolute_path, ':h')
  end

  local input = vim.fn.input("New file: ", "", "file")
  if input ~= "" then
    local new_file_path = dir .. "/" .. input
    vim.cmd("e " .. vim.fn.fnameescape(new_file_path))
  end
end, { noremap = true, silent = true })

-- Create a new folder in the directory highlighted in nvim-tree
vim.keymap.set('n', '<C-m>', function()
  -- Only proceed if we are currently in a nvim-tree buffer
  if vim.bo.filetype ~= 'NvimTree' then
    print("This action can only be performed inside nvim-tree.")
    return
  end

  local api = require('nvim-tree.api')
  local node = api.tree.get_node_under_cursor()
  
  if not node then
    print("No node found under cursor!")
    return
  end

  local dir
  if node.type == 'directory' then
    -- If the node is a directory, use its absolute path directly
    dir = node.absolute_path
  else
    -- If the node is a file, use its parent directory
    dir = vim.fn.fnamemodify(node.absolute_path, ':h')
  end

  local input = vim.fn.input("New folder: ", "", "file")
  if input ~= "" then
    local new_folder_path = dir .. "/" .. input
    -- Create the folder using `mkdir`
    vim.fn.mkdir(new_folder_path, "p")
    print("Folder created: " .. new_folder_path)
  end
end, { noremap = true, silent = true })

-- commenting


vim.api.nvim_set_keymap(
  "n",
  "<leader>dr",
  "<cmd>lua require('csharp').run_project()<CR>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>dg",
  "<cmd>lua require('csharp').debug_project()<CR>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>gd",
  "<cmd>lua require('csharp').go_to_definition()<CR>",
  { noremap = true, silent = true }
)






