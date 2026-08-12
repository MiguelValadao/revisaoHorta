import 'package:flutter/material.dart';

class TelaHorta extends StatefulWidget {
  const TelaHorta({super.key});

  @override
  State<TelaHorta> createState() => _TelaHortaState();
}

class _TelaHortaState extends State<TelaHorta> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _waterController = TextEditingController();
  double waterLevel = 50;

  String? _savedName;
  String? _savedStyle;

  @override
  void dispose() {
    _nameController.dispose();
    _waterController.dispose();
    super.dispose();
  }

  void _save() {
    setState(() {
      _savedName = _nameController.text.trim();
      _savedStyle = _waterController.text.trim();
    });
  }

  void _moreWater() {
    if (waterLevel < 100) {
      setState(() {
        waterLevel += 10;
      });
    } else {
      waterLevel = 100;
    }
  }

  void _lessWater() {
    if (waterLevel == 0) {
      waterLevel = 10;
    } else {
      setState(() {
        waterLevel -= 10;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horta Inteligente'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nome da planta',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person_outline),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Volume da água: $waterLevel',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                  onPressed: _lessWater,
                  icon: const Icon(Icons.remove),
                  label: const Text('Volume'),
                ),
                const SizedBox(width: 24),
                OutlinedButton.icon(
                  onPressed: _moreWater,
                  icon: const Icon(Icons.add),
                  label: const Text('Volume'),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            FilledButton.icon(
              onPressed: _save,
              icon: const Icon(Icons.save_outlined),
              label: const Text('Salvar'),
            ),
            if (_savedName != null && _savedStyle != null) ...[
              const SizedBox(height: 32),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.person),
                        title: const Text('Nome'),
                        subtitle: Text(_savedName!),
                      ),
                      ListTile(
                        leading: const Icon(Icons.library_music_outlined),
                        title: const Text('Estilo musical'),
                        subtitle: Text(_savedStyle!),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
