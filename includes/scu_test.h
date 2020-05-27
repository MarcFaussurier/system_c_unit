#ifndef SCU_TEST
# define SCU_TEST
# include "SystemCUnit.h"
# include "scu_global_state.h"


class                       scu_test
{   public:
    scu_global_state        *state;

    scu_test(scu_global_state &);

};

#endif
