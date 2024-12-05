from ninja import NinjaAPI
from api.livro.router import livro_router
from api.usuario.router import cliente_router, administrador_router
from api.pedido.router import pedido_router

api = NinjaAPI()

# Registrar os routers das views
api.add_router("/livro/", livro_router, tags=["livros"])
api.add_router("/cliente/", cliente_router, tags=["Clientes"])
api.add_router("/administrador/", administrador_router, tags=["Administradores"])
api.add_router("/pedido/", pedido_router, tags=["Pedidos"])