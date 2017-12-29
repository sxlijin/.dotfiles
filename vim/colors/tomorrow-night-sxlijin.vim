" Maintainer: Samuel Lijin
"
" Personal color scheme, derived from Chris Kempson's Tomorrow Night Eighties
" colorscheme (which has been since deprecated, since CK reimplemented it in the
" base16 colorscheme framework).

" Default GUI Colours
let s:foreground  = "cccccc" " light grey
let s:background  = "2d2d2d" " dark grey
let s:selection   = "515151" " some grey
let s:line        = "393939" " some grey
let s:comment     = "999999"
let s:red         = "f2777a"
let s:orange      = "f99157"
let s:yellow      = "ffcc66"
let s:green       = "99cc99"
let s:aqua        = "66cccc"
let s:blue        = "6699cc"
let s:purple      = "cc99cc"
let s:marigold    = "fbea74"
let s:magenta     = "ff71fb"
let s:yellow      = "ffff00"
let s:window      = "4d5057"

hi clear
syntax reset

let g:colors_name = "tomorrow-night-sxlijin"

runtime colors/palettify.vim

call palettify#highlight("Normal",        s:foreground, s:background, "")
call palettify#highlight("LineNr",        s:selection,  "",           "")
call palettify#highlight("NonText",       s:selection,  "",           "")
call palettify#highlight("SpecialKey",    s:selection,  "",           "")
call palettify#highlight("Search",        s:background, s:yellow,     "")
call palettify#highlight("TabLine",       s:window,     s:foreground, "reverse")
call palettify#highlight("TabLineFill",   s:window,     s:foreground, "reverse")
call palettify#highlight("StatusLine",    s:window,     s:yellow,     "reverse")
call palettify#highlight("StatusLineNC",  s:window,     s:foreground, "reverse")
call palettify#highlight("VertSplit",     s:window,     s:window,     "none")
call palettify#highlight("Visual",        "",           s:selection,  "")
call palettify#highlight("Directory",     s:blue,       "",           "")
call palettify#highlight("ModeMsg",       s:green,      "",           "")
call palettify#highlight("MoreMsg",       s:green,      "",           "")
call palettify#highlight("Question",      s:green,      "",           "")
call palettify#highlight("WarningMsg",    s:red,        "",           "")
call palettify#highlight("MatchParen",    "",           s:selection,  "")
call palettify#highlight("Folded",        s:comment,    s:background, "")
call palettify#highlight("FoldColumn",    "",           s:background, "")
call palettify#highlight("CursorLine",    "",           s:line,       "none")
call palettify#highlight("CursorColumn",  "",           s:line,       "none")
call palettify#highlight("PMenu",         s:foreground, s:selection,  "none")
call palettify#highlight("PMenuSel",      s:foreground, s:selection,  "reverse")
call palettify#highlight("SignColumn",    "",           s:background, "none")
call palettify#highlight("ColorColumn",   "",           s:line,       "none")

"" Standard Highlighting
call palettify#highlight("Comment",       s:comment,    "",           "")
call palettify#highlight("Todo",          s:yellow,     s:background, "reverse")
call palettify#highlight("Title",         s:comment,    "",           "")
call palettify#highlight("Identifier",    s:red,        "",           "none")
call palettify#highlight("Statement",     s:purple,     "",           "")
call palettify#highlight("Function",      s:blue,       "",           "")
call palettify#highlight("Constant",      s:orange,     "",           "")
call palettify#highlight("Keyword",       s:orange,     "",           "")
call palettify#highlight("String",        s:green,      "",           "")
call palettify#highlight("Special",       s:foreground, "",           "italic")
call palettify#highlight("SpecialComment",s:aqua,       "",           "none")
call palettify#highlight("PreProc",       s:marigold,   "",           "")
call palettify#highlight("Operator",      s:aqua,       "",           "none")
call palettify#highlight("Type",          s:blue,       "",           "none")
"call palettify#highlight("Ignore",        "666666",     "",           "")


