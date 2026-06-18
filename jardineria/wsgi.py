import os
from django.core.wsgi import get_wsgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'jardineria.settings')

application = get_wsgi_application()

# 👇 AGREGÁ ESTA LÍNEA PARA VERCEL
app = application