#ifndef OS6_DEBUG_HPP
#define OS6_DEBUG_HPP

namespace os6 {
	class Debug {
		public:
			void writeChar(char);
			void print(const char*);
			void print(int);
			
			void println();
			void println(const char*);
			void println(int);
	};
}

#endif
