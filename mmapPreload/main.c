#include <sys/mman.h>

int main(){
    mmap(0, 0x3ab000, 0x3, 0x22, 0, 0);

    return 0;
}
