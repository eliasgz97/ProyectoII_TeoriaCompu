%{
#include <stdio.h>
%}
/* declare tokens */
%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL
%token POW
%%
calclist: /* nothing */
 | calclist exp EOL { printf("= %d\n", $2); }
 ;
exp: factor
 | exp ADD factor { $$ = $1 + $3; }
 | exp SUB factor { $$ = $1 - $3; }
 ;
factor: term
 | factor MUL term { $$ = $1 * $3; }
 | factor DIV term { $$ = $1 / $3; }
 ;
term: term POW factor{int x= $1;
                        for(int i=1; i<$3; i++)
                        {x*= $1;
                         $$=x;}
                         }
term: NUMBER
 | ABS term  { $$ = $2 >= 0? $2 : - $2; }
;
%%
main(int argc, char **argv)
{
    printf("Simulacion de Analizador Lexico y Sintactico \n \n");
    yyparse();
}
yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);
}