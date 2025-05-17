// heat.go
package main

/*
#cgo LDFLAGS: -L. -lheatkernel
#include <stdlib.h>

void launchHeatKernel(float* u_new, float* u_old, int N, float alpha);
*/
import "C"
import "unsafe"

func main() {
    // Allocate data in Go, then pass pointers to C
    var N C.int = 512
    var alpha C.float = 0.1

    u_old := make([]float32, N*N)
    u_new := make([]float32, N*N)

    C.launchHeatKernel(
        (*C.float)(unsafe.Pointer(&u_new[0])),
        (*C.float)(unsafe.Pointer(&u_old[0])),
        N,
        alpha,
    )
}