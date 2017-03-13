# -*- coding: utf-8 -*-
# Generated by Django 1.9.2 on 2017-03-13 04:11
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='reviews',
            fields=[
                ('review_id', models.IntegerField(primary_key=True, serialize=False)),
                ('content', models.CharField(max_length=140)),
            ],
        ),
        migrations.CreateModel(
            name='Users',
            fields=[
                ('fb_id', models.CharField(max_length=30, primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=30)),
                ('description', models.CharField(max_length=140)),
            ],
        ),
        migrations.AddField(
            model_name='reviews',
            name='user_id',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='geotag.Users'),
        ),
    ]