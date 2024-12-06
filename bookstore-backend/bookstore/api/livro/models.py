from django.db import models

# Create your models here.
class Livro(models.Model):
    
    titulo = models.CharField(max_length=100, null=False, blank=False)

    imagem = models.ImageField(upload_to='livros', blank=True, null=True)

    descricao = models.TextField(blank=True, null=True)

    autor = models.CharField(max_length=100, null=True, blank=True)

    preco = models.DecimalField(max_digits=10, decimal_places=2)

    categoria = models.CharField(max_length=255, null=True, blank=True)
    
    def __str__(self):
        return self.titulo
