return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"leoluz/nvim-dap-go",
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
		require("dap-go").setup()
		require("nvim-dap-virtual-text").setup()

		dap.set_log_level("TRACE")
		dap.adapters.haskell = {
			type = "executable",
			command = "haskell-debug-adapter",
		}
		dap.configurations.haskell = {
			{
				type = "haskell",
				request = "launch",
				name = "GHCI Debug",
				workspace = "${workspaceFolder}",
				startup = "${file}",
				stopOnEntry = true,
				logFile = vim.fn.stdpath("data") .. "/haskell-dap.log",
				logLevel = "WARNING",
				ghciEnv = vim.empty_dict(),
				ghciPrompt = "ghci> ",
				-- Adjust the prompt to the prompt you see when you invoke the stack ghci command below
				ghciInitialPrompt = "ghci> ",
				ghciCmd = "stack ghci --test --no-load --no-build --main-is TARGET --ghci-options -fprint-evld-with-show",
			},
		}

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("user_group", {}),
			callback = function(e)
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
		})
	end,
}
