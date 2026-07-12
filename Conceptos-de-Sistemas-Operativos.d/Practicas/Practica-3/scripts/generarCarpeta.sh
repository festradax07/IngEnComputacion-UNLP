# Crear el directorio si no existe $1 es el numero del ejercicio
if [ ! -d "ej$1" ]; then
    mkdir "ej$1"
    echo "Directorio 'ej$1' creado."
else
    echo "El directorio 'ej$1' ya existe."
fi

# Mover archivos que comienzan con 'ejXX' al directorio
for file in ej"$1"*; do
    if [ -f "$file" ]; then
        mv "$file" "ej$1/"
        echo "Movido: $file a ej$1/"
    fi
done

