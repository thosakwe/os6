KERNEL_CMAKE_DIR := ./kernel/cmake-build-debug

clean:
	cmake --build "$(KERNEL_CMAKE_DIR)" --target clean

distclean: clean
	rm -rf "$(KERNEL_CMAKE_DIR)"
