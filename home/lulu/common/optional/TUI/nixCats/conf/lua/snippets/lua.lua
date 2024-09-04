ls.add_snippets("lua", {
	s("hello", {
		t('print("hello '),
		i(1),
		t(' world")'),
	}),
})
