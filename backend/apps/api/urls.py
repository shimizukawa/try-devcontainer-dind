from django.urls import path

from . import views

urlpatterns = [
    path("top", views.TopAPIView.as_view()),
]