from django.shortcuts import render
from django.views import View
from api.pedido.models import Pedido, ItemPedido
from api.livro.models import Livro
from api.usuario.models import Usuario

# Create your views here.
class PedidoViews(View):
    def realizar_pedido(self, itens):
        cliente = Usuario.objects.get(id=itens.cliente_id)
        pedido = Pedido.objects.create(cliente=cliente)
        for item in itens.livros:
            livro = Livro.objects.get(id=item.livro_id)
            ItemPedido.objects.create(livro = livro, quantidade=item.quantidade, pedido=pedido)
        pedido.save()
        return pedido