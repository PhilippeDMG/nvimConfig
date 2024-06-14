return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local todo_comments = require("todo-comments")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "]t", function()
			todo_comments.jump_next()
		end, { desc = "Next todo comment" })

		keymap.set("n", "[t", function()
			todo_comments.jump_prev()
		end, { desc = "Previous todo comment" })

		todo_comments.setup()
	end,
}
-- TODO: what is this lol🔥
-- BUG: very cool stuff🔥
-- HACK: i wonder if i can use emojis here?🔥 yup
-- PERF: fully optimised
-- NOTE: note for me
-- WARNING: !!!!! careful
-- FIX: FIX RN
