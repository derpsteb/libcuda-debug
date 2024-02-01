#define _GNU_SOURCE

#include <stdlib.h>
#include <stdio.h>
#include <execinfo.h>
#include <unistd.h>
#include <dlfcn.h>
#include <sys/mman.h>

void print_trace (void)
{
  void *array[2000];
  char **strings;
  int size, i;

  size = backtrace (array, 2000);
  strings = backtrace_symbols (array, size);
  if (strings != NULL)
  {
    printf ("Obtained %d stack frames.\n", size);
    for (i = 0; i < size; i++)
      printf ("%s\n", strings[i]);
  }

  free(strings);
}


void *mmap(void *addr, size_t length, int prot, int flags, int fd, off_t offset){
    void *(*realMmap)(void *addr, size_t length, int prot, int flags, int fd, off_t offset);
    realMmap = dlsym(RTLD_NEXT, "mmap");
    if (length == 0x3ab000)
    {
        printf("mmap addr: 0x%p\n", addr);
        printf("mmap length: 0x%lx\n", length);
        printf("mmap prot: 0x%x\n", prot);
        printf("mmap flags: 0x%x\n", flags);
        printf("mmap fd: %i\n", fd);
        printf("mmap offset: %ld\n", offset);
        print_trace();
    }
    return realMmap(addr, length, prot, flags, fd, offset);
}
