from django.db import models

# Create your models here.
class Pedido(models.Model):
    STATUS = {'PENDENTE': 'PENDENTE',
              'ENVIADO': 'ENVIADO',
              'CONCLUIDO': 'CONCLUIDO',
              'CANCELADO': 'CANCELADO'
            }

    data_pedido = models.DateTimeField(auto_now_add=True, editable=False)

    status = models.CharField(max_length=100, choices=STATUS, default='PENDENTE', null=False, blank=False)

    @property
    def valor_total(self):
        return 10 #mocado por enquanto
