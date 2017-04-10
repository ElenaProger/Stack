#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

int main(int argc, char **argv)
{

MPI_Init(&argc, char &argv);
int rank;
MPI_Comm_rank(MPI_COMM_WORLD,&rank);
printf("I'm %d\n", &rank);
MPI_Finalize();
return 0;
}
