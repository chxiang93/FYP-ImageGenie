import numpy as np
import cv2

from rest_framework import permissions
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework.views import APIView
from rest_framework.response import Response
from django.http import HttpResponse
from.neural_transfer import neural_transfer

# Create your views here.
class NeuralTransferView(APIView):
    def post(self, request, *args, **kwargs):
        input_img = request.data["input_image"]

        print(input_img)

        input_img = np.array(input_img)

        transfered_img = neural_transfer(input_img=input_img)

        success, transfered_img = cv2.imdecode(".jpg", transfered_img)
        transfered_img = transfered_img.tostring()

        response = HttpResponse(content_type="image/jpeg")
        response.write(transfered_img)

        return response
