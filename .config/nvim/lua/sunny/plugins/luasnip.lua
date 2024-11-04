return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",
  event = "InsertEnter",
  config = function()
    local ls = require("luasnip")
    ls.config.set_config {
      history = true,
      updateevents = "TextChanged,TextChangedI",
      override_builtin = true,
    }
    --
    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-E>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true })

    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node

    ls.add_snippets("cpp", {
      s("cptemp", {
        t({ '#include <bits/stdc++.h>', "\t" }),
        t({ 'using namespace std;', "\t" }),
        t({ '#define forn(i, a, n) for (long long i = a; i < n; i++)', "\t" }),
        t({ '#define int long long', "\t" }),
        t({ '', "\t" }),
        t({ 'const int MAXN = 200100;', "\t" }),
        t({ 'const int MOD = 1000000007;', "\t" }),
        t({ '', "\t" }),
        t({ 'void solve() {', "\t" }),
        t({ '// Write you code here', "\t" }),
        i(0),
        t({ "", "\t" }),
        t({ '}', "\t" }),
        t({ '', "\t" }),
        t({ 'int32_t main() {', "\t" }),
        t({ 'ios::sync_with_stdio(false);', "\t" }),
        t({ 'cin.tie(0);', "\t" }),
        t({ 'cout.tie(0);', "\t" }),
        t({ 'int T = 1;', "\t" }),
        t({ 'cin >> T; // Comment this out in case number of test cases are not to be taken as input', "\t" }),
        t({ 'for (int I = 1; I <= T; I++) {', "\t" }),
        t({ 'solve();', "\t" }),
        t({ '}', "\t" }),
        t({ 'return 0;', "\t" }),
        t('}'),
      }
      )
    })
  end
}
