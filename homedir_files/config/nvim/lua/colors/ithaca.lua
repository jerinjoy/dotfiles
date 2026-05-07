-- Ithaca colorscheme
-- Dark and light variants available

local M = {}

-- Color palettes from new_theme.json
local palette = {
  dark = {
    bg = "#0f191e",
    bg_dark = "#0f191e",
    bg_highlight = "#1c2b33",
    terminal_black = "#1c2b33",
    fg = "#f1f4f7",
    fg_dark = "#f1f4f7",
    fg_gutter = "#465a69",
    dark3 = "#67788a",
    comment = "#67788a",
    dark5 = "#67788a",
    blue0 = "#3cd7f5",
    blue = "#47a5fa",
    cyan = "#3cd7f5",
    blue1 = "#47a5fa",
    blue2 = "#47a5fa",
    blue5 = "#47a5fa",
    blue6 = "#47a5fa",
    blue7 = "#47a5fa",
    magenta = "#8773ff",
    magenta2 = "#8773ff",
    purple = "#8773ff",
    orange = "#fa8719",
    yellow = "#ffdc32",
    green = "#6ee146",
    green1 = "#6ee146",
    green2 = "#6ee146",
    teal = "#00d2be",
    red = "#f05f69",
    red1 = "#f05f69",
    border = "#465a69",
    border_highlight = "#5e7388",

    -- UI
    bg_sidebar = "#1c2b33",
    bg_float = "#1c2b33",
    bg_popup = "#1c2b33",
    bg_statusline = "#1c2b33",
    bg_search = "#283943",
    bg_visual = "#283943",

    -- Diff
    diff_add = "#0d2a14",
    diff_change = "#1c2b33",
    diff_delete = "#2a0d14",
    diff_text = "#283943",

    -- Git
    git_add = "#6ee146",
    git_change = "#ffdc32",
    git_delete = "#f05f69",
  },
  light = {
    bg = "#f1f4f7",
    bg_dark = "#dee3e9",
    bg_highlight = "#dee3e9",
    terminal_black = "#cbd2d9",
    fg = "#1c2b33",
    fg_dark = "#1c2b33",
    fg_gutter = "#a4adb8",
    dark3 = "#67788a",
    comment = "#67788a",
    dark5 = "#67788a",
    blue0 = "#0073aa",
    blue = "#0064e0",
    cyan = "#0073aa",
    blue1 = "#0064e0",
    blue2 = "#0064e0",
    blue5 = "#0064e0",
    blue6 = "#0064e0",
    blue7 = "#0064e0",
    magenta = "#6441d2",
    magenta2 = "#6441d2",
    purple = "#6441d2",
    orange = "#af5a00",
    yellow = "#f0aa19",
    green = "#28d232",
    green1 = "#28d232",
    green2 = "#28d232",
    teal = "#00787d",
    red = "#e6193b",
    red1 = "#e6193b",
    border = "#a4adb8",
    border_highlight = "#8595a4",

    -- UI
    bg_sidebar = "#dee3e9",
    bg_float = "#dee3e9",
    bg_popup = "#dee3e9",
    bg_statusline = "#dee3e9",
    bg_search = "#cbd2d9",
    bg_visual = "#cbd2d9",

    -- Diff
    diff_add = "#e6fdeb",
    diff_change = "#dee3e9",
    diff_delete = "#ffeef0",
    diff_text = "#cbd2d9",

    -- Git
    git_add = "#28d232",
    git_change = "#f0aa19",
    git_delete = "#e6193b",
  },
}

