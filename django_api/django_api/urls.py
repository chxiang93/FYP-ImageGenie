from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('super_resolution/', include("super_resolution_api.urls")),
    path("cartoonify/", include("cartoonify_api.urls")),
    path("neural_tansfer/", include("neural_transfer_api.urls")),
    path("stable_diffusion/", include("stable_diffusion_api.urls")),
]
