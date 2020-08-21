KERNEL_CMAKE_DIR := ./kernel/cmake-build-debug

.PHONY: kernel

kernel:
	cmake --build "$(KERNEL_CMAKE_DIR)"

clean:
	cmake --build "$(KERNEL_CMAKE_DIR)" --target clean

distclean: clean
	rm -rf "$(KERNEL_CMAKE_DIR)"
