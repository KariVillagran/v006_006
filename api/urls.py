from api.views import *
from django.urls import re_path as url
from rest_framework.urlpatterns import format_suffix_patterns
from rest_framework.authtoken.views import obtain_auth_token


urlpatterns = [
    url(r'^api/token/', obtain_auth_token, name='api_token_auth'),
    url(r'^api/productos/$',ProductoList.as_view(),name='producto-list'),
    url(r'^api/productos/(?P<id>[\w.-]+)/$', ProductoDetail.as_view(), name='producto-detail'),
    url(r'^api/clientes/$',ClienteList.as_view(),name='cliente-list'),
    url(r'^api/clientes/(?P<id>[\w.-]+)/$', ClienteDetalle.as_view(), name='cliente-detail'),
    url(r'^api/categorias/$',CategoriaProductoList.as_view(),name='categoria-list'),
    url(r'^api/categorias/(?P<id>[\w.-]+)/$',CategoriaProductoDetalle.as_view(), name='categoria-detail'),
    url(r'^api/carritos/$',CarritoList.as_view(),name='carrito-list'),
    url(r'^api/carritos/(?P<id>[\w.-]+)/$',CarritoDetalle.as_view(),name='carrito-detalle'),
    url(r'^api/itemCarrito/$',ItemCarritoList.as_view(),name='itemcarrito-list'),
    url(r'^api/itemCarrito/(?P<id>[\w.-]+)/$',ItemCarritoDetalle.as_view(),name='itemcarrito-detalle'),
    url(r'^login/$', login, name='login'),
    url(r'^register/$', register, name='register'),
    url(r'^perfil/$', perfil, name='perfil'),
    
]
    


urlpatterns = format_suffix_patterns(urlpatterns)