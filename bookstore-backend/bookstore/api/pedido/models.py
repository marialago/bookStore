from django.db import models
from api.livro.models import Livro
from api.pedido.schemas import PedidoSchema, ItemPedidoSchema
from api.usuario.models import Usuario
# Create your models here.
class Pedido(models.Model):
  STATUS = {'PENDENTE': 'PENDENTE',
            'ENVIADO': 'ENVIADO',
            'CONCLUIDO': 'CONCLUIDO',
            'CANCELADO': 'CANCELADO'
          }

  data_pedido = models.DateTimeField(auto_now_add=True, editable=False)

  status = models.CharField(max_length=100, choices=STATUS, default='PENDENTE', null=False, blank=False)

  cliente = models.ForeignKey(Usuario, on_delete=models.CASCADE, related_name="pedidos")

  @property
  def valor_total(self):
    valor_total = 0
    if self.itens_pedido:
      for item in self.itens_pedido.all():
        valor_total += item.subtotal
      return valor_total
    return valor_total
  
  def transform_to_schema(self):
    itens_pedido = []
    for item in self.itens_pedido.all():
      temp_item = ItemPedidoSchema(
        id=item.id,
        quantidade=item.quantidade,
        subtotal=item.subtotal,
        livro=item.livro
      )
      itens_pedido.append(temp_item)

    pedidoSchema = PedidoSchema(
      id=self.id,
      data_pedido=self.data_pedido,
      status=self.status,
      valor_total=self.valor_total,
      itens_pedido=itens_pedido,
      cliente=self.cliente
    )
    return pedidoSchema
    
class ItemPedido(models.Model):
    
  quantidade = models.IntegerField(null=False, blank=False)

  livro = models.ForeignKey(Livro, on_delete=models.CASCADE, related_name="itens_pedido")

  pedido = models.ForeignKey(Pedido, on_delete=models.CASCADE, related_name="itens_pedido")

  def __str__(self):
    return f"{self.quantidade}x {self.livro.titulo}"
  
  @property
  def subtotal(self):
    return self.quantidade * self.livro.preco