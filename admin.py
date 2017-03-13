from django.contrib import admin
from django import forms
from .models import Users, Reviews, Locations, Events, Is_Attending, Classifieds, Is_Friend

class UsersAdminForm(forms.ModelForm):

    class Meta:
        model = Users
        fields = '__all__'


class UsersAdmin(admin.ModelAdmin):
    form = UsersAdminForm
    list_display = ['fb_id', 'name', 'description']
    readonly_fields = ['fb_id', 'name', 'description']

admin.site.register(Users, UsersAdmin)


class ReviewsAdminForm(forms.ModelForm):

    class Meta:
        model = Reviews
        fields = '__all__'


class ReviewsAdmin(admin.ModelAdmin):
    form = ReviewsAdminForm
    list_display = ['review_id', 'content']
    readonly_fields = ['review_id', 'content']

admin.site.register(Reviews, ReviewsAdmin)


class LocationsAdminForm(forms.ModelForm):

    class Meta:
        model = Locations
        fields = '__all__'


class LocationsAdmin(admin.ModelAdmin):
    form = LocationsAdminForm
    list_display = ['location_id', 'popularity', 'coord_x', 'coord_y']
    readonly_fields = ['location_id', 'popularity', 'coord_x', 'coord_y']

admin.site.register(Locations, LocationsAdmin)


class EventsAdminForm(forms.ModelForm):

    class Meta:
        model = Events
        fields = '__all__'


class EventsAdmin(admin.ModelAdmin):
    form = EventsAdminForm
    list_display = ['event_id', 'description', 'name', 'start_time', 'end_time', 'max_group_size', 'fee', 'public']
    readonly_fields = ['event_id', 'description', 'name', 'start_time', 'end_time', 'max_group_size', 'fee', 'public']

admin.site.register(Events, EventsAdmin)


class Is_AttendingAdminForm(forms.ModelForm):

    class Meta:
        model = Is_Attending
        fields = '__all__'


class Is_AttendingAdmin(admin.ModelAdmin):
    form = Is_AttendingAdminForm
    list_display = ['user_id', 'event_id']
    readonly_fields = ['user_id', 'event_id']

admin.site.register(Is_Attending, Is_AttendingAdmin)


class ClassifiedsAdminForm(forms.ModelForm):

    class Meta:
        model = Classifieds
        fields = '__all__'


class ClassifiedsAdmin(admin.ModelAdmin):
    form = ClassifiedsAdminForm
    list_display = ['classified_id', 'description', 'name', 'category', 'price']
    readonly_fields = ['classified_id', 'description', 'name', 'category', 'price']

admin.site.register(Classifieds, ClassifiedsAdmin)


class Is_FriendAdminForm(forms.ModelForm):

    class Meta:
        model = Is_Friend
        fields = '__all__'


class Is_FriendAdmin(admin.ModelAdmin):
    form = Is_FriendAdminForm
    list_display = ['user1_id', 'user2_id']
    readonly_fields = ['user1_id', 'user2_id']

admin.site.register(Is_Friend, Is_FriendAdmin)


