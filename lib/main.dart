import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle Safra',
      theme: ThemeData(
        primarySwatch: Colors.green, // Define o tema verde
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // List of widgets to display in each drawer option
  static List<Widget> _widgetOptions = <Widget>[
    ProfilePage(),
    ProductsPage(),
    CartPage(),
    HelpPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pop(context); // Fechar o Drawer após seleção
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle Safra'),
        backgroundColor: Colors.green, // Define a cor do AppBar como verde
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green, // Cor de fundo do cabeçalho do Drawer
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Perfil'),
              onTap: () => _onItemTapped(0), // Perfil primeiro
            ),
            ListTile(
              leading: Icon(Icons.balance),
              title: Text('Custos'),
              onTap: () => _onItemTapped(1),
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Insumos'),
              onTap: () => _onItemTapped(2),
            ),
            ListTile(
              leading: Icon(Icons.monetization_on_rounded),
              title: Text('Lucro'),
              onTap: () => _onItemTapped(3),
            ),
          ],
        ),
      ),
    );
  }
}

// Página de Perfil com formulário de cadastro
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Cadastro de Perfil',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(labelText: 'Nome'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'E-mail'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Telefone'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Função para salvar o perfil
            },
            child: Text('Salvar Perfil'),
          ),
        ],
      ),
    );
  }
}

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Lista de Produtos',
          style: TextStyle(fontSize: 24),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddProductPage()),
            );
          },
          child: Text('Cadastrar Produto'),
        ),
      ],
    );
  }
}

class AddProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Produto'),
        backgroundColor: Colors.green, // Define a cor do AppBar como verde
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Nome do Produto'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Preço'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Descrição'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Função para salvar produto
              },
              child: Text('Salvar Produto'),
            ),
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Carrinho de Compras',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Ajuda',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
