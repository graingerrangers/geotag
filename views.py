from django.views.generic import DetailView, ListView, UpdateView, CreateView
from geotag.models import Users, Reviews, Locations, Events, Is_Attending, Classifieds, Is_Friend
from forms import UsersForm, ReviewsForm, LocationsForm, EventsForm, Is_AttendingForm, ClassifiedsForm, Is_FriendForm
from django.shortcuts import render
import mysql.connector
from scipy.spatial import ConvexHull
import numpy as np
from django.views.decorators.csrf import csrf_exempt
from  django.core.exceptions import ObjectDoesNotExist

from dotenv import load_dotenv
from os.path import join, dirname
import os

dotenv_path = join(dirname(__file__), '../.env')
load_dotenv(dotenv_path)

def get_heatmap_coordinates(userid):
    try:
        # db_config = read_db_config()
        conn = mysql.connector.connect(user=os.environ['RDS_USERNAME'], password=os.environ['RDS_PASSWORD'], host=os.environ['RDS_HOSTNAME'], database=os.environ['RDS_DB_NAME'], port=os.environ['RDS_PORT'])
        cur = conn.cursor()

        cur.execute("""SELECT coord_x, coord_y FROM geotag_locations""")
        return cur.fetchall()

        # cur.callproc('heatmap', [userid])

        # for res in cur.stored_results():
        #     return res.fetchall()
        #     break

    except mysql.connector.Error as e:
        print(e)

def get_coordinates(location, clusters):
    try:
        # db_config = read_db_config()
        conn = mysql.connector.connect(user=os.environ['RDS_USERNAME'], password=os.environ['RDS_PASSWORD'], host=os.environ['RDS_HOSTNAME'], database=os.environ['RDS_DB_NAME'], port=os.environ['RDS_PORT'])
        cur = conn.cursor()

        cur.callproc('kmeans', [clusters])
        cur.callproc('get_coordinates', [location])

        print type(cur.stored_results())
        for res in cur.stored_results():
            return res.fetchall()
            break

    except mysql.connector.Error as e:
        print(e)


def heat_map(request):

    coordinate_list = get_heatmap_coordinates(request.session['id'])

    # new google.maps.LatLng(37.782551, -122.445368),
    result = "["
    for c in coordinate_list:
        result += "new google.maps.LatLng(" + str(c[0]) + ", " + str(c[1]) + "),"

    result = result[:-1]
    result += "]"
    return render(request, 'heatmap.html', {'heatmap_coords': result})

def bounding_map(request):

    conn = mysql.connector.connect(user=os.environ['RDS_USERNAME'], password=os.environ['RDS_PASSWORD'], host=os.environ['RDS_HOSTNAME'], database=os.environ['RDS_DB_NAME'], port=os.environ['RDS_PORT'])
    cur = conn.cursor()

    cur.execute("""SELECT DISTINCT assigned_tag FROM geotag_locations""")
    rows = cur.fetchall()

    coord_strings = []

    for i in range(len(rows)):

        coordinate_list = get_coordinates(rows[i][0], 4)
        print(coordinate_list)
        coords_2D = np.zeros((len(coordinate_list), 2))

        coord_str = ""
        for j in range(len(coordinate_list)):
            coords_2D[j] = np.array(list(coordinate_list[j]))

        print(coords_2D)
        hull = ConvexHull(coords_2D)
            # print(hull.vertices)

        for j in range(len(hull.vertices)):
            if j != len(coordinate_list) - 1:
                coord_str += "{lat:" + str(coordinate_list[hull.vertices[j]][0]) + "," + "lng:" + str(coordinate_list[hull.vertices[j]][1]) + "},"
            else:
                coord_str += "{lat:" + str(coordinate_list[hull.vertices[j]][0]) + "," + "lng:" + str(coordinate_list[hull.vertices[j]][1]) + "}"

        coord_strings.append(coord_str)

    print(coord_strings[1])

    return render(request, 'bounding_map.html', {'vertices': hull.vertices, 'coordinates': coord_strings, 'numOfPolygons': len(rows)})

@csrf_exempt
def home(request):
    return render(request, 'home.html')

def landing_page(request):
    return render(request, 'index.html')

@csrf_exempt
def login(request):
    try:
        existing_user = Users.objects.get(fb_id=request.POST['fb_id'])
        print('here')
    except ObjectDoesNotExist:
        new_user = Users(fb_id=request.POST['fb_id'], name=request.POST['name'])
        new_user.save()

    request.session['id'] = request.POST['fb_id']

    return render(request, 'home.html')

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
