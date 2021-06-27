run: scanner.l calculadora.y
	bison -d calculadora.y
	flex scanner.l
	cc -o $@ calculadora.tab.c lex.yy.c -lfl