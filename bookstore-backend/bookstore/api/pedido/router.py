from django.shortcuts import get_object_or_404
from ninja import Router
from api.pedido.models import Pedido
from api.pedido.schemas import PedidoSchema, PedidoSchemaCreate, PedidoUpdateSchema
from api.pedido.views import PedidoViews
from django.core.files.storage import default_storage

pedido_router = Router()
pedidoViews = PedidoViews()

# Listar todos os pedidos
@pedido_router.get("/pedidos", response=list[PedidoSchema])
def listar_pedidos(request):
    pedidos = Pedido.objects.all()
    pedidos_schema = [pedido.transform_to_schema for pedido in pedidos]
    return pedidos_schema

# Obter um pedido específico
@pedido_router.get("/pedidos/{pedido_id}", response=PedidoSchema)
def obter_pedido(request, pedido_id: int):
    pedido = get_object_or_404(Pedido, id=pedido_id)
    return pedido.transform_to_schema()

# Criar um novo pedido
@pedido_router.post("/realizar_pedido", response=PedidoSchema)
def realizar_pedido(request, data: PedidoSchemaCreate):
    pedido = pedidoViews.realizar_pedido(data)
    return pedido.transform_to_schema()

# Atualizar um pedido existente
@pedido_router.put("/pedidos/{pedido_id}", response=PedidoSchema)
def atualizar_pedido(request, pedido_id: int, data: PedidoUpdateSchema):
    pedido = get_object_or_404(Pedido, id=pedido_id)
    for attr, value in data.dict().items():
        setattr(pedido, attr, value)
    pedido.save()
    return pedido.transform_to_schema()


# Excluir um pedido
@pedido_router.delete("/pedidos/{pedido_id}")
def excluir_pedido(request, pedido_id: int):
    pedido = get_object_or_404(Pedido, id=pedido_id)
    pedido.delete()
    return {"message": "pedido excluído com sucesso"}
