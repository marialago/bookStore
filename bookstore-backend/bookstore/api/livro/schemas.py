from ninja import Schema

class LivroSchema(Schema):
    id: int
    titulo: str
    descricao: str
    imagem: str | None
    autor: str
    preco: float
    categoria: str | None
    
    class Config:
        from_attributes = True

class LivroCreateSchema(Schema):
    titulo: str
    descricao:str
    autor:str
    preco: float
    categoria: str
    email_administrador: str
    senha_administrador: str