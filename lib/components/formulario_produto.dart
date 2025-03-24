import 'package:flutter/material.dart';


class FormularioProduto extends StatefulWidget {
  final void Function(String, double, int) onSubmit;

  const FormularioProduto(this.onSubmit, {super.key});

  @override
  State<FormularioProduto> createState() => _FormularioProdutoState();
}

class _FormularioProdutoState extends State<FormularioProduto> {
  final _nomeController = TextEditingController();
  final _precoController = TextEditingController();
  final _quantidadeController = TextEditingController();


  _submitForm() {
    final nome = _nomeController.text;
    final preco = double.tryParse(_precoController.text) ?? 0;
    final quantidade = int.tryParse(_quantidadeController.text) ?? 0;

    if (nome.isEmpty || preco <= 0 || quantidade <= 0) {
      return;
    }

    widget.onSubmit(nome, preco, quantidade);
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _precoController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(labelText: 'Preço (R\$)'),
            ),
            TextField(
              controller: _quantidadeController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(labelText: 'Quantidade'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  onPressed: _submitForm,
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: const Text(
                    'Novo Produto',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
