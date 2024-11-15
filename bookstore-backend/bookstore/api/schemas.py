from ninja import Schema, UploadedFile

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
    imagem: UploadedFile | None 
    autor:str
    preco: float
