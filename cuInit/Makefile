cuInit:
	nvcc -ccbin g++ -g -l cuda -m64 --threads 0 --std=c++11 -gencode arch=compute_90,code=sm_90 -gencode arch=compute_90,code=compute_90 -o cuInit.o -c cuInit.cu
	nvcc -ccbin g++ -g -l cuda -m64 -gencode arch=compute_90,code=sm_90 -gencode arch=compute_90,code=compute_90 -o cuInit cuInit.o

clean:
	rm cuInit cuInit.o
