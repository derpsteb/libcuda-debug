#include <stdio.h>

#include <cuda.h>

/**
* Host main routine
*/
int main(void) {
  // Error code to check return values for CUDA calls
  CUresult cudaSuccess = CUDA_SUCCESS;
  CUdevice cuDevice;
  CUcontext cuContext;
  // CUdeviceptr devicePtr;

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

  // printf("cuCtxGetCurrent\n");

  // err = cuCtxGetCurrent(&cuContext);
  // if (err != cudaSuccess) {
  //   const char *ret = NULL;
  //   cuGetErrorString(err, &ret);
  //   fprintf(stderr, "error: %s\n", ret);
  //   exit(EXIT_FAILURE);
  // }


  printf("cuCtxCreate\n");

  err = cuCtxCreate(&cuContext, 0, cuDevice);
  if (err != cudaSuccess) {
    const char *ret = NULL;
    cuGetErrorString(err, &ret);
    fprintf(stderr, "error: %s\n", ret);
    exit(EXIT_FAILURE);
  }

  // printf("cuDevicePrimaryCtxRetain\n");
  // cuDevicePrimaryCtxRetain(&cuContext, cuDevice);
  // if (err != cudaSuccess) {
  //   const char *ret = NULL;
  //   cuGetErrorString(err, &ret);
  //   fprintf(stderr, "error: %s\n", ret);
  //   exit(EXIT_FAILURE);
  // }
  // printf("cuMemAlloc\n");

  // err = cuMemAlloc(&devicePtr, 50000 * sizeof(float));
  // if (err != cudaSuccess) {
  //   const char *ret = NULL;
  //   cuGetErrorString(err, &ret);
  //   fprintf(stderr, "error: %s\n", ret);
  //   exit(EXIT_FAILURE);
  // }


  printf("Done\n");
  return 0;
}
