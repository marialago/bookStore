from django.shortcuts import get_object_or_404
from ninja import File, Router, UploadedFile
from api.pedido.models import Pedido
from api.pedido.schemas import PedidoSchema, PedidoUpdateSchema
from django.core.files.storage import default_storage

pedido_router = Router()

# Listar todos os pedidos
@pedido_router.get("/pedidos", response=list[PedidoSchema])
def listar_pedidos(request):
    return Pedido.objects.all()

# Obter um pedido específico
@pedido_router.get("/pedidos/{pedido_id}", response=PedidoSchema)
def obter_pedido(request, pedido_id: int):
    pedido = get_object_or_404(Pedido, id=pedido_id)
    return pedido

# Criar um novo pedido
@pedido_router.post("/pedidos", response=PedidoSchema)
def criar_pedido(request):
    pedido = Pedido.objects.create()
    return pedido

# Atualizar um pedido existente
@pedido_router.put("/pedidos/{pedido_id}", response=PedidoSchema)
def atualizar_pedido(request, pedido_id: int, data: PedidoUpdateSchema):
    pedido = get_object_or_404(Pedido, id=pedido_id)
    for attr, value in data.dict().items():
        setattr(pedido, attr, value)
    pedido.save()
    return pedido


# Excluir um pedido
@pedido_router.delete("/pedidos/{pedido_id}")
def excluir_pedido(request, pedido_id: int):
    pedido = get_object_or_404(Pedido, id=pedido_id)
    pedido.delete()
    return {"message": "pedido excluído com sucesso"}
