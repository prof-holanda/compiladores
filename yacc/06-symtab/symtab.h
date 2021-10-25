#ifndef __SYMTAB_H__
#define __SYMTAB_H__

#define MAXTOKEN 32

typedef enum bool_enum {true, false} Bool;

struct symtab {
        char id[MAXTOKEN];
        double val;
        struct symtab *next;
};

extern struct symtab *install(char *id, double val);

#endif