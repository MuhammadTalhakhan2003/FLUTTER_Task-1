import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Enhanced Item List App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.purple[50],
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item List App'),
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(color: Colors.white),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              'Fruit List',
              style: TextStyle(color: Colors.white),
            ),
            tileColor: Colors.purple[300],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FruitListScreen()),
              );
            },
          ),
          ListTile(
            title: Text(
              'Countries and States',
              style: TextStyle(color: Colors.white),
            ),
            tileColor: Colors.purple[400],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CountryListScreen()),
              );
            },
          ),
          ListTile(
            title: Text(
              'Fruit Consumption',
              style: TextStyle(color: Colors.white),
            ),
            tileColor: Colors.purple[500],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FruitConsumptionScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class FruitListScreen extends StatelessWidget {
  final List<Map<String, String>> items = [
    {'name': 'Apple', 'description': 'A sweet red fruit'},
    {'name': 'Banana', 'description': 'A long yellow fruit'},
    {'name': 'Cherry', 'description': 'A small red fruit'},
    {'name': 'Date', 'description': 'A sweet brown fruit'},
    {'name': 'Elderberry', 'description': 'A small black fruit'},
    {'name': 'Fig', 'description': 'A sweet purple fruit'},
    {'name': 'Grape', 'description': 'A small purple or green fruit'},
    {'name': 'Honeydew', 'description': 'A sweet green melon'},
    {'name': 'Indian Fig', 'description': 'A type of cactus fruit'},
    {'name': 'Jackfruit', 'description': 'A large tropical fruit'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fruit List'),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.purple[100],
              title: Text(
                items[index]['name']!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                items[index]['description']!,
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                final snackBar = SnackBar(
                  content: Text('Tapped on ${items[index]['name']}'),
                  backgroundColor: Colors.purple,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          );
        },
      ),
    );
  }
}

class CountryListScreen extends StatelessWidget {
  final List<Country> countries = [
    Country('USA', ['California', 'Texas', 'Florida', 'New York']),
    Country('India', ['Maharashtra', 'Karnataka', 'Tamil Nadu', 'Kerala']),
    Country('Canada', ['Ontario', 'Quebec', 'British Columbia', 'Alberta']),
    Country('Pakistan', ['Punjab', 'Sindh', 'Khyber Pakhtunkhwa', 'Balochistan']),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text('Countries and States'),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.purple[200],
              title: Text(
                countries[index].name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StateListScreen(countries[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class StateListScreen extends StatelessWidget {
  final Country country;

  StateListScreen(this.country);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('${country.name} States'),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        
        itemCount: country.states.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.purple[100],
              title: Text(
                country.states[index],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}

class FruitConsumptionScreen extends StatelessWidget {
  final List<FruitConsumption> fruitConsumptions = [
    FruitConsumption('Apple', 8600),
    FruitConsumption('Banana', 11500),
    FruitConsumption('Cherry', 3200),
    FruitConsumption('Date', 2700),
    FruitConsumption('Elderberry', 1800),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fruit Consumption'),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        itemCount: fruitConsumptions.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.purple[200],
              title: Text(
                fruitConsumptions[index].fruit,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Consumption: ${fruitConsumptions[index].consumption} metric tons',
                style: TextStyle(fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Country {
  final String name;
  final List<String> states;

  Country(this.name, this.states);
}

class FruitConsumption {
  final String fruit;
  final int consumption;

  FruitConsumption(this.fruit, this.consumption);
}
