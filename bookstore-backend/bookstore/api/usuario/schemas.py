from ninja import Schema

class ClienteSchema(Schema):
    id: int
    nome: str
    email: str

    class config:
        orm_mode = True

    
class ClienteCreateSchema(Schema):
    nome: str
    email:str
    senha:str

class AdministradorSchema(Schema):
    id: int
    nome: str
    email: str

    class config:
        orm_mode = True
    
    
class AdministradorCreateSchema(Schema):
    nome: str
    email:str
    senha:str

class AdministradorLoginSchema(Schema):
    email:str
    senha:str