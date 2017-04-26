from django.conf.urls import url, include
from rest_framework import routers
import api
import views

router = routers.DefaultRouter()
router.register(r'users', api.UsersViewSet)
router.register(r'reviews', api.ReviewsViewSet)
router.register(r'locations', api.LocationsViewSet)
router.register(r'events', api.EventsViewSet)
router.register(r'is_attending', api.Is_AttendingViewSet)
router.register(r'classifieds', api.ClassifiedsViewSet)
router.register(r'is_friend', api.Is_FriendViewSet)


urlpatterns = (
    # urls for Django Rest Framework API
    url(r'^api/v1/', include(router.urls)),
)

urlpatterns += (
    # urls for Users
    url(r'^geotag/users/$', views.UsersListView.as_view(), name='geotag_users_list'),
    url(r'^geotag/users/create/$', views.UsersCreateView.as_view(), name='geotag_users_create'),
    url(r'^geotag/users/detail/(?P<pk>\S+)/$', views.UsersDetailView.as_view(), name='geotag_users_detail'),
    url(r'^geotag/users/update/(?P<pk>\S+)/$', views.UsersUpdateView.as_view(), name='geotag_users_update'),
)

urlpatterns += (
    # urls for Reviews
    url(r'^geotag/reviews/$', views.ReviewsListView.as_view(), name='geotag_reviews_list'),
    url(r'^geotag/reviews/create/$', views.ReviewsCreateView.as_view(), name='geotag_reviews_create'),
    url(r'^geotag/reviews/detail/(?P<pk>\S+)/$', views.ReviewsDetailView.as_view(), name='geotag_reviews_detail'),
    url(r'^geotag/reviews/update/(?P<pk>\S+)/$', views.ReviewsUpdateView.as_view(), name='geotag_reviews_update'),
)

urlpatterns += (
    # urls for Locations
    url(r'^geotag/locations/$', views.LocationsListView.as_view(), name='geotag_locations_list'),
    url(r'^geotag/locations/create/$', views.LocationsCreateView.as_view(), name='geotag_locations_create'),
    url(r'^geotag/locations/detail/(?P<pk>\S+)/$', views.LocationsDetailView.as_view(), name='geotag_locations_detail'),
    url(r'^geotag/locations/update/(?P<pk>\S+)/$', views.LocationsUpdateView.as_view(), name='geotag_locations_update'),
)

urlpatterns += (
    # urls for Events
    url(r'^geotag/events/$', views.EventsListView.as_view(), name='geotag_events_list'),
    url(r'^geotag/events/create/$', views.EventsCreateView.as_view(), name='geotag_events_create'),
    url(r'^geotag/events/detail/(?P<pk>\S+)/$', views.EventsDetailView.as_view(), name='geotag_events_detail'),
    url(r'^geotag/events/update/(?P<pk>\S+)/$', views.EventsUpdateView.as_view(), name='geotag_events_update'),
)

urlpatterns += (
    # urls for Is_Attending
    url(r'^geotag/is_attending/$', views.Is_AttendingListView.as_view(), name='geotag_is_attending_list'),
    url(r'^geotag/is_attending/create/$', views.Is_AttendingCreateView.as_view(), name='geotag_is_attending_create'),
    url(r'^geotag/is_attending/detail/(?P<pk>\S+)/$', views.Is_AttendingDetailView.as_view(), name='geotag_is_attending_detail'),
    url(r'^geotag/is_attending/update/(?P<pk>\S+)/$', views.Is_AttendingUpdateView.as_view(), name='geotag_is_attending_update'),
)

urlpatterns += (
    # urls for Classifieds
    url(r'^geotag/classifieds/$', views.ClassifiedsListView.as_view(), name='geotag_classifieds_list'),
    url(r'^geotag/classifieds/create/$', views.ClassifiedsCreateView.as_view(), name='geotag_classifieds_create'),
    url(r'^geotag/classifieds/detail/(?P<pk>\S+)/$', views.ClassifiedsDetailView.as_view(), name='geotag_classifieds_detail'),
    url(r'^geotag/classifieds/update/(?P<pk>\S+)/$', views.ClassifiedsUpdateView.as_view(), name='geotag_classifieds_update'),
)

urlpatterns += (
    # urls for Is_Friend
    url(r'^geotag/is_friend/$', views.Is_FriendListView.as_view(), name='geotag_is_friend_list'),
    url(r'^geotag/is_friend/create/$', views.Is_FriendCreateView.as_view(), name='geotag_is_friend_create'),
    url(r'^geotag/is_friend/detail/(?P<pk>\S+)/$', views.Is_FriendDetailView.as_view(), name='geotag_is_friend_detail'),
    url(r'^geotag/is_friend/update/(?P<pk>\S+)/$', views.Is_FriendUpdateView.as_view(), name='geotag_is_friend_update'),
)

urlpatterns += (
    url(r'^geotag/heatmap/$', views.heat_map),
    url(r'^bounding_map/$', views.bounding_map),
    url(r'^$', views.landing_page),
    url(r'^login', views.login),
    url(r'^home', views.home),
    url(r'^attend', views.attend_event)
)
