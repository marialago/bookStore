from ninja import Schema

class ClienteSchema(Schema):
    id: int
    nome: str
    email: str

    class config:
        from_attributes = True

    
class ClienteCreateSchema(Schema):
    nome: str
    email:str
    senha:str

class AdministradorSchema(Schema):
    id: int
    nome: str
    email: str

    class config:
        from_attributes = True
    
    
class AdministradorCreateSchema(Schema):
    nome: str
    email:str
    senha:str

class AdministradorLoginSchema(Schema):
    email:str
    senha:str