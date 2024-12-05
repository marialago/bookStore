from ninja import Schema

class LivroSchema(Schema):
    id: int
    titulo: str
    descricao: str
    imagem: str | None
    autor: str
    preco: float
    
    class Config:
        orm_mode = True

class LivroCreateSchema(Schema):
    titulo: str
    descricao:str
    autor:str
    preco: float
    email_administrador: str
    senha_administrador: str