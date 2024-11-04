import 'package:flutter/material.dart';

class SimulationScreen extends StatelessWidget {
  const SimulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const Simul(),
        appBar: AppBar(
          title: const Text('Simulation'),
          centerTitle: true,
          leading: const Icon(
            Icons.edit_note,
            color: Colors.black,
            size: 40,
          ),
        ),
      ),
    );
  }
}

class Simul extends StatefulWidget {
  const Simul({super.key});
  @override
  State<Simul> createState() => _SimulState();
}

class _SimulState extends State<Simul> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
