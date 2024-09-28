# Clasificación de Materiales de Reciclaje

## Descripción General

Esta aplicación de Flutter utiliza un modelo de Machine Learning entrenado para clasificar imágenes de materiales reciclables en las categorías: **Plástico**, **Vidrio**, **Aluminio**, **Cartón**, **Isopor**, **Papel**, **Residuos** y **Metal**. El modelo fue entrenado usando [Teachable Machine](https://teachablemachine.withgoogle.com/), una herramienta de Google para la creación rápida de modelos de aprendizaje automático, y los datos fueron obtenidos de [Kaggle](https://www.kaggle.com/).

## Características

- **Clasificación de Imágenes**: Permite al usuario cargar una imagen desde la galería o capturar una foto con la cámara, para que luego el modelo la clasifique en una de las ocho categorías.
- **Precisión del Modelo**: Se muestra el nivel de confianza con el que el modelo realizó la clasificación, expresado en porcentaje.
- **Fácil de Usar**: Interfaz simple con botones para cargar imágenes o tomar fotos desde la cámara.

## Instalación

1. Clona el repositorio o descarga los archivos.
2. Asegúrate de que tienes Flutter instalado en tu sistema.
3. Instala las dependencias ejecutando:

   ```bash
   flutter pub get
   ```

4. Asegúrate de que tienes el modelo `.tflite` y las etiquetas `labels.txt` en la carpeta `assets/converted_tflite/`.
5. Ejecuta la aplicación:

   ```bash
   flutter run
   ```

## ¿Cómo funcionan los modelos de TFLite y su integración en Flutter?

### ¿Qué es TensorFlow Lite (TFLite)?

**TensorFlow Lite** es una versión optimizada de TensorFlow diseñada para dispositivos móviles y de baja potencia. Permite que los modelos de Machine Learning (ML) se ejecuten eficientemente en dispositivos móviles (Android e iOS), dispositivos edge y otros embebidos. TFLite convierte los modelos de TensorFlow en un formato compacto (.tflite), que se puede usar para realizar inferencias (predicciones) directamente en dispositivos móviles sin necesidad de una conexión a internet.

### Proceso de Entrenamiento e Implementación

1. **Entrenamiento del Modelo**: El proceso comienza con la recopilación de datos para entrenar el modelo. En este caso, usamos [Teachable Machine](https://teachablemachine.withgoogle.com/) para entrenar un modelo de clasificación de imágenes. Teachable Machine simplifica la creación de modelos de aprendizaje automático sin necesidad de escribir código, utilizando imágenes etiquetadas para entrenar el modelo en diferentes categorías (por ejemplo, Plástico, Vidrio, etc.).

2. **Exportación a TFLite**: Una vez que el modelo se entrena y ajusta, se exporta a un archivo `.tflite`, que es un formato comprimido y optimizado para dispositivos móviles. También se genera un archivo `labels.txt` que contiene las etiquetas (categorías) que el modelo puede predecir.

3. **Integración en Flutter**:
   - **Flutter** es un framework de Google que permite desarrollar aplicaciones móviles con un solo código base para Android e iOS. Tiene una gran comunidad y muchas librerías que facilitan la implementación de Machine Learning.
   - La integración de modelos TFLite en Flutter se logra mediante el uso del plugin [`tflite`](https://pub.dev/packages/tflite), que permite ejecutar inferencias con modelos de TensorFlow Lite en dispositivos móviles.

### Proceso de Integración Técnica

1. **Cargar el Modelo en Flutter**:

   - El modelo `.tflite` y las etiquetas `labels.txt` se colocan en la carpeta `assets` de la aplicación Flutter.
   - Mediante la configuración del archivo `pubspec.yaml`, estos archivos se declaran como recursos que serán accesibles dentro de la aplicación.

2. **Configuración del Plugin `tflite`**:

   - Se añade la dependencia `tflite` en el archivo `pubspec.yaml` para poder utilizar las funciones que permiten cargar el modelo y ejecutar predicciones.
   - Se utiliza la función `Tflite.loadModel()` para cargar el modelo entrenado desde los assets. A partir de ese momento, el modelo está disponible para realizar inferencias.

3. **Predicción**:

   - Cuando el usuario selecciona o captura una imagen, esta imagen se preprocesa para ser compatible con el modelo (escalado a la resolución que el modelo espera, normalmente 224x224 píxeles).
   - Luego, se llama a la función `Tflite.runModelOnImage()` para ejecutar el modelo sobre la imagen seleccionada.
   - El resultado es un conjunto de probabilidades para cada categoría (Plástico, Vidrio, etc.), y la aplicación muestra la categoría con la mayor probabilidad junto con el nivel de confianza (en porcentaje).

4. **Interfaz de Usuario**:
   - Una vez que el modelo predice la categoría de la imagen, los resultados se presentan en la interfaz de usuario de Flutter.
   - La UI de Flutter es simple y eficiente, utilizando widgets que permiten mostrar las imágenes cargadas, el nombre del material reciclado y el porcentaje de confianza en la predicción.

### Ventajas de Usar TensorFlow Lite con Flutter

- **Desempeño Optimizado**: Los modelos `.tflite` son extremadamente ligeros y eficientes, lo que permite que las inferencias se realicen rápidamente en dispositivos móviles.
- **Ejecución Offline**: No se necesita conexión a internet para realizar las predicciones, ya que el modelo está integrado en la aplicación.
- **Portabilidad**: Flutter permite que una misma base de código se utilice tanto para Android como para iOS, mientras que TensorFlow Lite permite que el mismo modelo de Machine Learning se ejecute en ambas plataformas sin modificaciones adicionales.

## Contribuciones

Si deseas contribuir al proyecto, por favor abre un _pull request_ con una breve descripción de los cambios.
