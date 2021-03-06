KERNEL_CMAKE_DIR := ./kernel/cmake-build-debug
KERNEL_FILE := "$(KERNEL_CMAKE_DIR)/os6.bin"

ISO_FILE := os6.iso

DIST_STANDARD := ./dist/standard

.PHONY: "$(KERNEL_FILE)"

all: "$(ISO_FILE)"

"$(KERNEL_FILE)":
	cmake --build "$(KERNEL_CMAKE_DIR)"
	grub-file --is-x86-multiboot2 $@

"$(ISO_FILE)": "$(KERNEL_FILE)"
	cp $< "$(DIST_STANDARD)/boot/os6.bin"
	rm -f $@
	grub-mkrescue -o $@ "$(DIST_STANDARD)"

clean:
	cmake --build "$(KERNEL_CMAKE_DIR)" --target clean
	rm -f "$(ISO_FILE)"

distclean: clean
	rm -rf "$(KERNEL_CMAKE_DIR)"

bochs: "$(ISO_FILE)"
	bochs -q -rc debug.rc

qemu: "$(ISO_FILE)"
	qemu-system-i386 -cdrom $< -serial file:/dev/stdout
