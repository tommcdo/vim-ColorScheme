function! s:ColorScheme(cs)
	if !exists('g:ColorScheme_commands')
		exec 'colorscheme '.a:cs
		return
	endif
	let cmds = get(g:ColorScheme_commands, a:cs, {})
	let before = get(cmds, 'before', [])
	let after = get(cmds, 'after', [])
	for cmd in before
		exec cmd
	endfor
	exec 'colorscheme '.a:cs
	for cmd in after
		exec cmd
	endfor
endfunction

command! -nargs=1 -complete=color ColorScheme call <SID>ColorScheme('<args>')
