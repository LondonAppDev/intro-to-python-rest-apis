from django.shortcuts import render
from models import ListItem
from rest_framework import serializers, viewsets


class ListItemSerializer(serializers.ModelSerializer):

    class Meta:
        model = ListItem
        fields = ('name',)


class ListItemViewSet(viewsets.ModelViewSet):
    """
    A viewset for managing list items.
    """

    serializer_class = ListItemSerializer
    queryset = ListItem.objects.all()
