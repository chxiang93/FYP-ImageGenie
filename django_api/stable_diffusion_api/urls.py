from django.urls import path
from .views import StableDiffusionView

urlpatterns = [
    path("upload/", StableDiffusionView.as_view(), name="stable-diffusion-upload"),
]
