LOCAL_PATH := $(call my-dir)

INITRD_FILES := $(LOCAL_PATH)/initrd_files

INITRD_TARGET := $(LOCAL_PATH)/../initrd.gz
$(INITRD_TARGET) : $(INITRD_FILES)/init.htcleo.rc
	@echo "Creating initrd in $@"
	@rm -rf $@
	$(hide) (cd $(INITRD_FILES) && find . | cpio --quiet -H newc -o | gzip -9 -c - > $@)

ALL_PREBUILT += $(INITRD_TARGET)


include $(BUILD_PREBUILT)
