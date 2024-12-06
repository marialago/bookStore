from datetime import datetime
from ninja import Schema
from api.livro.schemas import LivroSchema
from api.usuario.schemas import ClienteSchema

class ItemPedidoSchema(Schema):
    id: int
    quantidade: int
    subtotal: float
    livro: LivroSchema

    class Config:
            from_attributes = True
class PedidoSchema(Schema):
    id: int
    data_pedido: datetime
    status: str
    valor_total: float
    itens_pedido: list[ItemPedidoSchema]
    cliente: ClienteSchema
    

# Esquema para representar cada item na lista de livros
class ItemPedidoCreateSchema(Schema):
    quantidade: int
    livro_id: int

# Esquema principal para o pedido
class PedidoSchemaCreate(Schema):
    livros: list[ItemPedidoCreateSchema]
    cliente_id: int

class PedidoUpdateSchema(Schema):
    status: str