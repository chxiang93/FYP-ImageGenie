from django.urls import path
from .views import SuperResolutionView

urlpatterns = [
    path("upload/", SuperResolutionView.as_view(), name="sr-upload"),
]
