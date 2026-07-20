#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <omp.h>
#include <time.h>

int comparar(const void *a, const void *b) {
    return (*(int*)b - *(int*)a); // Orden descendente
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Uso: %s <valor de N>\n", argv[0]);
        return 1;
    }

    int N = atoi(argv[1]); // mi arg es el n
    int *array = malloc(N * sizeof(int)); // reservo en la heap
    srand(time(NULL)); // aleatorio POSTA jsjsj

    // cargo valores randoms
    for (int i = 0; i < N; i++) {
        array[i] = (rand() % 30) + 1;
    }

    qsort(array,N,sizeof(int),comparar);

    printf("procesando con 4 hilos para N=%d...\n", N);
    double start_time = omp_get_wtime();

    #pragma omp parallel for num_threads(4) schedule(dynamic)
    for (int i = 0; i < N; i++) {
        int t_id = omp_get_thread_num();
        printf("el Thread %d está procesando el elemento %d (valor: %d)\n", t_id, i, array[i]);
        
        // Simulación workload
        sleep(array[i]); 
    }

    double end_time = omp_get_wtime();
    printf("Tiempo total de ejecución: %.2f segundos\n", end_time - start_time);

    free(array); // libero memoria
    return 0;
}
