import numpy as np
import cv2

from django.shortcuts import render
from rest_framework import permissions
from rest_framework.views import APIView
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework.response import Response
from django.http import HttpResponse
from PIL import Image
from .super_resolution import super_resolution

# Create your views here.
class SuperResolutionView(APIView):
    parser_classes = (MultiPartParser, FormParser)
    permission_classes = [permissions.AllowAny]

    def post(self, request, *args, **kwargs):
        input_img = request.data["input_image"]

        print(input_img)

        input_img = np.array(input_img)

        upscaled_img = super_resolution(input_img=input_img)

        success, upscaled_img = cv2.imdecode(".jpg", upscaled_img)
        upscaled_img = upscaled_img.tostring()

        response = HttpResponse(content_type="image/jpeg")
        response.write(upscaled_img)

        return response
