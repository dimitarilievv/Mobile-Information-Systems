import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widgets',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Flutter Widgets"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              "1. Basic Widgets",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Card(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Text Widget",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text("This is a simple text widget"),
                    Text(
                      "Styled text with color and style",
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                    Divider(height: 30),

                    Text(
                      "Icon Widget",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.favorite, color: Colors.red, size: 30),
                        SizedBox(width: 8),
                        Icon(Icons.star, color: Colors.yellow, size: 30),
                        SizedBox(width: 8),
                        Icon(
                          Icons.thumb_up_alt_rounded,
                          color: Colors.blue,
                          size: 30,
                        ),
                      ],
                    ),
                    Divider(height: 30),
                    Text(
                      "Button Widget",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Wrap(
                      spacing: 16,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Elevated button"),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: Text("Outlined button"),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text("Text button"),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),

            Text(
              "2. Layout Widgets",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Card(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Column (Vertical)",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      color: Colors.blue.shade50,
                      padding: EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Text("Item 1"),
                          Text("Item 2"),
                          Text("Item 3"),
                        ],
                      ),
                    ),
                    Divider(height: 30),
                    Text(
                      "Row (Horizontal)",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      color: Colors.green.shade50,
                      padding: EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.home),
                          Icon(Icons.search),
                          Icon(Icons.settings),
                        ],
                      ),
                    ),
                    Divider(height: 30),
                    Text(
                      "Container (with decoration)",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.purple.shade100,
                        border: Border.all(color: Colors.purple, width: 3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Container with border and rounded corners",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              )
            ),
            SizedBox(height: 8),
            Text(
              "3. Interface Widgets",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Card Widget",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Card(
                      elevation: 10,
                      color: Colors.blue.shade50,
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text("This is a card widget with elevation"),
                      ),
                    ),
                    Divider(height: 30),

                    Text(
                      "ListTile Widget",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.person, color: Colors.blue,),
                      title: Text("John Doe"),
                      subtitle: Text("john@email.com"),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    SizedBox(height: 8),
                    ListTile(
                      leading: Icon(Icons.person, color: Colors.green,),
                      title: Text("John Doe"),
                      subtitle: Text("john@email.com"),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    Divider(height: 30),

                    Text(
                      "TextField Widget",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                          label: Text("Enter your name")
                      ),
                    ),
                    Divider(height: 30),

                    Text(
                      "Chip Widget",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Wrap(
                      spacing: 10,
                      children: [
                        Chip(label: Text("Flutter"), avatar: Icon(Icons.code)),
                        Chip(label: Text("Dart"), avatar: Icon(Icons.code)),
                        Chip(label: Text("Mobile"), avatar: Icon(Icons.phone_android)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),

            Text(
              "4. Scrolling Widgets",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Horizontal Scrolling ListView",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.all(12),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                            width: 100,
                            margin: EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                              color: Colors.primaries[index % Colors.primaries.length],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                "Item ${index + 1}",
                                style: TextStyle(color: Colors.white, fontSize: 18),
                              ),
                            )
                        );
                      }
                  ),
                ),

                Text(
                  "GridView",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10
                    ),
                    padding: EdgeInsets.all(12),
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return Container(
                          width: 100,
                          margin: EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                            color: Colors.primaries[index % Colors.primaries.length],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              "${index + 1}",
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          )
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
