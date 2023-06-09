from django.urls import path
from .views import NeuralTransferView

urlpatterns = [
    path("upload/", NeuralTransferView.as_view(), name="neural-transfer-upload"),
]
