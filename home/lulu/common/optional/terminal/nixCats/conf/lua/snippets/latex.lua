ls.add_snippets("tex", {
	s("\\beg", {
		t("\\begin{"),
		i(1),
		t("}"),
		t({ "", "\t" }),
		i(0),
		t({ "", "\\end{" }),
		rep(1),
		t("}"),
	}),
})
