from django.views.generic import DetailView, ListView, UpdateView, CreateView
from geotag.models import Users, Reviews, Locations, Events, Is_Attending, Classifieds, Is_Friend
from forms import UsersForm, ReviewsForm, LocationsForm, EventsForm, Is_AttendingForm, ClassifiedsForm, Is_FriendForm
from django.shortcuts import render
import mysql.connector
from scipy.spatial import ConvexHull
import numpy as np

def get_coordinates():
    try:
        # db_config = read_db_config()
        conn = mysql.connector.connect(user='root', password='graingerrangers', host='127.0.0.1', database='geotag')
        cur = conn.cursor()

        results = cur.callproc('get_coordinates', ['Siebel'])

        for res in cur.stored_results():
            return res.fetchall()
            break

    except mysql.connector.Error as e:
        print(e)


def heat_map(request):
    return render(request, 'heatmap.html')

def bounding_map(request):
    coordinate_list = get_coordinates()
    coords_2D = np.zeros((len(coordinate_list), 2))

    coord_str = ""
    for i in range(len(coordinate_list)):
        coords_2D[i] = np.array(list(coordinate_list[i]))

    print(coords_2D)
    hull = ConvexHull(coords_2D)
    print(hull.vertices)

    for i in range(len(hull.vertices)):
        if i != len(coordinate_list) - 1:
            coord_str += "{lat:" + str(coordinate_list[hull.vertices[i]][0]) + "," + "lng:" + str(coordinate_list[hull.vertices[i]][1]) + "},"
        else:
            coord_str += "{lat:" + str(coordinate_list[i][0]) + "," + "lng:" + str(coordinate_list[i][1]) + "}"

    print(coord_str)


    return render(request, 'bounding_map.html', {'vertices': hull.vertices, 'coordinates': coord_str})

def landing_page(request):
    return render(request, 'index.html')

    
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
