# Generated by Django 5.1.3 on 2024-11-15 23:03

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Livro',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('titulo', models.CharField(max_length=100)),
                ('imagem', models.ImageField(blank=True, null=True, upload_to='livros')),
                ('descricao', models.TextField(blank=True, null=True)),
                ('autor', models.CharField(blank=True, max_length=100, null=True)),
                ('preco', models.DecimalField(decimal_places=2, max_digits=10)),
            ],
        ),
    ]