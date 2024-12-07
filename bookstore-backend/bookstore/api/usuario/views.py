from django.views import View
from django.shortcuts import get_object_or_404, render
from django.core.files.storage import default_storage
from api.usuario.models import Usuario, Administrador, Cliente
from api.livro.models import Livro

# Create your views here.
class ClienteView(View):
    def buscar_pedidos(self, cliente_id):
        cliente = get_object_or_404(Usuario, id=cliente_id)
        cliente_pedidos = [pedido.transform_to_schema() for pedido in cliente.pedidos.all()]
        return cliente_pedidos
    
class AdministradorView(View):

    def cadastrar_livro(self, livro_schema, imagem, administrador):
        administrador_salvo = get_object_or_404(Administrador, id=administrador['id'])
        if administrador['email'] == administrador_salvo.email and administrador['senha'] == administrador_salvo.senha:
            livro_data = livro_schema.dict()
            del livro_data['email_administrador']
            del livro_data['senha_administrador']
            if imagem:
                path = default_storage.save(f"livros/{imagem.name}", imagem)
                livro_data['imagem'] = path
            livro = Livro.objects.create(**livro_data)
            return livro

    def atualizar_livro(self, livro_id, livro_schema_update, imagem, administrador):
        administrador_salvo = get_object_or_404(Administrador, id=administrador.id)
        if administrador['email'] == administrador_salvo.email and administrador['senha'] == administrador_salvo.senha:
            livro = get_object_or_404(Livro, id=livro_id)
            livro_data = livro_schema_update.dict()
            del livro_data['email_administrador']
            del livro_data['senha_administrador']
        
            for attr, value in livro_data.dict().items():
                setattr(livro, attr, value)
            if imagem:
                path = default_storage.save(f"livros/{imagem.name}", imagem)
                livro.imagem = path
            livro.save()
            return livro

    def atualizar_imagem_livro(self, livro_id, imagem):
        livro = get_object_or_404(Livro, id=livro_id)
        if imagem:
            path = default_storage.save(f"livros/{imagem.name}", imagem)
            livro.imagem = path
        livro.save()
        return livro

    # Excluir um livro
    def excluir_livro(self, livro_id, administrador_id, administrador):
        administrador_salvo = get_object_or_404(Administrador, id=administrador_id)
        if administrador['email'] == administrador_salvo.email and administrador['senha'] == administrador_salvo.senha:
            livro = get_object_or_404(Livro, id=livro_id)
            livro.delete()
            return {"message": "livro excluído com sucesso"}