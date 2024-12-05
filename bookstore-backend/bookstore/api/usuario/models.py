from django.db import models

# Create your models here.
class Usuario(models.Model):
    nome = models.CharField(max_length=255, blank=False, null=False)

    email = models.CharField(max_length=300, blank=False, null=False)

    #TODO: implementar validação com JWT
    senha = models.CharField(max_length=300, blank=False, null=False)

class Cliente(Usuario):
    def visualizarPedidos():
        pass
    
    def verMeusLivros():
        pass
    
class Administrador(Usuario):
    def gerenciarUsuarios():
        pass
    
    def gerenciasEstoque():
        pass