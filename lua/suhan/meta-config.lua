local Meta = {
	terminal_types = {
	  powershell = 'powershell',
		cmd = 'cmd',
		bash = 'bash',
	}
}

Meta.config = {
	defualt_shell = Meta.terminal_types.powershell
}

return Meta

