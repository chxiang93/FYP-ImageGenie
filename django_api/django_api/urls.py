from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('super_resolution/', include("super_resolution_api.urls")),
    path("neural_transfer/", include("neural_transfer_api.urls")),
]
