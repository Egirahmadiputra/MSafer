import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String saldo, masuk, keluar;

void main() {
  _prosesData();
}

Future<List> _prosesData() async {
  final response =
      await http.post("http://127.0.0.1/flutter/proses_data.php", body: {});
  var datasaldo = json.decode(response.body);

  if (datasaldo.length == 1) {
    saldo = datasaldo[0];
    masuk = datasaldo[1];
    keluar = datasaldo[2];
  } else {
    // setState(() {
    //   msg = "Login Gagal";
    // });
  }
  return datasaldo;
}

class HomePage extends StatelessWidget {
  HomePage({this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Money Safer'),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            new Center(
              child: new Image.asset(
                "assets/logo.png",
                height: 200.0,
                width: 200.0,
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Column(
                children: [
                  Text(
                    'Pemasukan',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Text(
                    ' Pengeluaran',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Text(
                    ' Balance        ',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ],
              ),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Column(
                children: [
                  Text(
                    ':',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Text(
                    ':',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Text(
                    ':',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ],
              ),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Column(
                children: [
                  Text(
                    '  Rp.1500000',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Text(
                    'Rp.250000',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Text(
                    '  RP.1250000',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ],
              ),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
            ]),
          ],
        ),
      ),
      drawer: _buildDrawer(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Balance',
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildDrawer() {
    return SizedBox(
      width: 300,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: ClipOval(
                child: Image(
                    image: AssetImage('assets/images/pp.jpg'),
                    fit: BoxFit.cover),
              ),
              accountName: Text('$username'),
              accountEmail: Text("$username@gmail.com"),
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
            ),
            _buildListTile(Icons.notifications, "Notifications", null),
            _buildListTile(Icons.bookmark_border, "History", null),
            Divider(
              height: 2.0,
            ),
            _buildListTile(Icons.person, "Account", null),
            _buildListTile(Icons.settings, "Settings", null),
            Divider(
              height: 2.0,
            ),
            _buildListTile(null, "About", null),
            _buildListTile(null, "Logout", Icons.input),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(
    IconData iconLeading,
    String title,
    IconData iconTrailing,
  ) {
    return ListTile(
      leading: Icon(iconLeading),
      title: Text(title),
      trailing: Icon(iconTrailing),
      onTap: () {},
    );
  }
}
