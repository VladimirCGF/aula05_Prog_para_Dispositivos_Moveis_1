import 'package:flutter/material.dart';

import '../models/produto.dart';

class ListaProduto extends StatelessWidget {
  final List<Produto> produtos;
  final void Function(String) onRemove;

  ListaProduto(this.produtos, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 430,
      child:
          produtos.isEmpty
              ? Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Nenhum Produto Cadastrado!',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(height: 200),
                ],
              )
              : ListView.builder(
                itemCount: produtos.length,
                itemBuilder: (ctx, index) {
                  final tr = produtos[index];
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      title: Text(
                        tr.nome,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: FittedBox(
                            child: Text('${tr.quantidade}'),
                          ),
                        ),
                      ),
                      subtitle: Text(
                            'R\$${tr.preco * tr.quantidade}',
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                      trailing: IconButton(
                        onPressed: () => onRemove(tr.id),
                        color: Colors.redAccent,
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