function M.setup(opts)
  opts = opts or {}
  local style = opts.style or "dark" -- "dark" or "light"
  local colors = palette[style]

  if not colors then
    vim.notify("Invalid style for Ithaca colorscheme: " .. style, vim.log.levels.ERROR)
    return
  end

  -- Reset highlights
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.background = style
  vim.g.colors_name = "ithaca-" .. style

  local highlights = {
    -- Base
    Normal = { fg = colors.fg, bg = colors.bg },
    NormalNC = { fg = colors.fg, bg = colors.bg },
    NormalFloat = { fg = colors.fg, bg = colors.bg_float },
    FloatBorder = { fg = colors.border_highlight, bg = colors.bg_float },
    FloatTitle = { fg = colors.blue, bg = colors.bg_float, bold = true },
    EndOfBuffer = { fg = colors.bg },
    TermCursor = { fg = colors.bg_dark, bg = colors.fg },
    TermCursorNC = { fg = colors.bg_dark, bg = colors.fg_dark },

    -- Cursor
    Cursor = { fg = colors.bg, bg = colors.fg },
    CursorIM = { fg = colors.bg, bg = colors.fg },
    lCursor = { fg = colors.bg, bg = colors.fg },
    CursorLine = { bg = colors.bg_highlight },
    CursorColumn = { bg = colors.bg_highlight },
    CursorLineNr = { fg = colors.fg, bold = true },
    LineNr = { fg = colors.fg_gutter },
    LineNrAbove = { fg = colors.fg_gutter },
    LineNrBelow = { fg = colors.fg_gutter },

    -- Sign column
    SignColumn = { fg = colors.fg_gutter, bg = colors.bg },
    SignColumnSB = { fg = colors.fg_gutter, bg = colors.bg_sidebar },
    FoldColumn = { fg = colors.comment, bg = colors.bg },

    -- Statusline
    StatusLine = { fg = colors.fg, bg = colors.bg_statusline },
    StatusLineNC = { fg = colors.comment, bg = colors.bg_statusline },
    StatusLineSeparator = { fg = colors.bg_statusline, bg = colors.bg_statusline },
    StatusLineTerm = { fg = colors.fg, bg = colors.bg_statusline },
    StatusLineTermNC = { fg = colors.comment, bg = colors.bg_statusline },

    -- Tabline
    TabLine = { fg = colors.comment, bg = colors.bg_statusline },
    TabLineFill = { bg = colors.bg_dark },
    TabLineSel = { fg = colors.fg, bg = colors.bg },

    -- Winbar
    WinBar = { fg = colors.fg, bg = colors.bg },
    WinBarNC = { fg = colors.comment, bg = colors.bg },

    -- Visual
    Visual = { bg = colors.bg_visual },
    VisualNOS = { bg = colors.bg_visual },

    -- Search
    Search = { fg = colors.bg, bg = colors.yellow },
    IncSearch = { fg = colors.bg, bg = colors.orange },
    CurSearch = { link = "IncSearch" },

    -- Fold
    Folded = { fg = colors.blue, bg = colors.bg_highlight },

    -- Diff
    DiffAdd = { bg = colors.diff_add },
    DiffChange = { bg = colors.diff_change },
    DiffDelete = { bg = colors.diff_delete },
    DiffText = { bg = colors.diff_text },

    -- Spell
    SpellBad = { sp = colors.red, undercurl = true },
    SpellCap = { sp = colors.yellow, undercurl = true },
    SpellLocal = { sp = colors.blue, undercurl = true },
    SpellRare = { sp = colors.purple, undercurl = true },

    -- Pmenu
    Pmenu = { fg = colors.fg, bg = colors.bg_popup },
    PmenuSel = { fg = colors.bg, bg = colors.blue },
    PmenuSbar = { bg = colors.bg_popup },
    PmenuThumb = { bg = colors.fg_gutter },
    PmenuKind = { fg = colors.purple, bg = colors.bg_popup },
    PmenuKindSel = { fg = colors.bg, bg = colors.blue },
    PmenuExtra = { fg = colors.comment, bg = colors.bg_popup },
    PmenuExtraSel = { fg = colors.bg, bg = colors.blue },

    -- Wild menu
    WildMenu = { fg = colors.bg, bg = colors.blue },

    -- Msg
    MsgArea = { fg = colors.fg, bg = colors.bg },
    MsgSeparator = { fg = colors.border, bg = colors.bg },
    MoreMsg = { fg = colors.blue },
    ModeMsg = { fg = colors.fg, bold = true },
    Question = { fg = colors.blue },

    -- Error/Warning
    ErrorMsg = { fg = colors.red },
    WarningMsg = { fg = colors.yellow },
    DiagnosticError = { fg = colors.red },
    DiagnosticWarn = { fg = colors.yellow },
    DiagnosticInfo = { fg = colors.blue },
    DiagnosticHint = { fg = colors.cyan },
    DiagnosticOk = { fg = colors.green },

    DiagnosticUnderlineError = { sp = colors.red, undercurl = true },
    DiagnosticUnderlineWarn = { sp = colors.yellow, undercurl = true },
    DiagnosticUnderlineInfo = { sp = colors.blue, undercurl = true },
    DiagnosticUnderlineHint = { sp = colors.cyan, undercurl = true },

    DiagnosticSignError = { fg = colors.red, bg = colors.bg },
    DiagnosticSignWarn = { fg = colors.yellow, bg = colors.bg },
    DiagnosticSignInfo = { fg = colors.blue, bg = colors.bg },
    DiagnosticSignHint = { fg = colors.cyan, bg = colors.bg },

    DiagnosticVirtualTextError = { fg = colors.red, bg = colors.bg },
    DiagnosticVirtualTextWarn = { fg = colors.yellow, bg = colors.bg },
    DiagnosticVirtualTextInfo = { fg = colors.blue, bg = colors.bg },
    DiagnosticVirtualTextHint = { fg = colors.cyan, bg = colors.bg },

    -- Syntax
    Comment = { fg = colors.comment, italic = true },

    Constant = { fg = colors.orange },
    String = { fg = colors.green },
    Character = { fg = colors.green },
    Number = { fg = colors.orange },
    Boolean = { fg = colors.orange },
    Float = { fg = colors.orange },

    Identifier = { fg = colors.fg },
    Function = { fg = colors.blue },

    Statement = { fg = colors.purple },
    Conditional = { fg = colors.purple },
    Repeat = { fg = colors.purple },
    Label = { fg = colors.purple },
    Operator = { fg = colors.fg },
    Keyword = { fg = colors.purple },
    Exception = { fg = colors.purple },

    PreProc = { fg = colors.cyan },
    Include = { fg = colors.purple },
    Define = { fg = colors.purple },
    Macro = { fg = colors.purple },
    PreCondit = { fg = colors.purple },

    Type = { fg = colors.yellow },
    StorageClass = { fg = colors.yellow },
    Structure = { fg = colors.yellow },
    Typedef = { fg = colors.yellow },

    Special = { fg = colors.teal },
    SpecialChar = { fg = colors.teal },
    Tag = { fg = colors.blue },
    Delimiter = { fg = colors.fg },
    SpecialComment = { fg = colors.comment },
    Debug = { fg = colors.orange },

    Underlined = { underline = true },
    Bold = { bold = true },
    Italic = { italic = true },
    Ignore = { fg = colors.fg_gutter },

    Error = { fg = colors.red },
    Todo = { fg = colors.bg, bg = colors.yellow, bold = true },

    -- Treesitter
    ["@comment"] = { link = "Comment" },
    ["@comment.documentation"] = { link = "Comment" },
    ["@error"] = { link = "Error" },
    ["@none"] = { fg = colors.fg },

    ["@keyword"] = { link = "Keyword" },
    ["@keyword.function"] = { fg = colors.purple },
    ["@keyword.operator"] = { fg = colors.purple },
    ["@keyword.return"] = { fg = colors.purple },

    ["@conditional"] = { link = "Conditional" },
    ["@repeat"] = { link = "Repeat" },
    ["@debug"] = { link = "Debug" },
    ["@label"] = { link = "Label" },
    ["@include"] = { link = "Include" },
    ["@exception"] = { link = "Exception" },

    ["@type"] = { link = "Type" },
    ["@type.builtin"] = { link = "Type" },
    ["@type.qualifier"] = { link = "Keyword" },
    ["@type.definition"] = { link = "Typedef" },

    ["@storageclass"] = { link = "StorageClass" },
    ["@attribute"] = { fg = colors.purple },
    ["@field"] = { fg = colors.fg },
    ["@property"] = { fg = colors.fg },

    ["@variable"] = { fg = colors.fg },
    ["@variable.builtin"] = { fg = colors.red },

    ["@constant"] = { link = "Constant" },
    ["@constant.builtin"] = { fg = colors.orange },
    ["@constant.macro"] = { fg = colors.purple },

    ["@namespace"] = { fg = colors.purple },
    ["@symbol"] = { fg = colors.teal },

    ["@text"] = { fg = colors.fg },
    ["@text.strong"] = { bold = true },
    ["@text.emphasis"] = { italic = true },
    ["@text.underline"] = { underline = true },
    ["@text.strike"] = { strikethrough = true },
    ["@text.title"] = { fg = colors.blue, bold = true },
    ["@text.literal"] = { fg = colors.green },
    ["@text.uri"] = { fg = colors.blue, underline = true },
    ["@text.math"] = { fg = colors.blue },
    ["@text.environment"] = { fg = colors.purple },
    ["@text.environment.name"] = { fg = colors.blue },
    ["@text.reference"] = { fg = colors.blue },

    ["@string"] = { link = "String" },
    ["@string.regex"] = { fg = colors.teal },
    ["@string.escape"] = { fg = colors.purple },
    ["@string.special"] = { fg = colors.teal },

    ["@character"] = { link = "Character" },
    ["@character.special"] = { fg = colors.teal },

    ["@number"] = { link = "Number" },
    ["@boolean"] = { link = "Boolean" },
    ["@float"] = { link = "Float" },

    ["@function"] = { link = "Function" },
    ["@function.builtin"] = { fg = colors.blue },
    ["@function.macro"] = { fg = colors.blue },
    ["@function.call"] = { fg = colors.blue },

    ["@method"] = { link = "Function" },
    ["@method.call"] = { link = "Function" },

    ["@constructor"] = { fg = colors.blue },
    ["@parameter"] = { fg = colors.fg },

    ["@operator"] = { link = "Operator" },

    ["@punctuation.delimiter"] = { fg = colors.fg },
    ["@punctuation.bracket"] = { fg = colors.fg },
    ["@punctuation.special"] = { fg = colors.teal },

    ["@tag"] = { fg = colors.blue },
    ["@tag.attribute"] = { fg = colors.purple },
    ["@tag.delimiter"] = { fg = colors.fg },

    -- LSP
    LspReferenceText = { bg = colors.bg_highlight },
    LspReferenceRead = { bg = colors.bg_highlight },
    LspReferenceWrite = { bg = colors.bg_highlight },
    LspSignatureActiveParameter = { fg = colors.orange, bold = true },
    LspCodeLens = { fg = colors.comment },
    LspInlayHint = { fg = colors.comment, bg = colors.bg_highlight },

    -- Git
    GitSignsAdd = { fg = colors.git_add, bg = colors.bg },
    GitSignsChange = { fg = colors.git_change, bg = colors.bg },
    GitSignsDelete = { fg = colors.git_delete, bg = colors.bg },
    GitSignsAddNr = { fg = colors.git_add, bg = colors.bg },
    GitSignsChangeNr = { fg = colors.git_change, bg = colors.bg },
    GitSignsDeleteNr = { fg = colors.git_delete, bg = colors.bg },
    GitSignsAddLn = { bg = colors.diff_add },
    GitSignsChangeLn = { bg = colors.diff_change },
    GitSignsDeleteLn = { bg = colors.diff_delete },

    -- Telescope
    TelescopeNormal = { fg = colors.fg, bg = colors.bg_float },
    TelescopeBorder = { fg = colors.border_highlight, bg = colors.bg_float },
    TelescopePromptNormal = { fg = colors.fg, bg = colors.bg_popup },
    TelescopePromptBorder = { fg = colors.border_highlight, bg = colors.bg_popup },
    TelescopePromptTitle = { fg = colors.bg, bg = colors.blue, bold = true },
    TelescopePreviewTitle = { fg = colors.bg, bg = colors.green, bold = true },
    TelescopeResultsTitle = { fg = colors.bg, bg = colors.purple, bold = true },
    TelescopeSelection = { fg = colors.fg, bg = colors.bg_highlight },
    TelescopeSelectionCaret = { fg = colors.red },
    TelescopeMatching = { fg = colors.yellow, bold = true },

    -- WhichKey
    WhichKey = { fg = colors.blue },
    WhichKeyGroup = { fg = colors.purple },
    WhichKeyDesc = { fg = colors.fg },
    WhichKeySeparator = { fg = colors.comment },
    WhichKeyFloat = { bg = colors.bg_float },

    -- Indent Blankline
    IblIndent = { fg = colors.border, nocombine = true },
    IblScope = { fg = colors.purple, nocombine = true },

    -- Dashboard
    DashboardHeader = { fg = colors.blue },
    DashboardFooter = { fg = colors.comment },
    DashboardProjectTitle = { fg = colors.yellow, bold = true },
    DashboardProjectTitleIcon = { fg = colors.yellow },
    DashboardProjectIcon = { fg = colors.blue },
    DashboardMruTitle = { fg = colors.purple, bold = true },
    DashboardMruIcon = { fg = colors.purple },
    DashboardFiles = { fg = colors.fg },
    DashboardShortCut = { fg = colors.cyan },
    DashboardShortCutIcon = { fg = colors.cyan },
  }

  -- Apply highlights
  for group, hl in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, hl)
  end

  -- Terminal colors
  vim.g.terminal_color_0 = colors.terminal_black
  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_2 = colors.green
  vim.g.terminal_color_3 = colors.yellow
  vim.g.terminal_color_4 = colors.blue
  vim.g.terminal_color_5 = colors.purple
  vim.g.terminal_color_6 = colors.cyan
  vim.g.terminal_color_7 = colors.fg_dark
  vim.g.terminal_color_8 = colors.comment
  vim.g.terminal_color_9 = colors.red1
  vim.g.terminal_color_10 = colors.green1
  vim.g.terminal_color_11 = colors.yellow
  vim.g.terminal_color_12 = colors.blue1
  vim.g.terminal_color_13 = colors.magenta2
  vim.g.terminal_color_14 = colors.cyan
  vim.g.terminal_color_15 = colors.fg
end

return M
