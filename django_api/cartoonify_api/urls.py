from django.urls import path
from .views import CartoonifyView

urlpatterns = [
    path("upload/", CartoonifyView.as_view(), name="cartoonify-upload"),
]
