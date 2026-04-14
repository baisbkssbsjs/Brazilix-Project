#pragma once
#include <mach-o/dyld.h>
#include <string.h>

struct MemoryFileInfo {
    uintptr_t address;
    const char* path;
};

inline uintptr_t getRealOffset(uintptr_t offset) {
    return _dyld_get_image_vmaddr_slide(0) + offset;
}

inline MemoryFileInfo getMemoryFileInfo(const char* fileName) {
    MemoryFileInfo info = {0, nullptr};
    uint32_t count = _dyld_image_count();
    for (uint32_t i = 0; i < count; i++) {
        const char* name = _dyld_get_image_name(i);
        if (name && strstr(name, fileName)) {
            info.address = _dyld_get_image_vmaddr_slide(i);
            info.path = name;
            break;
        }
    }
    return info;
}
