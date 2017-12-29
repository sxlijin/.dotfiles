" Maintainer: Samuel Lijin

" Personal color scheme utility functions, for converting RGB hex color codes to
" the closest 256-color palette entry.
"
" Derived from Chris Kempson's Tomorrow-Night-Eighties theme, which itself
" originally borrowed this logic from the Desert256 project.

if has("gui_running") || &t_Co == 88 || &t_Co == 256
	" Returns an approximate grey index for the given grey level
	function! palettify#grey_number(x)
		if &t_Co == 88
			if a:x < 23
				return 0
			elseif a:x < 69
				return 1
			elseif a:x < 103
				return 2
			elseif a:x < 127
				return 3
			elseif a:x < 150
				return 4
			elseif a:x < 173
				return 5
			elseif a:x < 196
				return 6
			elseif a:x < 219
				return 7
			elseif a:x < 243
				return 8
			else
				return 9
			endif
		else
			if a:x < 14
				return 0
			else
				let l:n = (a:x - 8) / 10
				let l:m = (a:x - 8) % 10
				if l:m < 5
					return l:n
				else
					return l:n + 1
				endif
			endif
		endif
	endfunction

	" Returns the actual grey level represented by the grey index
	function! palettify#grey_level(n)
		if &t_Co == 88
			if a:n == 0
				return 0
			elseif a:n == 1
				return 46
			elseif a:n == 2
				return 92
			elseif a:n == 3
				return 115
			elseif a:n == 4
				return 139
			elseif a:n == 5
				return 162
			elseif a:n == 6
				return 185
			elseif a:n == 7
				return 208
			elseif a:n == 8
				return 231
			else
				return 255
			endif
		else
			if a:n == 0
				return 0
			else
				return 8 + (a:n * 10)
			endif
		endif
	endfunction

	" Returns the palette index for the given grey index
	function! palettify#grey_colour(n)
		if &t_Co == 88
			if a:n == 0
				return 16
			elseif a:n == 9
				return 79
			else
				return 79 + a:n
			endif
		else
			if a:n == 0
				return 16
			elseif a:n == 25
				return 231
			else
				return 231 + a:n
			endif
		endif
	endfunction

	" Returns an approximate colour index for the given colour level
	function! palettify#rgb_number(x)
		if &t_Co == 88
			if a:x < 69
				return 0
			elseif a:x < 172
				return 1
			elseif a:x < 230
				return 2
			else
				return 3
			endif
		else
			if a:x < 75
				return 0
			else
				let l:n = (a:x - 55) / 40
				let l:m = (a:x - 55) % 40
				if l:m < 20
					return l:n
				else
					return l:n + 1
				endif
			endif
		endif
	endfunction

	" Returns the actual colour level for the given colour index
	function! palettify#rgb_level(n)
		if &t_Co == 88
			if a:n == 0
				return 0
			elseif a:n == 1
				return 139
			elseif a:n == 2
				return 205
			else
				return 255
			endif
		else
			if a:n == 0
				return 0
			else
				return 55 + (a:n * 40)
			endif
		endif
	endfunction

	" Returns the palette index for the given R/G/B colour indices
	function! palettify#rgb_colour(x, y, z)
		if &t_Co == 88
			return 16 + (a:x * 16) + (a:y * 4) + a:z
		else
			return 16 + (a:x * 36) + (a:y * 6) + a:z
		endif
	endfunction

	" Returns the palette index to approximate the given R/G/B colour levels
	function! palettify#colour(r, g, b)
		" Get the closest grey
		let l:gx = palettify#grey_number(a:r)
		let l:gy = palettify#grey_number(a:g)
		let l:gz = palettify#grey_number(a:b)

		" Get the closest colour
		let l:x = palettify#rgb_number(a:r)
		let l:y = palettify#rgb_number(a:g)
		let l:z = palettify#rgb_number(a:b)

		if l:gx == l:gy && l:gy == l:gz
			" There are two possibilities
			let l:dgr = palettify#grey_level(l:gx) - a:r
			let l:dgg = palettify#grey_level(l:gy) - a:g
			let l:dgb = palettify#grey_level(l:gz) - a:b
			let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
			let l:dr = palettify#rgb_level(l:gx) - a:r
			let l:dg = palettify#rgb_level(l:gy) - a:g
			let l:db = palettify#rgb_level(l:gz) - a:b
			let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
			if l:dgrey < l:drgb
				" Use the grey
				return palettify#grey_colour(l:gx)
			else
				" Use the colour
				return palettify#rgb_colour(l:x, l:y, l:z)
			endif
		else
			" Only one possibility
			return palettify#rgb_colour(l:x, l:y, l:z)
		endif
	endfunction

	" Returns the palette index to approximate the 'rrggbb' hex string
	function! palettify#rgb(rgb)
		let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
		let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
		let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0

		return palettify#colour(l:r, l:g, l:b)
	endfunction

	" Sets the highlighting for the given group
	function! palettify#highlight(group, fg, bg, attr)
		if a:fg != ""
			exec "hi " . a:group . " guifg=#" . a:fg . " ctermfg=" . palettify#rgb(a:fg)
			exec "hi " . a:group . " guifg=#" . a:fg . " ctermfg=" . palettify#rgb(a:fg)
		endif
		if a:bg != ""
			exec "hi " . a:group . " guibg=#" . a:bg . " ctermbg=" . palettify#rgb(a:bg)
		endif
		if a:attr != ""
			exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
		endif
	endfunction
endif
