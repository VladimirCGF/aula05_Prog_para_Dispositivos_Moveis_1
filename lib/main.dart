import 'dart:math';

import 'package:aula05/components/formulario_produto.dart';
import 'package:aula05/components/lista_produto.dart';
import 'package:aula05/models/produto.dart';
import 'package:flutter/material.dart';

main() => runApp(ListaComprasApp());

class ListaComprasApp extends StatelessWidget {
  ListaComprasApp({super.key});

  final ThemeData tema = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.amber,
        ),
        textTheme: tema.textTheme.copyWith(
          titleLarge: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Produto> _produtos = [];

  _adicionarProduto(String nome, double preco, int quantidade) {
    final novoProduto = Produto(
      id: Random().nextDouble().toString(),
      nome: nome,
      preco: preco,
      quantidade: quantidade,
    );

    setState(() {
      _produtos.add(novoProduto);
    });

    Navigator.of(context).pop();
  }

  _removerProduto(String id){
    setState(() {
      _produtos.removeWhere((tr){
        return tr.id == id;
      });
    });
  }

  _abrirFormularioProdutoModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return FormularioProduto(_adicionarProduto);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Compras'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _abrirFormularioProdutoModal(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ListaProduto(_produtos, _removerProduto),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _abrirFormularioProdutoModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

