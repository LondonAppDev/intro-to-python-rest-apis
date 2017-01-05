from rest_framework import serializers, viewsets

from .models import ListItem


class ListItemSerializer(serializers.ModelSerializer):

    class Meta:
        model = ListItem
        fields = ('id', 'name', 'date_created',)
        read_only_fields = ('id', 'date_created',)


class ListItemViewSet(viewsets.ModelViewSet):
    """
    A viewset for managing list items.
    """

    serializer_class = ListItemSerializer
    queryset = ListItem.objects.all()
