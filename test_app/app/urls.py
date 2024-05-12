from django.urls import path
from .views import *
from django.views.decorators.cache import cache_page
from django.views.decorators.vary import vary_on_cookie


urlpatterns = [
    path('',
         cache_page(60*60*24*7)(vary_on_cookie(HomeView.as_view())),
         name='home'),
]
