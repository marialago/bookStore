from django.shortcuts import get_object_or_404
from ninja import Router
from api.livro.models import Livro
from api.livro.schemas import LivroSchema, LivroCreateSchema

livro_router = Router()

# Listar todos os livros
@livro_router.get("/", response=list[LivroSchema])
def listar_livros(request):
    return Livro.objects.all()

# Obter um livro específico
@livro_router.get("/{livro_id}", response=LivroSchema)
def obter_livro(request, livro_id: int):
    livro = get_object_or_404(Livro, id=livro_id)
    return livro
