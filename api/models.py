from django.db import models
from django.contrib.auth.models import User

# Create your models here.


class Cliente(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    nombre = models.CharField(max_length=200, null=True, blank=True)
    email = models.CharField(max_length=200, null=True, blank=True)
    direccion = models.CharField(max_length=200, null=True, blank=True)
    create_at = models.DateField(auto_now_add=True)
    update_at = models.DateField(auto_now=True)

    def __str__(self):
        return self.nombre
    
    class Meta:
        db_table = "db_cliente"

class Carrito(models.Model):
    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE, null=True, blank=True)

    @property
    def get_cart_total(self):
        itemscarrito = self.itemcarrito_set.all()
        total = sum([item.get_total for item in itemscarrito])
        return total
    
    @property
    def get_cart_tipo(self):
        if self.itemcarrito_set.exists():
            primer_item = self.itemcarrito_set.first()  # Obtener el primer elemento del carrito
            tipo_producto = primer_item.producto.tipo # Obtener el nombre del tipo del objeto del primer elemento
            return tipo_producto
        else:
            return None 
        
    @property
    def get_cart_items(self):
        itemscarrito = self.itemcarrito_set.all()
        total = sum([item.cant for item in itemscarrito])
        return total

    class Meta:
        managed = True
        db_table = "db_carrito"

class CategoriaProducto(models.Model):
    categoria = models.CharField(max_length=50)

    def __str__(self):
        return self.categoria

    class Meta:
        db_table = 'db_categoria'
    
class Producto(models.Model):
    nombre_producto = models.CharField(max_length=50)
    precio = models.IntegerField()
    cantidad = models.IntegerField()
    categoria = models.ManyToManyField(CategoriaProducto,related_name='categorias') #relacion muchos a muchos(max_length=50)
    descripcion = models.CharField(max_length=500)
    create_at = models.DateTimeField(auto_now_add=True, null=True, blank=True)
    update_at = models.DateTimeField(auto_now=True, null=True, blank=True)

    class Meta:
        db_table = "Producto"

    def __str__(self):
        return self.nombre_producto
    


class ItemCarrito(models.Model):
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE, null=True, blank=True)
    cant = models.IntegerField(default=0,null=True,blank=True)
    carrito = models.ForeignKey(Carrito, on_delete=models.CASCADE)

    def __str__(self):
        return self.producto.nom_producto
    
    @property
    def get_total(self):
        total = self.producto.precio * self.cant
        return total

    class Meta:
        db_table = "db_item_carrito"