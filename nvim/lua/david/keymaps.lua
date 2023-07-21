local function map(m, k, v)
  vim.keymap.set(m, k, v, { silent = true })
end

-- Reload config
map("n", "<leader>r", "<CMD>source $MYVIMRC<CR>")

-- Editing maps
map("n", "<c-s>", "<CMD>w<CR>")              -- Saves buffer
map("n", "<c-\\>", "<CMD>vs<CR>")            -- Splits Vertical
map("n", "<leader>s", "<CMD>Sort<CR>")       -- Sorts
map("n", "<c-a-j>", "<Esc><CMD>m .+1<CR>==") -- Move line
map("n", "<c-a-k>", "<Esc><CMD>m .-2<CR>==") -- Move line

map("v", "<c-a-j>", "<CMD>m '>+1<CR>==")     -- Move line
map("v", "<c-a-k>", "<CMD>m '<-2<CR>==")     -- Move line

-- Buffers
map("n", "<leader>cc", "<CMD>bd<CR>")  -- Close current buffer
map("n", "<leader>ca", "<CMD>%bd<CR>") -- Close all buffers

-- Splits Mgmt
map("n", "<c-h>", "<c-w>h");
map("n", "<c-j>", "<c-w>j");
map("n", "<c-k>", "<c-w>k");
map("n", "<c-l>", "<c-w>l");

map("n", "<c-Left>", "<CMD>:vertical resize +3<CR>");
map("n", "<c-Right>", "<CMD>:vertical resize -3<CR>");
map("n", "<c-Up>", "<CMD>:resize +3<CR>");
map("n", "<c-Down>", "<CMD>:resize -3<CR>");
