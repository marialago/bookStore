from django.shortcuts import get_object_or_404
from ninja import Router
from api.usuario.models import Cliente, Administrador
from api.usuario.schemas import AdministradorCreateSchema, AdministradorSchema, ClienteSchema, ClienteCreateSchema
from api.pedido.schemas import PedidoSchema
from api.usuario.views import ClienteView

cliente_router = Router()
clienteView = ClienteView()

# Listar todos os Clientes
@cliente_router.get("/clientes", response=list[ClienteSchema])
def listar_clientes(request):
    return Cliente.objects.all()

# Obter um Cliente específico
@cliente_router.get("/clientes/{cliente_id}", response=ClienteSchema)
def obter_cliente(request, cliente_id: int):
    cliente = get_object_or_404(Cliente, id=cliente_id)
    return cliente

# Criar um novo Cliente
@cliente_router.post("/clientes", response=ClienteSchema)
def criar_cliente(request, data: ClienteCreateSchema):
    cliente = Cliente.objects.create(**data.dict())
    return cliente

# Atualizar um Cliente existente
@cliente_router.put("/clientes/{cliente_id}", response=ClienteSchema)
def atualizar_cliente(request, cliente_id: int, data: ClienteCreateSchema):
    cliente = get_object_or_404(Cliente, id=cliente_id)
    for attr, value in data.dict().items():
        setattr(cliente, attr, value)
    cliente.save()
    return cliente


# Excluir um Cliente
@cliente_router.delete("/clientes/{cliente_id}")
def excluir_cliente(request, cliente_id: int):
    cliente = get_object_or_404(Cliente, id=cliente_id)
    cliente.delete()
    return {"message": "Cliente excluído com sucesso"}

@cliente_router.get("/clientes/buscar_pedidos/{cliente_id}", response=list[PedidoSchema])
def buscar_pedidos_do_cliente(request, cliente_id: int):
    cliente_pedidos = clienteView.buscar_pedidos(cliente_id)
    return cliente_pedidos    

administrador_router = Router()

# Listar todos os Administradores
@administrador_router.get("/administradores", response=list[AdministradorSchema])
def listar_administradores(request):
    return Administrador.objects.all()

# Obter um Administradore específico
@administrador_router.get("/administradores/{administrador_id}", response=AdministradorSchema)
def obter_administrador(request, administrador_id: int):
    administrador = get_object_or_404(Administrador, id=administrador_id)
    return Administrador

# Criar um novo Administradore
@administrador_router.post("/administradores", response=AdministradorSchema)
def criar_administrador(request, data: AdministradorCreateSchema):
    administrador = Administrador.objects.create(**data.dict())
    return administrador

# Atualizar um Administradore existente
@administrador_router.put("/administradores/{administrador_id}", response=AdministradorSchema)
def atualizar_administrador(request, administrador_id: int, data: AdministradorCreateSchema):
    administrador = get_object_or_404(Administrador, id=administrador_id)
    for attr, value in data.dict().items():
        setattr(administrador, attr, value)
    administrador.save()
    return administrador


# Excluir um Administradore
@administrador_router.delete("/administradores/{administrador_id}")
def excluir_administrador(request, administrador_id: int):
    administrador = get_object_or_404(Administrador, id=administrador_id)
    administrador.delete()
    return {"message": "Administrador excluído com sucesso"}