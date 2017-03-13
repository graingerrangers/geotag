from geotag.models import *
import serializers
from rest_framework import viewsets, permissions


class UsersViewSet(viewsets.ModelViewSet):
    """ViewSet for the Users class"""

    queryset = Users.objects.all()
    serializer_class = serializers.UsersSerializer
    permission_classes = [permissions.IsAuthenticated]


class ReviewsViewSet(viewsets.ModelViewSet):
    """ViewSet for the Reviews class"""

    queryset = Reviews.objects.all()
    serializer_class = serializers.ReviewsSerializer
    permission_classes = [permissions.IsAuthenticated]


class LocationsViewSet(viewsets.ModelViewSet):
    """ViewSet for the Locations class"""

    queryset = Locations.objects.all()
    serializer_class = serializers.LocationsSerializer
    permission_classes = [permissions.IsAuthenticated]


class EventsViewSet(viewsets.ModelViewSet):
    """ViewSet for the Events class"""

    queryset = Events.objects.all()
    serializer_class = serializers.EventsSerializer
    permission_classes = [permissions.IsAuthenticated]


class Is_AttendingViewSet(viewsets.ModelViewSet):
    """ViewSet for the Is_Attending class"""

    queryset = Is_Attending.objects.all()
    serializer_class = serializers.Is_AttendingSerializer
    permission_classes = [permissions.IsAuthenticated]


class ClassifiedsViewSet(viewsets.ModelViewSet):
    """ViewSet for the Classifieds class"""

    queryset = Classifieds.objects.all()
    serializer_class = serializers.ClassifiedsSerializer
    permission_classes = [permissions.IsAuthenticated]


class Is_FriendViewSet(viewsets.ModelViewSet):
    """ViewSet for the Is_Friend class"""

    queryset = Is_Friend.objects.all()
    serializer_class = serializers.Is_FriendSerializer
    permission_classes = [permissions.IsAuthenticated]
