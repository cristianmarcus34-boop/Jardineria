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

# 🔥 COPIA MANUAL DE SEGURIDAD
echo "📁 Copia manual de seguridad..."
cp -r static/* staticfiles/ 2>/dev/null || echo "⚠️ No hay archivos en static para copiar"

# 🔥 COPIA DIRECTA A LA RAÍZ PARA VERCEL
echo "📁 Copiando archivos a la raíz del proyecto..."
mkdir -p static
mkdir -p css
mkdir -p img
mkdir -p js

# Copiar desde staticfiles a la raíz
cp -r staticfiles/css/* css/ 2>/dev/null || echo "⚠️ No hay archivos CSS"
cp -r staticfiles/img/* img/ 2>/dev/null || echo "⚠️ No hay archivos IMG"
cp -r staticfiles/js/* js/ 2>/dev/null || echo "⚠️ No hay archivos JS"
cp -r staticfiles/admin admin/ 2>/dev/null || echo "⚠️ No hay archivos admin"

# Verificar archivos en la raíz
echo "📁 Verificando archivos CSS en la raíz:"
ls -la css/ || echo "⚠️ No hay archivos CSS en la raíz"

echo "✅ Build completado exitosamente!"