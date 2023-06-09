import numpy as np
import cv2

from rest_framework import permissions
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework.views import APIView
from rest_framework.response import Response
from django.http import HttpResponse
from .stable_diffusion import stable_diffusion

# Create your views here.
class StableDiffusionView(APIView):
    parser_classes = (MultiPartParser, FormParser)
    permission_classes = [permissions.AllowAny]

    def post(self, request, *args, **kwargs):
        input_text = request.data["input_text"]

        print(input_text)

        generated_img = stable_diffusion(prompt=input_text)

        success, generated_img = cv2.imencode(".jpg", generated_img)
        generated_img = generated_img.tostring()

        response = HttpResponse(content_type="image/jpeg")
        response.write(generated_img)

        return response
