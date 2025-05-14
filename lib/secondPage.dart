import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SecondPageApp extends StatelessWidget {
  final String name;
  const SecondPageApp({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final logger = Logger();
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem vindo(a), $name', style: const TextStyle(color: Colors.black)),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Item $index da lista'),
                    subtitle: Text('Descrição do item $index'),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('ALERTA'),
                            content: Text('Você clicou no item $index'),
                            actions: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  logger.i('Selecionado Sim no item $index');
                                  Navigator.pop(context);
                                },
                                child: const Text('Sim'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  logger.i('Selecionado Não no item $index');
                                  Navigator.pop(context);
                                },
                                child: const Text('Não'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}