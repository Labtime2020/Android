import 'package:flutter/material.dart';
import 'package:normas_flutter/widgets/drawer.widget.dart';
import 'package:normas_flutter/widgets/footer.widget.dart';

class UsersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 40,
          child: Image.asset(
            "assets/logo/logo-small-white.png",
            fit: BoxFit.cover,
          ),
        ),
        backgroundColor: Color(0xFF006CD0),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      drawer: DrawerWidget(context),
      body: UsersWidgetPage(),
    );
  }
}

class UsersWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Usuários"),
        backgroundColor: Color(0xFF006CD0),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                itemUserListCard(context),
              ],
            ),
          ),
          FooterWidget(),
        ],
      ),
    );
  }

  Widget itemUserListCard(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          print('Card tapped.');
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Text('A card that can be tapped'),
        ),
      ),
    );
  }
}

/////////////////////////////////
///
///import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  static String tag = 'contactlist-page';

  @override
  State<StatefulWidget> createState() {
    return _ContactsListState();
  }
}

class _ContactsListState extends State<ContactsList> {
  TextEditingController searchController = TextEditingController();
  String filter;

  @override
  initState() async {
    searchController.addListener(() {
      setState(() {
        filter = searchController.text;
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Usuários',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        onPressed: () => searchController.clear(),
                        icon: Icon(Icons.clear),
                      ),
                      focusColor: Colors.black,
                      hintText: 'Buscar usuário',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "Filtrar",
                            style: TextStyle(fontSize: 16),
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black38,
                              size: 20.0,
                            ),
                            shape: CircleBorder(),
                            color: Colors.white,
                          )
                        ],
                      ),
                      RaisedButton(
                        child: Row(
                          children: <Widget>[
                            Text("Ordem"),
                            Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  // if filter is null or empty returns all data
                  return filter == null || filter == ""
                      ? ListTile(
                          title: Text(
                            '${contacts[index].fullName}',
                          ),
                          subtitle: Text('${contacts[index].email}'),
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Text(
                                '${contacts[index].fullName.substring(0, 1)}'),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.brightness_1,
                                color: Colors.green,
                                size: 20,
                              ),
                              IconButton(
                                icon: Icon(Icons.more_vert),
                                onPressed: () {
                                  _onTapItem(context, contacts[index]);
                                },
                              )
                            ],
                          ),
                        )
                      : '${contacts[index].fullName}'
                              .toLowerCase()
                              .contains(filter.toLowerCase())
                          ? ListTile(
                              title: Text(
                                '${contacts[index].fullName}',
                              ),
                              subtitle: Text('${contacts[index].email}'),
                              leading: CircleAvatar(
                                backgroundColor: Colors.blue,
                                child: Text(
                                    '${contacts[index].fullName.substring(0, 1)}'),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    Icons.trip_origin,
                                    color: Colors.green,
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.more_vert),
                                    onPressed: () {
                                      _onTapItem(context, contacts[index]);
                                    },
                                  )
                                ],
                              ),
                            )
                          : Container();
                },
              ),
            ),
          ],
        ));
  }

  void _onTapItem(BuildContext context, Contact post) {
    Scaffold.of(context).showSnackBar(
        new SnackBar(content: new Text("Tap on " + ' - ' + post.fullName)));
  }
}

class Contact {
  final String fullName;
  final String email;
  final bool status;

  const Contact({this.fullName, this.email, this.status});
}

List<Contact> contacts = [
  Contact(
      fullName: 'Nome do Usuário 1',
      email: 'username@labtime.ufg.br',
      status: true),
  Contact(
      fullName: 'Nome do Usuário 2',
      email: 'username@labtime.ufg.br',
      status: true),
  Contact(
      fullName: 'Nome do Usuário 3',
      email: 'username@labtime.ufg.br',
      status: true),
  Contact(
      fullName: 'Nome do Usuário 4',
      email: 'username@labtime.ufg.br',
      status: true),
  Contact(
      fullName: 'Nome do Usuário 5',
      email: 'username@labtime.ufg.br',
      status: true),
  Contact(
      fullName: 'Nome do Usuário 6',
      email: 'username@labtime.ufg.br',
      status: true),
  Contact(
      fullName: 'Nome do Usuário 7',
      email: 'username@labtime.ufg.br',
      status: true),
  Contact(
      fullName: 'Nome do Usuário 8',
      email: 'username@labtime.ufg.br',
      status: true),
  Contact(
      fullName: 'Nome do Usuário 9',
      email: 'username@labtime.ufg.br',
      status: true),
  Contact(
      fullName: 'Nome do Usuário 10',
      email: 'username@labtime.ufg.br',
      status: true),
  Contact(
      fullName: 'Nome do Usuário 11',
      email: 'username@labtime.ufg.br',
      status: true),
  Contact(
      fullName: 'Nome do Usuário 12',
      email: 'username@labtime.ufg.br',
      status: true),
  Contact(
      fullName: 'Nome do Usuário 13',
      email: 'username@labtime.ufg.br',
      status: true),
];
