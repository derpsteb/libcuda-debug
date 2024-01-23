#include <stdio.h>

#include <cuda.h>

/**
* Host main routine
*/
int main(void) {
  // Error code to check return values for CUDA calls
  CUresult cudaSuccess = CUDA_SUCCESS;
  int cuDevice = 0;
  CUcontext *cuCtx = NULL;

  printf("cuInit\n");

  CUresult err = cuInit(0);
  if (err != cudaSuccess) {
    const char *ret = NULL;
    cuGetErrorString(err, &ret);
    fprintf(stderr, "error: %s\n", ret);
    exit(EXIT_FAILURE);
  }

  printf("cuDeviceGet\n");

  err = cuDeviceGet(&cuDevice, 0);
  if (err != cudaSuccess) {
    const char *ret = NULL;
    cuGetErrorString(err, &ret);
    fprintf(stderr, "error: %s\n", ret);
    exit(EXIT_FAILURE);
  }

  printf("cuDevicePrimaryCtxRetain\n");

  err = cuDevicePrimaryCtxRetain(cuCtx, cuDevice);
  if (err != cudaSuccess) {
    const char *ret = NULL;
    cuGetErrorString(err, &ret);
    fprintf(stderr, "error: %s\n", ret);
    exit(EXIT_FAILURE);
  }


  printf("Done\n");
  return 0;
}
