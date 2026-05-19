vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
vim.g.colors_name = "waybar-custom"
vim.o.background = "dark"

local c = {
  -- Fonds (noirs / très sombres)
  bg0       = "#000001",  -- noir espace
  bg1       = "#0d0a08",  -- fond principal
  bg2       = "#171210",  -- mantle
  bg3       = "#221a14",  -- surface légère
  bg4       = "#2e1f15",  -- surface active / cursorline

  -- Textes
  text      = "#e8d5c0",  -- crème clair
  subtext1  = "#c4a882",  -- crème moyen
  subtext2  = "#8a7060",  -- crème foncé

  -- Accents tirés de Jupiter
  orange    = "#c87941",  -- bande orange chaude
  rust      = "#a0522d",  -- roux profond
  brown     = "#7a3e1e",  -- marron sombre
  cream     = "#d4b896",  -- blanc cassé des nuages
  storm     = "#b85c38",  -- grande tache rouge
  dust      = "#e8a96a",  -- orange clair / poussière
  pale      = "#f0dcc8",  -- crème très clair

  -- Accents froids (pour contraste)
  blue      = "#7a9cbf",  -- bleu-gris spatial
  muted     = "#5a7a8a",  -- teal désaturé
  purple    = "#8b6a9a",  -- violet poussiéreux

  none      = "NONE",
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Editor UI
hi("Normal",        { fg = c.text,     bg = c.bg1 })
hi("NormalNC",      { fg = c.text,     bg = c.bg2 })
hi("NormalFloat",   { fg = c.text,     bg = c.bg2 })
hi("FloatBorder",   { fg = c.bg4,      bg = c.bg2 })
hi("Cursor",        { fg = c.bg1,      bg = c.dust })
hi("CursorLine",    { bg = c.bg4 })
hi("CursorLineNr",  { fg = c.orange,   bold = true })
hi("LineNr",        { fg = c.subtext2 })
hi("SignColumn",    { fg = c.bg4,      bg = c.bg1 })
hi("ColorColumn",   { bg = c.bg3 })
hi("Visual",        { bg = c.bg4 })
hi("VisualNOS",     { bg = c.bg4 })
hi("Search",        { fg = c.bg1,      bg = c.dust })
hi("IncSearch",     { fg = c.bg1,      bg = c.orange })
hi("CurSearch",     { fg = c.bg1,      bg = c.orange })
hi("MatchParen",    { fg = c.dust,     bold = true, underline = true })
hi("NonText",       { fg = c.subtext2 })
hi("Whitespace",    { fg = c.bg3 })
hi("SpecialKey",    { fg = c.subtext2 })
hi("Folded",        { fg = c.subtext1, bg = c.bg3 })
hi("FoldColumn",    { fg = c.subtext2, bg = c.bg1 })
hi("Conceal",       { fg = c.subtext2 })
hi("Directory",     { fg = c.dust })
hi("Title",         { fg = c.orange,   bold = true })
hi("Question",      { fg = c.cream })
hi("MoreMsg",       { fg = c.cream })
hi("ModeMsg",       { fg = c.text,     bold = true })
hi("ErrorMsg",      { fg = c.storm })
hi("WarningMsg",    { fg = c.dust })
hi("SpellBad",      { sp = c.storm,    undercurl = true })
hi("SpellCap",      { sp = c.dust,     undercurl = true })
hi("SpellRare",     { sp = c.muted,    undercurl = true })
hi("SpellLocal",    { sp = c.blue,     undercurl = true })

-- Statusline
hi("StatusLine",    { fg = c.text,     bg = c.bg2 })
hi("StatusLineNC",  { fg = c.subtext2, bg = c.bg2 })
hi("WinBar",        { fg = c.text,     bg = c.bg1 })
hi("WinBarNC",      { fg = c.subtext2, bg = c.bg1 })
hi("TabLine",       { fg = c.subtext1, bg = c.bg2 })
hi("TabLineSel",    { fg = c.dust,     bg = c.bg4, bold = true })
hi("TabLineFill",   { bg = c.bg0 })

-- Popup menu
hi("Pmenu",         { fg = c.text,     bg = c.bg2 })
hi("PmenuSel",      { fg = c.bg1,      bg = c.orange })
hi("PmenuSbar",     { bg = c.bg3 })
hi("PmenuThumb",    { bg = c.bg4 })

-- Syntax
hi("Comment",       { fg = c.subtext2, italic = true })
hi("Constant",      { fg = c.dust })
hi("String",        { fg = c.cream })
hi("Character",     { fg = c.pale })
hi("Number",        { fg = c.dust })
hi("Boolean",       { fg = c.orange })
hi("Float",         { fg = c.dust })
hi("Identifier",    { fg = c.subtext1 })
hi("Function",      { fg = c.orange })
hi("Statement",     { fg = c.rust })
hi("Conditional",   { fg = c.rust })
hi("Repeat",        { fg = c.rust })
hi("Label",         { fg = c.rust })
hi("Operator",      { fg = c.cream })
hi("Keyword",       { fg = c.storm,    italic = true })
hi("Exception",     { fg = c.storm })
hi("PreProc",       { fg = c.dust })
hi("Include",       { fg = c.rust })
hi("Define",        { fg = c.rust })
hi("Macro",         { fg = c.orange })
hi("PreCondit",     { fg = c.rust })
hi("Type",          { fg = c.dust,     italic = true })
hi("StorageClass",  { fg = c.dust })
hi("Structure",     { fg = c.dust })
hi("Typedef",       { fg = c.dust })
hi("Special",       { fg = c.cream })
hi("SpecialChar",   { fg = c.pale })
hi("Tag",           { fg = c.orange })
hi("Delimiter",     { fg = c.subtext1 })
hi("SpecialComment",{ fg = c.subtext2, italic = true })
hi("Debug",         { fg = c.storm })
hi("Underlined",    { underline = true })
hi("Error",         { fg = c.storm })
hi("Todo",          { fg = c.bg1,      bg = c.storm, bold = true })

-- Treesitter
hi("@variable",             { fg = c.text })
hi("@variable.builtin",     { fg = c.storm })
hi("@variable.parameter",   { fg = c.pale })
hi("@variable.member",      { fg = c.subtext1 })
hi("@constant",             { fg = c.dust })
hi("@constant.builtin",     { fg = c.orange })
hi("@constant.macro",       { fg = c.rust })
hi("@module",               { fg = c.subtext1 })
hi("@string",               { fg = c.cream })
hi("@string.escape",        { fg = c.pale })
hi("@string.special",       { fg = c.dust })
hi("@character",            { fg = c.pale })
hi("@number",               { fg = c.dust })
hi("@boolean",              { fg = c.orange })
hi("@float",                { fg = c.dust })
hi("@function",             { fg = c.orange })
hi("@function.builtin",     { fg = c.dust })
hi("@function.macro",       { fg = c.rust })
hi("@function.method",      { fg = c.orange })
hi("@constructor",          { fg = c.cream })
hi("@operator",             { fg = c.subtext1 })
hi("@keyword",              { fg = c.storm,    italic = true })
hi("@keyword.return",       { fg = c.rust,     italic = true })
hi("@keyword.exception",    { fg = c.storm })
hi("@type",                 { fg = c.dust,     italic = true })
hi("@type.builtin",         { fg = c.orange,   italic = true })
hi("@attribute",            { fg = c.dust })
hi("@property",             { fg = c.subtext1 })
hi("@punctuation",          { fg = c.subtext2 })
hi("@punctuation.bracket",  { fg = c.subtext1 })
hi("@punctuation.delimiter",{ fg = c.subtext2 })
hi("@comment",              { fg = c.subtext2, italic = true })
hi("@tag",                  { fg = c.rust })
hi("@tag.attribute",        { fg = c.dust })
hi("@tag.delimiter",        { fg = c.subtext2 })

-- LSP diagnostics
hi("DiagnosticError",            { fg = c.storm })
hi("DiagnosticWarn",             { fg = c.dust })
hi("DiagnosticInfo",             { fg = c.blue })
hi("DiagnosticHint",             { fg = c.muted })
hi("DiagnosticVirtualTextError", { fg = c.storm,  bg = c.bg3, italic = true })
hi("DiagnosticVirtualTextWarn",  { fg = c.dust,   bg = c.bg3, italic = true })
hi("DiagnosticVirtualTextInfo",  { fg = c.blue,   bg = c.bg3, italic = true })
hi("DiagnosticVirtualTextHint",  { fg = c.muted,  bg = c.bg3, italic = true })
hi("DiagnosticUnderlineError",   { sp = c.storm,  undercurl = true })
hi("DiagnosticUnderlineWarn",    { sp = c.dust,   undercurl = true })
hi("DiagnosticUnderlineInfo",    { sp = c.blue,   undercurl = true })
hi("DiagnosticUnderlineHint",    { sp = c.muted,  undercurl = true })
hi("LspReferenceText",           { bg = c.bg3 })
hi("LspReferenceRead",           { bg = c.bg3 })
hi("LspReferenceWrite",          { bg = c.bg4,    bold = true })

-- Git
hi("GitSignsAdd",    { fg = c.cream })
hi("GitSignsChange", { fg = c.dust })
hi("GitSignsDelete", { fg = c.storm })
hi("DiffAdd",        { bg = "#111a10" })
hi("DiffChange",     { bg = "#1a1208" })
hi("DiffDelete",     { fg = c.storm,  bg = "#1a0a08" })
hi("DiffText",       { bg = "#261a08" })

-- Telescope
hi("TelescopeNormal",         { fg = c.text,     bg = c.bg2 })
hi("TelescopeBorder",         { fg = c.bg4,      bg = c.bg2 })
hi("TelescopeSelection",      { fg = c.text,     bg = c.bg4 })
hi("TelescopeSelectionCaret", { fg = c.orange })
hi("TelescopeMatching",       { fg = c.dust,     bold = true })
hi("TelescopePromptPrefix",   { fg = c.orange })
