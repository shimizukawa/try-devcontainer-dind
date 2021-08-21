from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView


class TopAPIView(APIView):
    def get(self, request, format=None):
        data = {
            "message": "Welcome!",
        }

        return Response(data, status=status.HTTP_200_OK)