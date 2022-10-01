local status, indentLine = pcall(require, "indent-blankline")
if (not status) then return end

indentLine.setup {
    show_current_context = true,
    show_current_context_start = true,
}

