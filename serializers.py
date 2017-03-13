import models

from rest_framework import serializers


class UsersSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Users
        fields = (
            'pk', 
            'fb_id', 
            'name', 
            'description', 
        )


class ReviewsSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Reviews
        fields = (
            'pk', 
            'review_id', 
            'content', 
        )


class LocationsSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Locations
        fields = (
            'pk', 
            'location_id', 
            'popularity', 
            'coord_x', 
            'coord_y', 
        )


class EventsSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Events
        fields = (
            'pk', 
            'event_id', 
            'description', 
            'name', 
            'start_time', 
            'end_time', 
            'max_group_size', 
            'fee', 
            'public', 
        )


class Is_AttendingSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Is_Attending
        fields = (
            'pk', 
            'user_id', 
            'event_id', 
        )


class ClassifiedsSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Classifieds
        fields = (
            'pk', 
            'classified_id', 
            'description', 
            'name', 
            'category', 
            'price', 
        )


class Is_FriendSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Is_Friend
        fields = (
            'pk', 
            'user1_id', 
            'user2_id', 
        )


