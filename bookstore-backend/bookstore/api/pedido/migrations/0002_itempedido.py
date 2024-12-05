# Generated by Django 5.1.4 on 2024-12-05 16:45

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('livro', '0001_initial'),
        ('pedido', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='ItemPedido',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('quantidade', models.IntegerField()),
                ('livro', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='itens_pedido', to='livro.livro')),
                ('pedido', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='itens_pedido', to='pedido.pedido')),
            ],
        ),
    ]
