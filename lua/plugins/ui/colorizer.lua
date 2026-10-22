-- colorizer: paints color codes (#ff8800, rgb(), hsl()...) with the color they describe.
-- Tailwind class colors come from the tailwindcss LSP (built into Neovim 0.12+).

return {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {},
}
