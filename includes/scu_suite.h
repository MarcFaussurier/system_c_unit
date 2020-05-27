#ifndef SCU_SUITE
# define SCU_SUITE
# include "SystemCUnit.h"
# include "./../includes/scu_global_state.h"

class                       scu_suite
{   public:
    size_t              tests;
    size_t              errors;
    scu_global_state    state;
    char                *name;

    scu_suite(char *name);
    void                    test();
    void                    run_test(char *name, bool(*fund)(void) );
};

#endif
