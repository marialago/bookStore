from django.views import View
from django.shortcuts import get_object_or_404, render
from api.usuario.models import Usuario

# Create your views here.
class ClienteView(View):
    def buscar_pedidos(self, cliente_id):
        cliente = get_object_or_404(Usuario, id=cliente_id)
        cliente_pedidos = [pedido.transform_to_schema() for pedido in cliente.pedidos.all()]
        return cliente_pedidos