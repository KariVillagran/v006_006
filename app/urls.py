from .views import *
from django.urls import path,include # type: ignore

urlpatterns = [
    path('',index,name="index"),

]
    
