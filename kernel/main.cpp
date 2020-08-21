#include "system.hpp"

using namespace os6;

extern "C" void kernel_main(void) {
  System system;
  system.debug.println("Hello!");
}
