from django.views.generic import DetailView, ListView, UpdateView, CreateView
from .models import Users, Reviews, Locations, Events, Is_Attending, Classifieds, Is_Friend
from .forms import UsersForm, ReviewsForm, LocationsForm, EventsForm, Is_AttendingForm, ClassifiedsForm, Is_FriendForm


class UsersListView(ListView):
    model = Users


class UsersCreateView(CreateView):
    model = Users
    form_class = UsersForm


class UsersDetailView(DetailView):
    model = Users


class UsersUpdateView(UpdateView):
    model = Users
    form_class = UsersForm


class ReviewsListView(ListView):
    model = Reviews


class ReviewsCreateView(CreateView):
    model = Reviews
    form_class = ReviewsForm


class ReviewsDetailView(DetailView):
    model = Reviews


class ReviewsUpdateView(UpdateView):
    model = Reviews
    form_class = ReviewsForm


class LocationsListView(ListView):
    model = Locations


class LocationsCreateView(CreateView):
    model = Locations
    form_class = LocationsForm


class LocationsDetailView(DetailView):
    model = Locations


class LocationsUpdateView(UpdateView):
    model = Locations
    form_class = LocationsForm


class EventsListView(ListView):
    model = Events


class EventsCreateView(CreateView):
    model = Events
    form_class = EventsForm


class EventsDetailView(DetailView):
    model = Events


class EventsUpdateView(UpdateView):
    model = Events
    form_class = EventsForm


class Is_AttendingListView(ListView):
    model = Is_Attending


class Is_AttendingCreateView(CreateView):
    model = Is_Attending
    form_class = Is_AttendingForm


class Is_AttendingDetailView(DetailView):
    model = Is_Attending


class Is_AttendingUpdateView(UpdateView):
    model = Is_Attending
    form_class = Is_AttendingForm


class ClassifiedsListView(ListView):
    model = Classifieds


class ClassifiedsCreateView(CreateView):
    model = Classifieds
    form_class = ClassifiedsForm


class ClassifiedsDetailView(DetailView):
    model = Classifieds


class ClassifiedsUpdateView(UpdateView):
    model = Classifieds
    form_class = ClassifiedsForm


class Is_FriendListView(ListView):
    model = Is_Friend


class Is_FriendCreateView(CreateView):
    model = Is_Friend
    form_class = Is_FriendForm


class Is_FriendDetailView(DetailView):
    model = Is_Friend


class Is_FriendUpdateView(UpdateView):
    model = Is_Friend
    form_class = Is_FriendForm
