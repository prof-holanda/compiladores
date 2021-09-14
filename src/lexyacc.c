#include <stdarg.h>
#include <stdio.h>
#include "lexyacc.h"

void yyerror (const char *s, ...) {
    va_list ap;
    va_start(ap, s);
    fprintf (stderr, "%d error:", yylineno);
    vfprintf(stderr, s, ap);
    fprintf(stderr, "\n");
}