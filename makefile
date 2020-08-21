KERNEL_CMAKE_DIR := ./kernel/cmake-build-debug
KERNEL_FILE := "$(KERNEL_CMAKE_DIR)/os6.bin"

ISO_FILE := os6.iso

.PHONY: "$(KERNEL_FILE)"

"$(KERNEL_FILE)":
	cmake --build "$(KERNEL_CMAKE_DIR)"
	grub-file --is-x86-multiboot2 $@

clean:
	cmake --build "$(KERNEL_CMAKE_DIR)" --target clean

distclean: clean
	rm -rf "$(KERNEL_CMAKE_DIR)"

qemu: "$(ISO_FILE)"
	qemu-system-i386 -cdrom $<
