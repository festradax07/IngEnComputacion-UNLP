int cant = 0;
int pri_ocupada = 0;
int pri_vacia = 0;
int buffer[N];

Process Productor::
{
  while (true) {
    // produce elemento
    < cant < N ;
        buffer[pri_vacia] = elemento;
        pri_vacia = (pri_vacia + 1) mod N;
        cant = cant + 1;
    >
  }
}

Process Consumidor::
{
  while (true) {
    < cant > 0 ; elemento = buffer[pri_ocupada];
        pri_ocupada = (pri_ocupada + 1) mod N;
        cant = cant - 1;
    >
    // consume elemento
  }
}

