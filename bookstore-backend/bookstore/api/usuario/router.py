from django.shortcuts import get_object_or_404
from ninja import File, Router, UploadedFile
from api.usuario.models import Cliente, Administrador
from api.usuario.schemas import AdministradorCreateSchema, AdministradorSchema, ClienteSchema, ClienteCreateSchema, AdministradorLoginSchema
from api.pedido.schemas import PedidoSchema
from api.livro.schemas import LivroSchema, LivroCreateSchema
from api.usuario.views import ClienteView, AdministradorView

cliente_router = Router()
clienteView = ClienteView()

# Listar todos os Clientes
@cliente_router.get("/", response=list[ClienteSchema])
def listar_clientes(request):
    return Cliente.objects.all()

# Obter um Cliente específico
@cliente_router.get("/{cliente_id}", response=ClienteSchema)
def obter_cliente(request, cliente_id: int):
    cliente = get_object_or_404(Cliente, id=cliente_id)
    return cliente

# Criar um novo Cliente
@cliente_router.post("/", response=ClienteSchema)
def criar_cliente(request, data: ClienteCreateSchema):
    cliente = Cliente.objects.create(**data.dict())
    return cliente

# Atualizar um Cliente existente
@cliente_router.put("/{cliente_id}", response=ClienteSchema)
def atualizar_cliente(request, cliente_id: int, data: ClienteCreateSchema):
    cliente = get_object_or_404(Cliente, id=cliente_id)
    for attr, value in data.dict().items():
        setattr(cliente, attr, value)
    cliente.save()
    return cliente


# Excluir um Cliente
@cliente_router.delete("/{cliente_id}")
def excluir_cliente(request, cliente_id: int):
    cliente = get_object_or_404(Cliente, id=cliente_id)
    cliente.delete()
    return {"message": "Cliente excluído com sucesso"}

@cliente_router.get("/buscar_pedidos/{cliente_id}", response=list[PedidoSchema])
def buscar_pedidos_do_cliente(request, cliente_id: int):
    cliente_pedidos = clienteView.buscar_pedidos(cliente_id)
    return cliente_pedidos    

administrador_router = Router()
administradorView = AdministradorView()

# Listar todos os Administradores
@administrador_router.get("/", response=list[AdministradorSchema])
def listar_administradores(request):
    return Administrador.objects.all()

# Obter um Administradore específico
@administrador_router.get("/{administrador_id}", response=AdministradorSchema)
def obter_administrador(request, administrador_id: int):
    administrador = get_object_or_404(Administrador, id=administrador_id)
    return Administrador

# Criar um novo Administradore
@administrador_router.post("/", response=AdministradorSchema)
def criar_administrador(request, data: AdministradorCreateSchema):
    administrador = Administrador.objects.create(**data.dict())
    return administrador

# Atualizar um Administradore existente
@administrador_router.put("/{administrador_id}", response=AdministradorSchema)
def atualizar_administrador(request, administrador_id: int, data: AdministradorCreateSchema):
    administrador = get_object_or_404(Administrador, id=administrador_id)
    for attr, value in data.dict().items():
        setattr(administrador, attr, value)
    administrador.save()
    return administrador


# Excluir um Administradore
@administrador_router.delete("/{administrador_id}")
def excluir_administrador(request, administrador_id: int):
    administrador = get_object_or_404(Administrador, id=administrador_id)
    administrador.delete()
    return {"message": "Administrador excluído com sucesso"}

@administrador_router.post("/cadastrar_livro/{administrador_id}", response=LivroSchema)
def cadastrar_livro(request, data: LivroCreateSchema, administrador_id: int, imagem: UploadedFile = File(...)):
    administrador = {"id": administrador_id, "email": data.email_administrador, "senha": data.senha_administrador}
    livro = administradorView.cadastrar_livro(data, imagem, administrador)
    return livro

# Atualizar um livro existente
@administrador_router.put("/atualizar_livro/{livro_id}/{administrador_id}", response=LivroSchema)
def atualizar_livro(request, livro_id: int, data: LivroCreateSchema, administrador_id:int ,imagem: UploadedFile = File(None)):
    administrador = {"id": administrador_id, "email": data.email_administrador, "senha": data.senha_administrador}
    livro = administradorView.atualizar_livro(livro_id, data, imagem, administrador)
    return livro

# Excluir um livro
@administrador_router.delete("/deletar_livro/{livro_id}/{administrador_id}/")
def excluir_livro(request, livro_id: int, administrador_id, data: AdministradorLoginSchema):
    return administradorView.excluir_livro(livro_id, administrador_id, data.dict())