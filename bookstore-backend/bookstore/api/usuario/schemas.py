from ninja import Schema

class ClienteSchema(Schema):
    id: int
    nome: str
    email: str
    senha: str
    
    
class ClienteCreateSchema(Schema):
    nome: str
    email:str
    senha:str

class AdministradorSchema(Schema):
    id: int
    nome: str
    email: str
    senha: str
    
    
class AdministradorCreateSchema(Schema):
    nome: str
    email:str
    senha:str
