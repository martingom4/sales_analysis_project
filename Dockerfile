# Usar una imagen base de Python
FROM python:3.12-slim


# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar el archivo de requerimientos al contenedor
COPY requirements.txt requirements.txt

# Instalar las dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el resto de la aplicación al contenedor
COPY . .

# Exponer el puerto en el que Flask correrá (puerto 5000 por defecto)
EXPOSE 5000

# Definir la variable de entorno para que Flask corra en modo de producción
ENV FLASK_APP=app.py  
ENV FLASK_ENV=production

# Comando para ejecutar la aplicación
CMD ["flask", "run", "--host=0.0.0.0"]