hi link String         Constant
hi link Character      Constant
hi link Number         Constant
hi link Boolean        Constant
hi link Float          Number
hi link Function       Identifier
hi link Conditional    Statement
hi link Repeat         Statement
hi link Label          Statement
hi link Operator       Statement
hi link Keyword        Statement
hi link Exception      Statement
hi link Include        PreProc
hi link Define         PreProc
hi link Macro          PreProc
hi link PreCondit      PreProc
hi link StorageClass   Type
hi link Structure      Type
hi link Typedef        Type
hi link Tag            Special
hi link SpecialChar    Special
hi link Delimiter      Special
hi link SpecialComment Special
hi link Debug          Special


"" Vim Highlighting
call palettify#highlight("vimCommand", s:red, "", "none")
"
"" C Highlighting
"call palettify#highlight("cType", s:yellow, "", "")
"call palettify#highlight("cStorageClass", s:purple, "", "")
"call palettify#highlight("cConditional", s:purple, "", "")
"call palettify#highlight("cRepeat", s:purple, "", "")
"
"" PHP Highlighting
"call palettify#highlight("phpVarSelector", s:red, "", "")
"call palettify#highlight("phpKeyword", s:purple, "", "")
"call palettify#highlight("phpRepeat", s:purple, "", "")
"call palettify#highlight("phpConditional", s:purple, "", "")
"call palettify#highlight("phpStatement", s:purple, "", "")
"call palettify#highlight("phpMemberSelector", s:foreground, "", "")
"
"" Ruby Highlighting
"call palettify#highlight("rubySymbol", s:green, "", "")
"call palettify#highlight("rubyConstant", s:yellow, "", "")
"call palettify#highlight("rubyAccess", s:yellow, "", "")
"call palettify#highlight("rubyAttribute", s:blue, "", "")
"call palettify#highlight("rubyInclude", s:blue, "", "")
"call palettify#highlight("rubyLocalVariableOrMethod", s:orange, "", "")
"call palettify#highlight("rubyCurlyBlock", s:orange, "", "")
"call palettify#highlight("rubyStringDelimiter", s:green, "", "")
"call palettify#highlight("rubyInterpolationDelimiter", s:orange, "", "")
"call palettify#highlight("rubyConditional", s:purple, "", "")
"call palettify#highlight("rubyRepeat", s:purple, "", "")
"call palettify#highlight("rubyControl", s:purple, "", "")
"call palettify#highlight("rubyException", s:purple, "", "")
"
"" Crystal Highlighting
"call palettify#highlight("crystalSymbol", s:green, "", "")
"call palettify#highlight("crystalConstant", s:yellow, "", "")
"call palettify#highlight("crystalAccess", s:yellow, "", "")
"call palettify#highlight("crystalAttribute", s:blue, "", "")
"call palettify#highlight("crystalInclude", s:blue, "", "")
"call palettify#highlight("crystalLocalVariableOrMethod", s:orange, "", "")
"call palettify#highlight("crystalCurlyBlock", s:orange, "", "")
"call palettify#highlight("crystalStringDelimiter", s:green, "", "")
"call palettify#highlight("crystalInterpolationDelimiter", s:orange, "", "")
"call palettify#highlight("crystalConditional", s:purple, "", "")
"call palettify#highlight("crystalRepeat", s:purple, "", "")
"call palettify#highlight("crystalControl", s:purple, "", "")
"call palettify#highlight("crystalException", s:purple, "", "")
"
"" Python Highlighting
"call palettify#highlight("pythonInclude", s:purple, "", "")
"call palettify#highlight("pythonStatement", s:purple, "", "")
"call palettify#highlight("pythonConditional", s:purple, "", "")
"call palettify#highlight("pythonRepeat", s:purple, "", "")
"call palettify#highlight("pythonException", s:purple, "", "")
"call palettify#highlight("pythonFunction", s:blue, "", "")
"call palettify#highlight("pythonPreCondit", s:purple, "", "")
"call palettify#highlight("pythonRepeat", s:aqua, "", "")
"call palettify#highlight("pythonExClass", s:orange, "", "")
"
"" JavaScript Highlighting
"call palettify#highlight("javaScriptBraces", s:foreground, "", "")
"call palettify#highlight("javaScriptFunction", s:purple, "", "")
"call palettify#highlight("javaScriptConditional", s:purple, "", "")
"call palettify#highlight("javaScriptRepeat", s:purple, "", "")
"call palettify#highlight("javaScriptNumber", s:orange, "", "")
"call palettify#highlight("javaScriptMember", s:orange, "", "")
"call palettify#highlight("javascriptNull", s:orange, "", "")
"call palettify#highlight("javascriptGlobal", s:blue, "", "")
"call palettify#highlight("javascriptStatement", s:red, "", "")
"
"" CoffeeScript Highlighting
"call palettify#highlight("coffeeRepeat", s:purple, "", "")
"call palettify#highlight("coffeeConditional", s:purple, "", "")
"call palettify#highlight("coffeeKeyword", s:purple, "", "")
"call palettify#highlight("coffeeObject", s:yellow, "", "")
"
"" HTML Highlighting
"call palettify#highlight("htmlTag", s:red, "", "")
"call palettify#highlight("htmlTagName", s:red, "", "")
"call palettify#highlight("htmlArg", s:red, "", "")
"call palettify#highlight("htmlScriptTag", s:red, "", "")
"
"" Diff Highlighting
"call palettify#highlight("diffAdd", "", "4c4e39", "")
"call palettify#highlight("diffDelete", s:background, s:red, "")
"call palettify#highlight("diffChange", "", "2B5B77", "")
"call palettify#highlight("diffText", s:line, s:blue, "")
"
"" ShowMarks Highlighting
"call palettify#highlight("ShowMarksHLl", s:orange, s:background, "none")
"call palettify#highlight("ShowMarksHLo", s:purple, s:background, "none")
"call palettify#highlight("ShowMarksHLu", s:yellow, s:background, "none")
"call palettify#highlight("ShowMarksHLm", s:aqua, s:background, "none")
"
"" Lua Highlighting
"call palettify#highlight("luaStatement", s:purple, "", "")
"call palettify#highlight("luaRepeat", s:purple, "", "")
"call palettify#highlight("luaCondStart", s:purple, "", "")
"call palettify#highlight("luaCondElseif", s:purple, "", "")
"call palettify#highlight("luaCond", s:purple, "", "")
"call palettify#highlight("luaCondEnd", s:purple, "", "")
"
"" Cucumber Highlighting
"call palettify#highlight("cucumberGiven", s:blue, "", "")
"call palettify#highlight("cucumberGivenAnd", s:blue, "", "")
"
"" Go Highlighting
"call palettify#highlight("goDirective", s:purple, "", "")
"call palettify#highlight("goDeclaration", s:purple, "", "")
"call palettify#highlight("goStatement", s:purple, "", "")
"call palettify#highlight("goConditional", s:purple, "", "")
"call palettify#highlight("goConstants", s:orange, "", "")
"call palettify#highlight("goTodo", s:yellow, "", "")
"call palettify#highlight("goDeclType", s:blue, "", "")
"call palettify#highlight("goBuiltins", s:purple, "", "")
"call palettify#highlight("goRepeat", s:purple, "", "")
"call palettify#highlight("goLabel", s:purple, "", "")
"
"" Clojure Highlighting
"call palettify#highlight("clojureConstant", s:orange, "", "")
"call palettify#highlight("clojureBoolean", s:orange, "", "")
"call palettify#highlight("clojureCharacter", s:orange, "", "")
"call palettify#highlight("clojureKeyword", s:green, "", "")
"call palettify#highlight("clojureNumber", s:orange, "", "")
"call palettify#highlight("clojureString", s:green, "", "")
"call palettify#highlight("clojureRegexp", s:green, "", "")
"call palettify#highlight("clojureParen", s:aqua, "", "")
"call palettify#highlight("clojureVariable", s:yellow, "", "")
"call palettify#highlight("clojureCond", s:blue, "", "")
"call palettify#highlight("clojureDefine", s:purple, "", "")
"call palettify#highlight("clojureException", s:red, "", "")
"call palettify#highlight("clojureFunc", s:blue, "", "")
"call palettify#highlight("clojureMacro", s:blue, "", "")
"call palettify#highlight("clojureRepeat", s:blue, "", "")
"call palettify#highlight("clojureSpecial", s:purple, "", "")
"call palettify#highlight("clojureQuote", s:blue, "", "")
"call palettify#highlight("clojureUnquote", s:blue, "", "")
"call palettify#highlight("clojureMeta", s:blue, "", "")
"call palettify#highlight("clojureDeref", s:blue, "", "")
"call palettify#highlight("clojureAnonArg", s:blue, "", "")
"call palettify#highlight("clojureRepeat", s:blue, "", "")
"call palettify#highlight("clojureDispatch", s:blue, "", "")
"
"" Scala Highlighting
"call palettify#highlight("scalaKeyword", s:purple, "", "")
"call palettify#highlight("scalaKeywordModifier", s:purple, "", "")
"call palettify#highlight("scalaOperator", s:blue, "", "")
"call palettify#highlight("scalaPackage", s:red, "", "")
"call palettify#highlight("scalaFqn", s:foreground, "", "")
"call palettify#highlight("scalaFqnSet", s:foreground, "", "")
"call palettify#highlight("scalaImport", s:purple, "", "")
"call palettify#highlight("scalaBoolean", s:orange, "", "")
"call palettify#highlight("scalaDef", s:purple, "", "")
"call palettify#highlight("scalaVal", s:purple, "", "")
"call palettify#highlight("scalaVar", s:aqua, "", "")
"call palettify#highlight("scalaClass", s:purple, "", "")
"call palettify#highlight("scalaObject", s:purple, "", "")
"call palettify#highlight("scalaTrait", s:purple, "", "")
"call palettify#highlight("scalaDefName", s:blue, "", "")
"call palettify#highlight("scalaValName", s:foreground, "", "")
"call palettify#highlight("scalaVarName", s:foreground, "", "")
"call palettify#highlight("scalaClassName", s:foreground, "", "")
"call palettify#highlight("scalaType", s:yellow, "", "")
"call palettify#highlight("scalaTypeSpecializer", s:yellow, "", "")
"call palettify#highlight("scalaAnnotation", s:orange, "", "")
"call palettify#highlight("scalaNumber", s:orange, "", "")
"call palettify#highlight("scalaDefSpecializer", s:yellow, "", "")
"call palettify#highlight("scalaClassSpecializer", s:yellow, "", "")
"call palettify#highlight("scalaBackTick", s:green, "", "")
"call palettify#highlight("scalaRoot", s:foreground, "", "")
"call palettify#highlight("scalaMethodCall", s:blue, "", "")
"call palettify#highlight("scalaCaseType", s:yellow, "", "")
"call palettify#highlight("scalaLineComment", s:comment, "", "")
"call palettify#highlight("scalaComment", s:comment, "", "")
"call palettify#highlight("scalaDocComment", s:comment, "", "")
"call palettify#highlight("scalaDocTags", s:comment, "", "")
"call palettify#highlight("scalaEmptyString", s:green, "", "")
"call palettify#highlight("scalaMultiLineString", s:green, "", "")
"call palettify#highlight("scalaUnicode", s:orange, "", "")
"call palettify#highlight("scalaString", s:green, "", "")
"call palettify#highlight("scalaStringEscape", s:green, "", "")
"call palettify#highlight("scalaSymbol", s:orange, "", "")
"call palettify#highlight("scalaChar", s:orange, "", "")
"call palettify#highlight("scalaXml", s:green, "", "")
"call palettify#highlight("scalaConstructorSpecializer", s:yellow, "", "")
"call palettify#highlight("scalaBackTick", s:blue, "", "")
"
"" Git
"call palettify#highlight("diffAdded", s:green, "", "")
"call palettify#highlight("diffRemoved", s:red, "", "")
"call palettify#highlight("gitcommitSummary", "", "", "bold")

set background=dark
