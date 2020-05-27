# SystemCUnit
Test your SystemC hardware using hardware

# Samples
Will come asap ... but you can still read the sources.

# Implementations notes
SystemC simulator does not allow live circuit restart, so I am instead chaining all my tests in one big circuit that contains only 2 static signals (power // ground) in a state class that is created in a test suite constructor.
