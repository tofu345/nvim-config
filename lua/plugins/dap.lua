return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio",
        "williamboman/mason.nvim",
    },
    config = function()
        -- from https://github.com/tjdevries/config.nvim/blob/master/lua/custom/plugins/dap.lua
        local dap = require("dap")
        local ui = require("dapui")

        require("dapui").setup({
            controls = {
                element = "repl",
                enabled = false,
            },
            layouts = {
                {
                    elements = {
                        { id = "scopes", size = 5 },
                        { id = "breakpoints", size = 0.1 },
                        { id = "stacks", size = 0.15 },
                        { id = "watches", size = 0.25 },
                    },
                    position = "left",
                    size = 40,
                },
                {
                    elements = {
                        { id = "repl", size = 1 },
                        -- { id = "console", size = 0.5 },
                    },
                    position = "bottom",
                    size = 10,
                },
            },
        })
        require("nvim-dap-virtual-text").setup({})

        -- dap.set_log_level("TRACE")

        dap.adapters.gdb = {
            type = "executable",
            command = "gdb",
            args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
        }

        dap.configurations.c = {
            {
                name = "Launch",
                type = "gdb",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                args = {}, -- provide arguments if needed
                cwd = "${workspaceFolder}",
                stopAtBeginningOfMainSubprogram = false,
            },
        }

        -- dap.configurations.c = {
        --     {
        -- 	name = "Launch",
        -- 	type = "gdb",
        -- 	request = "launch",
        -- 	program = function()
        -- 	    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        -- 	end,
        -- 	args = {}, -- provide arguments if needed
        -- 	cwd = "${workspaceFolder}",
        -- 	stopAtBeginningOfMainSubprogram = false,
        --     },
        --     {
        -- 	name = "Select and attach to process",
        -- 	type = "gdb",
        -- 	request = "attach",
        -- 	program = function()
        -- 	    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        -- 	end,
        -- 	pid = function()
        -- 	    local name = vim.fn.input('Executable name (filter): ')
        -- 	    return require("dap.utils").pick_process({ filter = name })
        -- 	end,
        -- 	cwd = '${workspaceFolder}'
        --     },
        --     {
        -- 	name = 'Attach to gdbserver :1234',
        -- 	type = 'gdb',
        -- 	request = 'attach',
        -- 	target = 'localhost:1234',
        -- 	program = function()
        -- 	    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        -- 	end,
        -- 	cwd = '${workspaceFolder}'
        --     }
        -- }

        dap.configurations.cpp = dap.configurations.c

        vim.keymap.set("n", "<space>b", dap.toggle_breakpoint, { desc = "Dap - Toggle Breakpoint" })
        vim.keymap.set("n", "<space>gb", dap.run_to_cursor, { desc = "Dap - Run to Cursor" })

        vim.keymap.set("n", "<F1>", dap.continue)
        vim.keymap.set("n", "<F2>", dap.step_into)
        vim.keymap.set("n", "<F3>", dap.step_over)
        vim.keymap.set("n", "<F4>", dap.step_out)
        vim.keymap.set("n", "<F5>", dap.step_back)

        vim.keymap.set("n", "<F10>", ui.open, { desc = "Dapui Open" })
        vim.keymap.set("n", "<F11>", ui.close, { desc = "Dapui Close" })
        vim.keymap.set("n", "<F12>", dap.terminate, { desc = "Dap Terminate" })

        dap.listeners.before.attach.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            ui.open()
        end
        -- dap.listeners.before.event_terminated.dapui_config = function()
        -- 	ui.close()
        -- end
        -- dap.listeners.before.event_exited.dapui_config = function()
        -- 	ui.close()
        -- end
    end,
}
