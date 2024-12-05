from datetime import datetime
from ninja import Schema

class PedidoSchema(Schema):
    id: int
    data_pedido: datetime
    status: str
    valor_total: float

    class Config:
        orm_mode = True

class PedidoUpdateSchema(Schema):
    status: str