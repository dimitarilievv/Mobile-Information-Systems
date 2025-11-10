import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

void log(String who, String what) => debugPrint('***[$who] $what');

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Lifecycle Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        // change color to trigger didChangeDependencies()
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() {
    log("Home", "createState()");
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int parentCount = 0;
  bool showChild = true;

  @override
  void initState() {
    log("Home", "initState()");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    log("Home", "didChangeDependencies()");
    super.didChangeDependencies();
  }

  @override
  void setState(VoidCallback fn) {
    log("Home", "setState()");
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    log("Home", "build()");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Widget Lifecycle Demo"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => setState(() {
                    showChild = !showChild;
                  }),
                  child: Text(showChild ? "Hide child" : "Show child"),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => setState(() {
                    parentCount++;
                  }),
                  child: Text("Increment parent counter"),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text("Parent counter: $parentCount"),
            SizedBox(height: 16),
            if (showChild) ChildCard(parentValue: parentCount),
          ],
        ),
      ),
    );
  }
}

class ChildCard extends StatefulWidget {
  final int parentValue;

  const ChildCard({super.key, required this.parentValue});

  @override
  State<ChildCard> createState() {
    log("Child", "createState()");
    return _ChildCardState();
  }
}

class _ChildCardState extends State<ChildCard> {
  int childCounter = 0;

  @override
  void initState() {
    log("Child", "initState()");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    log("Child", "didChangeDependencies()");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant ChildCard oldWidget) {
    if (oldWidget.parentValue != widget.parentValue) {
      log(
        "Child",
        "didUpdateWidget(): parent value changed from ${oldWidget.parentValue} to ${widget.parentValue}",
      );
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void setState(VoidCallback fn) {
    log("Child", "setState()");
    super.setState(fn);
  }

  @override
  void deactivate() {
    log("Child", "deactivate()");
    super.deactivate();
  }

  @override
  void dispose() {
    log("Child", "dispose()");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log("Child", "build()");
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Parent counter: ${widget.parentValue}"),
            SizedBox(height: 12),
            Text("Child counter: $childCounter"),
            SizedBox(height: 12),
            FilledButton(
              onPressed: () => setState(() {
                childCounter++;
              }),
              child: Text("Increment child counter"),
            ),
          ],
        ),
      ),
    );
  }
}




