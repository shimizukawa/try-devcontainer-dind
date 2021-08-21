from django.contrib import admin
from api.models import Message


@admin.register(Message)
class MessageAdmin(admin.ModelAdmin):
    pass