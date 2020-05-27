#ifndef SCU_GLOBAL_STATE_H
# define SCU_GLOBAL_STATE_H
# include "SystemCUnit.h"

class                   scu_global_state
{   
    public:
    sc_signal<bool>     power;
    sc_signal<bool>     ground;
    scu_global_state();
};

#endif
