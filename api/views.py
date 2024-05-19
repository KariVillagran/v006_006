from django.shortcuts import render,redirect,get_object_or_404
from rest_framework.generics import *
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework.authtoken.models import Token
from rest_framework.decorators import authentication_classes, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import TokenAuthentication
from rest_framework import status
from django.contrib.auth.models import User
from .models import *
from .serializers import *

# Create your views here.

#auth
@api_view(['POST'])
def login(request):

    user = get_object_or_404(User, username=request.data['username'])
    ##cambiar forma de obtener username y password
    #ingresar credenciales mediante auth
    if not user.check_password(request.data['password']):
        return Response({"error":"password incorrecta"},status=status.HTTP_400_BAD_REQUEST)
    
    token, created = Token.objects.get_or_create(user=user)

    serializer = UserSerializer(instance=user)

    return Response({"token": token.key,'user': serializer.data}, status=status.HTTP_200_OK)

@api_view(['GET','POST'])
def register(request):
    serializer = UserSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()

        user = User.objects.get(username=serializer.data['username'])
        user.set_password(serializer.data['password'])
        user.save()

        cli, create = Cliente.objects.get_or_create(user=user,nombre=user.get_username)
        cli.email = serializer.data['email']
        cli.save()

        token = Token.objects.create(user=user)

        
        return Response({'token': token.key,'user': serializer.data}, status=status.HTTP_201_CREATED)
    
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET','POST'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def perfil(request):

    print(request.user)

    return Response({"Estas logeado como {}".format(request.user.username)},status=status.HTTP_200_OK)

#api productos
        


# @authentication_classes([TokenAuthentication])
# @permission_classes([IsAuthenticated])        # Obtenemos el valor de la URL utilizando 'self.kwargs'
class ProductoList(ListCreateAPIView):
    queryset = Producto.objects.all()
    serializer_class = ProductoSerializer

    def get_object(self):
        # Obtenemos el valor de la URL utilizando 'self.kwargs'
        id = self.kwargs['id']
        # Usamos el filtro para encontrar el perfil correspondiente
        return Producto.objects.get(id=id)
# @authentication_classes([TokenAuthentication])
# @permission_classes([IsAuthenticated])         
class ProductoDetail(RetrieveUpdateDestroyAPIView):
    queryset = Producto.objects.all()
    serializer_class = ProductoSerializer

    def get_object(self):
        # Obtenemos el valor de la URL utilizando 'self.kwargs'
        id = self.kwargs['id']
        # Usamos el filtro para encontrar el perfil correspondiente
        return Producto.objects.get(id=id)
    
   
class ClienteList(ListCreateAPIView):
    queryset = Cliente.objects.all()
    serializer_class = ClienteSerializer

    def get_object(self):
        # Obtenemos el valor de la URL utilizando 'self.kwargs'
        id = self.kwargs['id']
        # Usamos el filtro para encontrar el perfil correspondiente
        return Cliente.objects.get(id=id)

    
class ClienteDetalle(RetrieveUpdateDestroyAPIView):
    queryset = Cliente.objects.all()
    serializer_class = ClienteSerializer

    def get_object(self):
        # Obtenemos el valor de la URL utilizando 'self.kwargs'
        id = self.kwargs['id']
        # Usamos el filtro para encontrar el perfil correspondiente
        return Cliente.objects.get(id=id)


class CategoriaProductoList(ListCreateAPIView):
    queryset = CategoriaProducto.objects.all()
    serializer_class = CategoriaSerializer

    def get_object(self):
        # Obtenemos el valor de la URL utilizando 'self.kwargs'
        id = self.kwargs['id']
        # Usamos el filtro para encontrar el perfil correspondiente
        return CategoriaProducto.objects.get(id=id)
    
#@authentication_classes([TokenAuthentication])
#@permission_classes([IsAuthenticated])
class CategoriaProductoDetalle(RetrieveUpdateDestroyAPIView):
    queryset = CategoriaProducto.objects.all()
    serializer_class = CategoriaSerializer

    def get_object(self):
        # Obtenemos el valor de la URL utilizando 'self.kwargs'
        id = self.kwargs['id']
        # Usamos el filtro para encontrar el perfil correspondiente
        return CategoriaProducto.objects.get(id=id)

#@authentication_classes([TokenAuthentication])
#@permission_classes([IsAuthenticated])
class CarritoList(ListCreateAPIView):
    queryset = Carrito.objects.all()
    serializer_class = CarritoSerializer

    def create(self, request, *args, **kwargs):
        # Obtenemos el cliente del request
        cliente = request.data.get('cliente')

        # Verificamos si ya existe un carrito para ese cliente
        if Carrito.objects.filter(cliente=cliente).exists():
            return Response({"detail": "Ya existe un carrito para este cliente."}, status=status.HTTP_400_BAD_REQUEST)

        # Si no existe, delegamos la creación del carrito al comportamiento por defecto
        return super().create(request, *args, **kwargs)

    def get_object(self):
        # Obtenemos el valor de la URL utilizando 'self.kwargs'
        id = self.kwargs['id']
        # Usamos el filtro para encontrar el perfil correspondiente
        return Carrito.objects.get(id=id)
    
    
#@authentication_classes([TokenAuthentication])
#@permission_classes([IsAuthenticated])     
class CarritoDetalle(RetrieveUpdateDestroyAPIView):
    queryset = Carrito.objects.all()
    serializer_class = CarritoSerializer

    def get_object(self):
        # Obtenemos el valor de la URL utilizando 'self.kwargs'
        id = self.kwargs['id']
        # Usamos el filtro para encontrar el perfil correspondiente
        return Carrito.objects.get(id=id)

#@authentication_classes([TokenAuthentication])
#@permission_classes([IsAuthenticated])   
class ItemCarritoList(ListCreateAPIView):
    queryset = ItemCarrito.objects.all()
    serializer_class = ItemCarritoSerializer

    def create(self, request, *args, **kwargs):
        # Obtenemos el cliente del request
        carrito = request.data.get('carrito')

        # Verificamos si ya existe un carrito para ese cliente
        if ItemCarrito.objects.filter(carrito=carrito).exists():
            return Response({"detail": "Ya existe un itemCarrito para est carro de compras."}, status=status.HTTP_400_BAD_REQUEST)

        # Si no existe, delegamos la creación del carrito al comportamiento por defecto
        return super().create(request, *args, **kwargs)

    def get_object(self):
        # Obtenemos el valor de la URL utilizando 'self.kwargs'
        id = self.kwargs['id']
        # Usamos el filtro para encontrar el perfil correspondiente
        return ItemCarrito.objects.get(id=id)

#@authentication_classes([TokenAuthentication])
#@permission_classes([IsAuthenticated])        
class ItemCarritoDetalle(RetrieveUpdateDestroyAPIView):
    queryset = ItemCarrito.objects.all()
    serializer_class = ItemCarritoSerializer

    def get_object(self):
        # Obtenemos el valor de la URL utilizando 'self.kwargs'
        id = self.kwargs['id']
        # Usamos el filtro para encontrar el perfil correspondiente
        return ItemCarrito.objects.get(id=id)