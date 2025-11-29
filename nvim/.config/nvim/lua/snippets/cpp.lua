local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("cpp", {
    s("comp", {
        t({"#include <bits/stdc++.h>",
           "using namespace std;",
           "",
           "int main() {",
           "    ios::sync_with_stdio(0);",
           "    cin.tie(0);",
           "",
           "    "}),
        i(1, "// Seu código aqui..."),
        t({"", 
           "    return 0;",
           "}"}),
    }),
})
