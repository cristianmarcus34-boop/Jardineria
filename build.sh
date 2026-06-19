#!/usr/bin/env bash
set -o errexit

echo "🚀 Iniciando build para Vercel..."

# Crear requirements.txt
echo "📝 Creando requirements.txt..."
cat > requirements.txt << 'EOF'
asgiref==3.8.1
certifi==2025.1.31
charset-normalizer==3.4.1
dj-database-url==2.3.0
Django==5.1.6
django-crispy-forms==2.3
django-environ==0.12.0
djangorestframework==3.15.2
gunicorn==23.0.0
psycopg2-binary==2.9.10
python-dotenv==1.0.1
requests==2.32.3
tzdata==2025.1
urllib3==2.3.0
whitenoise==6.9.0
EOF

# Instalar dependencias
echo "📦 Instalando dependencias..."
pip install --no-cache-dir -r requirements.txt --break-system-packages

# Recopilar archivos estáticos
echo "📁 Recopilando archivos estáticos..."
python manage.py collectstatic --no-input

echo "✅ Build completado exitosamente!"
