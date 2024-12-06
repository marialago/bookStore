from ninja import NinjaAPI
from api.livro.router import livro_router
from api.usuario.router import cliente_router, administrador_router
from api.pedido.router import pedido_router

api = NinjaAPI()

# Registrar os routers das views
api.add_router("/livros/", livro_router, tags=["livros"])
api.add_router("/clientes/", cliente_router, tags=["Clientes"])
api.add_router("/administradores/", administrador_router, tags=["Administradores"])
api.add_router("/pedidos/", pedido_router, tags=["Pedidos"])