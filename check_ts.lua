local ok, configs = pcall(require, "nvim-treesitter.configs")
print("STATUS: Treesitter configs loaded: " .. tostring(ok))

if ok then
    local parsers = require("nvim-treesitter.parsers")
    print("STATUS: Svelte parser installed: " .. tostring(parsers.has_parser("svelte")))
    
    local install_info = parsers.get_parser_configs().svelte
    if install_info then
        print("STATUS: Svelte config found")
    else
        print("STATUS: Svelte config missing")
    end
else
    print("STATUS: Error loading configs")
end
vim.cmd("qa!")
