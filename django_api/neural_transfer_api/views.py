import numpy as np
import cv2

from rest_framework import permissions
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework.views import APIView
from rest_framework.response import Response
from django.http import HttpResponse
from .neural_transfer import neural_transfer

# Create your views here.
class NeuralTransferView(APIView):
    parser_classes = (MultiPartParser, FormParser)
    permission_classes = [permissions.AllowAny]

    def post(self, request, *args, **kwargs):
        input_img = request.data["input_image"]
        style_img = request.data["style_image"]

        print(type(input_img))
        print(style_img)

        input_img = input_img.open().read()
        input_img = np.asarray(bytearray(input_img))
        input_img = cv2.imdecode(input_img, cv2.IMREAD_COLOR)
        cv2.cvtColor(input_img, cv2.COLOR_BGR2RGB)

        style_img = style_img.open().read()
        style_img = np.asarray(bytearray(style_img))
        style_img = cv2.imdecode(np.frombuffer(style_img, np.uint8), cv2.IMREAD_COLOR)
        cv2.cvtColor(style_img, cv2.COLOR_BGR2RGB)

        print(input_img)
        print(type(input_img))

        transfered_img = neural_transfer(input_img=input_img, style_img=style_img)

        success, transfered_img = cv2.imencode(".jpg", transfered_img)
        transfered_img = transfered_img.tostring()

        response = HttpResponse(content_type="image/jpeg")
        response.write(transfered_img)

        return response
