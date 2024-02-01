//     Start Addr           End Addr       Size         Offset  Perms  objfile
// 0x7ffdce000000     0x7ffdce200000   0x200000 0x7ffdce000000  rw-s   /dev/nvidia-uvm
// 0x7ffdce200000     0x7ffdce5ab000   0x3ab000 0x7ffdce200000  rw-s   /dev/nvidia-uvm

#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <unistd.h>

int main() {
    const char *device = "/dev/nvidia-uvm";
    int fd;
    void *map1, *map2;

    // Open the device
    fd = open(device, O_RDWR);
    if (fd < 0) {
        perror("Error opening device");
        return 1;
    }

    // Allocate memory
    size_t length1 = 0x200000;  // Size for the first mapping
    size_t length2 = 0x3ab000;  // Size for the second mapping

    // Map the device into memory
    map1 = mmap(NULL, length1, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    if (map1 == MAP_FAILED) {
        perror("Error mapping the device (first segment)");
        close(fd);
        return 1;
    }

    map2 = mmap(NULL, length2, PROT_READ | PROT_WRITE, MAP_SHARED, fd, length1);
    if (map2 == MAP_FAILED) {
        perror("Error mapping the device (second segment)");
        munmap(map1, length1);
        close(fd);
        return 1;
    }

    printf("Mapped regions:\n");
    printf("1st: %p\n", map1);
    printf("2nd: %p\n", map2);

    // Clean up
    munmap(map1, length1);
    munmap(map2, length2);
    close(fd);

    return 0;
}
