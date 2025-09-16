local M = {}

function M.align(opts)
	local lines = vim.api.nvim_buf_get_lines(0, opts.line1 - 1, opts.line2, false)
	local maxColumn = 0
	local newLines = {}

	for i = 1, #lines do
		local startIndex = string.find(lines[i], opts.args, 1, true)
		if startIndex and startIndex > maxColumn then
			maxColumn = startIndex
		end
	end

	for i = 1, #lines do
		local startIndex = string.find(lines[i], opts.args, 1, true)
		local newLine = ""

		if startIndex then
			local padding = maxColumn - startIndex
			local firstString = string.sub(lines[i], 1, startIndex - 1)
			local lastString  = string.sub(lines[i],    startIndex)

			newLine = firstString .. string.rep(" ", padding) .. lastString;
		else
			newLine = lines[i]
		end
		table.insert(newLines, newLine)
	end

	vim.api.nvim_buf_set_lines(0, opts.line1 - 1, opts.line2, false, newLines)
end


function M.setup()
	vim.api.nvim_create_user_command(
		'Align',
		function(opts)
			M.align(opts)
		end,
		{ range = true, nargs = '*' }
	)
end

return M
