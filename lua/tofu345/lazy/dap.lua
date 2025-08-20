return {
	"mfussenegger/nvim-dap",
	dependencies = {
		-- "leoluz/nvim-dap-go",
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",
	},
	config = function()
		-- from :> https://github.com/tjdevries/config.nvim/blob/master/lua/custom/plugins/dap.lua
		local dap = require("dap")
		local ui = require("dapui")

		require("dapui").setup()
		-- require("dap-go").setup()
		require("nvim-dap-virtual-text").setup({})

		dap.set_log_level("TRACE")

		dap.adapters.codelldb = {
			type = "executable",
			command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
		}
		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		vim.keymap.set("n", "<space>b", dap.toggle_breakpoint, { desc = "Dap - Toggle Breakpoint" })
		vim.keymap.set("n", "<space>gb", dap.run_to_cursor, { desc = "Dap - Run to Cursor" })

		-- Eval var under cursor
		vim.keymap.set("n", "<space>?", function()
			require("dapui").eval(nil, { enter = true })
		end)

		vim.keymap.set("n", "<F1>", dap.continue)
		vim.keymap.set("n", "<F2>", dap.step_into)
		vim.keymap.set("n", "<F3>", dap.step_over)
		vim.keymap.set("n", "<F4>", dap.step_out)
		vim.keymap.set("n", "<F5>", dap.step_back)
		vim.keymap.set("n", "<F12>", dap.restart)

		dap.listeners.before.attach.dapui_config = function()
			ui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			ui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			ui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			ui.close()
		end
	end,
}
