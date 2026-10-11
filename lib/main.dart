import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

// Première page : saisie du texte
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final _textFieldController = TextEditingController();

  void _navigateToResultPage(BuildContext context) {
    String value = _textFieldController.text;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(value: value),
      ),
    );
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page d’accueil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(
                labelText: 'Saisissez un texte',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _navigateToResultPage(context),
              child: const Text('Afficher le résultat'),
            ),
          ],
        ),
      ),
    );
  }
}

// Deuxième page : affichage du texte reçu
class ResultPage extends StatelessWidget {
  final String value;

  const ResultPage({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page de résultat'),
      ),
      body: Center(
        child: Text(
          'Texte saisi : $value',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}