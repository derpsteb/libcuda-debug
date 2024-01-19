cudaMalloc:
	nvcc -ccbin g++ -I. -m64 --threads 0 --std=c++11 -gencode arch=compute_90,code=sm_90 -gencode arch=compute_90,code=compute_90 -o cudaMalloc.o -c cudaMalloc.cu
	nvcc -ccbin g++ -m64 -gencode arch=compute_90,code=sm_90 -gencode arch=compute_90,code=compute_90 -o cudaMalloc cudaMalloc.o

clean:
	rm cudaMalloc cudaMalloc.o
