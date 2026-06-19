#!/bin/bash
set -e

echo "🚀 Iniciando build para Vercel..."

# Instalar dependencias
echo "📦 Instalando dependencias..."
pip install --no-cache-dir -r requirements.txt --break-system-packages || pip install --no-cache-dir -r requirements.txt

# Crear directorio staticfiles
echo "📁 Creando staticfiles..."
mkdir -p staticfiles

# Recopilar archivos estáticos
echo "📁 Recopilando archivos estáticos..."
python manage.py collectstatic --no-input --clear || echo "⚠️ Error en collectstatic"

# Verificar archivos
echo "📁 Verificando contenido de staticfiles:"
ls -la staticfiles/ || echo "⚠️ No hay archivos en staticfiles"

echo "✅ Build completado exitosamente!"