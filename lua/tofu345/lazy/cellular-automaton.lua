return {
	"eandrju/cellular-automaton.nvim",
	config = function()
		vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton scramble<CR>", { desc = "CellularAutomaton scramble" });
	end,
}
