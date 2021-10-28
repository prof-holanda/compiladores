#ifndef __IF_H__
#define __IF_H__

#define MAXTOKEN    32
#define MAXSYMS     16

enum logical_op_enum {
    EQ,  NEQ,
    GT,  GEQ,
    LT,  LEQ,
    LOR, LAND
};

struct sym {
    char id[MAXTOKEN];
    int val;
};

extern void assign(char *lsym, int *pi, char *rsym);
extern int leval(enum logical_op_enum lop, char *lsym, int *lval, 
          char *rsym, int *rval);
#endif