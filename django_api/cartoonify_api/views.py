import numpy as np
import cv2

from rest_framework import permissions
from rest_framework.views import APIView
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework.response import Response
from django.http import HttpResponse
from PIL import Image
from .cartoonify import cartoonify

# Create your views here.
class CartoonifyView(APIView):
    parser_classes = (MultiPartParser, FormParser)
    permission_classes = [permissions.AllowAny]

    def post(self, request, *args, **kwargs):
        input_img = request.data["input_image"]

        print(input_img)

        input_img = Image.open(input_img)

        input_img = np.array(input_img)

        cartooned_img = cartoonify(input_img=input_img)

        success, cartooned_img = cv2.imencode(".jpg", cartooned_img)
        cartooned_img = cartooned_img.tostring()

        response = HttpResponse(content_type="image/jpeg")
        response.write(cartooned_img)

        return response