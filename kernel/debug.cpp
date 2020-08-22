#include "debug.hpp"
#include "util.hpp"

using namespace os6;

#define COM1 0x3f8

void Debug::writeChar(char ch) {
	outb(COM1, ch);
}

void Debug::println() {
	writeChar('\n');
}

void Debug::print(const char* msg) {
	const char *ch = msg;
	while (*ch) {
		writeChar(*ch);
		ch++;
	}
}

void Debug::println(const char *msg) {
	print(msg);
	println();
}
