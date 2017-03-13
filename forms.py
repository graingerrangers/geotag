from django import forms
from geotag.models import Users, Reviews, Locations, Events, Is_Attending, Classifieds, Is_Friend


class UsersForm(forms.ModelForm):
    class Meta:
        model = Users
        fields = ['fb_id', 'name', 'description']


class ReviewsForm(forms.ModelForm):
    class Meta:
        model = Reviews
        fields = ['review_id', 'content', 'user_id']


class LocationsForm(forms.ModelForm):
    class Meta:
        model = Locations
        fields = ['location_id', 'popularity', 'coord_x', 'coord_y']


class EventsForm(forms.ModelForm):
    class Meta:
        model = Events
        fields = ['event_id', 'description', 'name', 'start_time', 'end_time', 'max_group_size', 'fee', 'public', 'host_id', 'location_id']


class Is_AttendingForm(forms.ModelForm):
    class Meta:
        model = Is_Attending
        fields = ['user_id', 'event_id']


class ClassifiedsForm(forms.ModelForm):
    class Meta:
        model = Classifieds
        fields = ['classified_id', 'description', 'name', 'category', 'price', 'user_id']


class Is_FriendForm(forms.ModelForm):
    class Meta:
        model = Is_Friend
        fields = ['user1_id', 'user2_id']
