from django.shortcuts import get_object_or_404
from ninja import File, Router, UploadedFile
from api.livro.models import Livro
from api.livro.schemas import LivroSchema, LivroCreateSchema
from django.core.files.storage import default_storage

livro_router = Router()

# Listar todos os livros
@livro_router.get("/livros", response=list[LivroSchema])
def listar_livros(request):
    return Livro.objects.all()

# Obter um livro específico
@livro_router.get("/livros/{livro_id}", response=LivroSchema)
def obter_livro(request, livro_id: int):
    livro = get_object_or_404(Livro, id=livro_id)
    return livro

# Criar um novo livro
@livro_router.post("/livros", response=LivroSchema)
def criar_livro(request, data: LivroCreateSchema, imagem: UploadedFile = File(...)):
    livro_data = data.dict()
    if imagem:
        path = default_storage.save(f"livros/{imagem.name}", imagem)
        livro_data['imagem'] = path
    livro = Livro.objects.create(**livro_data)
    return livro

# Atualizar um livro existente
@livro_router.put("/livros/{livro_id}", response=LivroSchema)
def atualizar_livro(request, livro_id: int, data: LivroCreateSchema, imagem: UploadedFile = File(None)):
    livro = get_object_or_404(Livro, id=livro_id)
    for attr, value in data.dict().items():
        setattr(livro, attr, value)
    if imagem:
        path = default_storage.save(f"livros/{imagem.name}", imagem)
        livro.imagem = path
    livro.save()
    return livro


# Excluir um livro
@livro_router.delete("/livros/{livro_id}")
def excluir_livro(request, livro_id: int):
    livro = get_object_or_404(Livro, id=livro_id)
    livro.delete()
    return {"message": "livro excluído com sucesso"}
