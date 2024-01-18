#include <stdio.h>

// For the CUDA runtime routines (prefixed with "cuda_")
#include <cuda_runtime.h>

#include <helper_cuda.h>

/**
* Host main routine
*/
int main(void) {
  // Error code to check return values for CUDA calls
  cudaError_t err = cudaSuccess;

  printf("calling cudaMalloc\n");
  // Allocate the device input vector A
  float *d_A = NULL;
  err = cudaMalloc((void **)&d_A, 50000 * sizeof(float));
  printf("cudaMalloc returned\n");

  if (err != cudaSuccess) {
    fprintf(stderr, "Failed to allocate device vector A (error code %s)!\n",
            cudaGetErrorString(err));
    exit(EXIT_FAILURE);
  }

  printf("calling cudaFree\n");
  // Free device global memory
  err = cudaFree(d_A);
  printf("cudaFree returned\n");

  if (err != cudaSuccess) {
    fprintf(stderr, "Failed to free device vector A (error code %s)!\n",
            cudaGetErrorString(err));
    exit(EXIT_FAILURE);
  }


  printf("Done\n");
  return 0;
}
