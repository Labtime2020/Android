import 'package:flutter/material.dart';
import 'package:normas_flutter/widgets/app_bar.widget.dart';

class UsersListPage extends StatefulWidget {
  static String tag = 'contactlist-page';

  @override
  State<StatefulWidget> createState() {
    return _UsersListPageState();
  }
}

class _UsersListPageState extends State<UsersListPage> {
  TextEditingController searchController = TextEditingController();
  String filter;

  @override
  void initState() {
    searchController.addListener(
      () {
        setState(() {
          filter = searchController.text;
        });
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBarStandard(
      appBody: contactList(context, filter, searchController),
    );
  }
}

Widget contactList(BuildContext context, String filter,
    TextEditingController searchController) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        'Usuários',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Color(0xFF006CD0),
    ),
    body: Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            searchUsers(searchController),
            filterUsers(),
          ],
        ),
        listUsers(context, filter),
      ],
    ),
  );
}

Widget searchUsers(TextEditingController searchController) {
  return Padding(
    padding: const EdgeInsets.only(left: 5.0, top: 20.0, right: 10.0),
    child: Container(
      height: 50,
      child: TextFormField(
        style: TextStyle(
          fontSize: 18,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          suffixIcon: ClipOval(
            child: Material(
              color: Colors.transparent, // button color
              child: InkWell(
                // inkwell color
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Icon(
                    Icons.clear,
                    size: 25,
                  ),
                ),
                onTap: () => searchController.clear(),
              ),
            ),
          ),
          hintText: "Buscar usuário",
          border: InputBorder.none,
        ),
      ),
    ),
  );
}

Widget filterUsers() {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, top: 0.0, right: 12.5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Filtrar",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            ClipOval(
              child: Material(
                color: Colors.transparent, // button color
                child: InkWell(
                  // inkwell color
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 25,
                      color: Colors.black54,
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Ordem",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            ClipOval(
              child: Material(
                color: Colors.transparent, // button color
                child: InkWell(
                  // inkwell color
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 25,
                      color: Colors.black54,
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget listUsers(BuildContext context, String filter) {
  return Expanded(
    child: ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        return itemUsers(context, index, filter);
      },
    ),
  );
}

Widget itemUsers(BuildContext context, int index, String filter) {
  return filter == null || filter == ""
      ? ListTile(
          title: Text(
            '${contacts[index].fullName}',
          ),
          subtitle: Text('${contacts[index].email}'),
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text('${contacts[index].fullName.substring(0, 1)}'),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.brightness_1,
                color: Colors.blue,
                size: 14,
              ),
              SizedBox(
                width: 10,
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
                child: Text('${contacts[index].fullName.substring(0, 1)}'),
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
                      _onTapItem(
                        context,
                        contacts[index],
                      );
                    },
                  )
                ],
              ),
            )
          : Container();
}

void _onTapItem(BuildContext context, Contact post) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text("Tap on " + ' - ' + post.fullName),
      duration: Duration(milliseconds: 2),
    ),
  );
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
