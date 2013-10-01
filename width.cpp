#include <verilated.h>          // Defines common routines
#include "Vwidth.h"             // From Verilating "top.v"
Vwidth *top;                    // Instantiation of module

vluint64_t main_time = 0;       // Current simulation time (64-bit unsigned)

double sc_time_stamp () {       // Called by $time in Verilog
    return main_time;           // Note does conversion to real, to match SystemC
}

int main(int argc, char **argv, char **env) {
    if (0 && argc && argv && env) {}    // Prevent unused variable warnings
    top = new Vwidth;             // Create instance of module

    Verilated::commandArgs(argc, argv);
    Verilated::debug(0);

    while (!Verilated::gotFinish()) {
      top->eval();            // Evaluate model
      main_time++;            // Time passes...
    };

    top->final();

    exit(0L);
}
