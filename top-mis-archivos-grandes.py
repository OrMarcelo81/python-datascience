"""
    Identificación de los 10 archivos más grandes en un directorio.
"""
# importamos las librerías necesarias
import os
import heapq

# definimos la función para obtener los archivos más grandes
def get_largest_files(directory, top_n=10):
    # Lista para almacenar los archivos más grandes
    largest_files = []

    # Recorre el directorio y sus subdirectorios
    for root, _, files in os.walk(directory):
        for filename in files:
            filepath = os.path.join(root, filename)
            filesize = os.path.getsize(filepath)
            # Agrega el archivo actual a la lista de los archivos más grandes
            largest_files.append((filesize, filepath))

    # Encuentra los N archivos más grandes utilizando un heap
    largest_files = heapq.nlargest(top_n, largest_files)

    return largest_files

if __name__ == "__main__":
    directory_to_search = 'D:\Proyectos\Python\python-datascience'  # Reemplaza esto con la ruta de tu directorio
    top_10_largest_files = get_largest_files(directory_to_search, top_n=10)

    # Imprime los 10 archivos más grandes con su ubicación exacta
    for size, filepath in top_10_largest_files:
        print(f"Tamaño: {size} bytes - Archivo: {filepath}")