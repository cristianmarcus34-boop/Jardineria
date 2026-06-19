#!/bin/bash
set -e

echo "🚀 Iniciando build para Vercel..."

# Instalar dependencias
echo "📦 Instalando dependencias..."
pip install --no-cache-dir -r requirements.txt --break-system-packages || pip install --no-cache-dir -r requirements.txt

# Crear directorio staticfiles
echo "📁 Creando staticfiles..."
mkdir -p staticfiles

# Recopilar archivos estáticos (intento principal)
echo "📁 Recopilando archivos estáticos..."
python manage.py collectstatic --no-input --clear || echo "⚠️ Error en collectstatic, usando copia manual..."

# 🔥 COPIA MANUAL DE SEGURIDAD (por si collectstatic falla)
echo "📁 Copia manual de seguridad..."
cp -r static/* staticfiles/ 2>/dev/null || echo "⚠️ No hay archivos en static para copiar"

# Verificar que los archivos existen
echo "📁 Verificando contenido de staticfiles:"
ls -la staticfiles/ || echo "⚠️ La carpeta staticfiles está vacía"

# Verificar específicamente el CSS
echo "📁 Verificando archivo CSS:"
ls -la staticfiles/css/ || echo "⚠️ La carpeta css no existe en staticfiles"

# Verificar específicamente el CSS (ruta directa)
echo "📁 Verificando style.css:"
ls -la staticfiles/css/style.css || echo "⚠️ El archivo style.css no existe"

echo "✅ Build completado exitosamente!"
echo "📁 Copiando staticfiles a la raíz para Vercel..."
cp -r staticfiles/* ./
echo "📁 Verificando archivos en la raíz:"
ls -la css/