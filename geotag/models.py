from __future__ import unicode_literals

from django.db import models

# Create your models here.
class Users(models.Model):
	fb_id = models.CharField(max_length=30, primary_key=True)
	name = models.CharField(max_length=30)
	description = models.CharField(max_length=140)

class Reviews(models.Model):
	review_id = models.IntegerField(primary_key=True)
	content = models.CharField(max_length=140)
	user_id = models.ForeignKey(Users, on_delete=models.CASCADE)

class Locations(models.Model):
	location_id = models.IntegerField(primary_key=True)
	popularity = models.FloatField()
	coord_x = models.FloatField()
	coord_y = models.FloatField()

class Events(models.Model):
	event_id = models.IntegerField(primary_key=True)
	description = models.CharField(max_length=140)
	name = models.CharField(max_length=30)
	start_time = models.DateField()
	end_time = models.DateField()
	max_group_size = models.IntegerField()
	fee = models.FloatField()
	public = models.BooleanField()
	host_id = models.ForeignKey(Users, on_delete=models.CASCADE)
	location_id = models.ForeignKey(Locations, on_delete=models.CASCADE)

class Is_Attending(models.Model):
	user_id = models.CharField(max_length=30, primary_key=True)
	event_id = models.IntegerField()

class Classifieds(models.Model):
	classified_id = models.IntegerField(primary_key=True)
	description = models.CharField(max_length=140)
	name = models.CharField(max_length=30)
	category = models.CharField(max_length=30)
	price = models.FloatField()
	user_id = models.ForeignKey(Users, on_delete=models.CASCADE)

class Is_Friend(models.Model):
	user1_id = models.CharField(max_length=30, primary_key=True)
	user2_id = models.CharField(max_length=30)
