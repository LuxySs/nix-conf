ls = require 'luasnip'
s = ls.snippet
t = ls.text_node
i = ls.insert_node
extras = require 'luasnip.extras'
rep = extras.rep
fmt = require('luasnip.extras.fmt').fmt
c = ls.choice_node
f = ls.function_node
d = ls.dynamic_node
sn = ls.snippet_node

require 'snippets.latex'
require 'snippets.lua'
require 'snippets.cpp'
