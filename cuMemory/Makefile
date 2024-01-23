cuMemory:
	nvcc -ccbin g++ -l cuda -m64 --threads 0 --std=c++11 -gencode arch=compute_90,code=sm_90 -gencode arch=compute_90,code=compute_90 -o cuMemory.o -c cuMemory.cu
	nvcc -ccbin g++ -l cuda -m64 -gencode arch=compute_90,code=sm_90 -gencode arch=compute_90,code=compute_90 -o cuMemory cuMemory.o

clean:
	rm cuMemory cuMemory.o
