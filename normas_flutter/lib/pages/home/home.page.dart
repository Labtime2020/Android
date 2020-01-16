import 'package:flutter/material.dart';
import 'package:normas_flutter/widgets/drawer.widget.dart';
import 'package:normas_flutter/widgets/footer.widget.dart';

class HomePage extends StatelessWidget {
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
      body: ListView(
        children: <Widget>[
          landingPage(),
          searchStandard(),
          filterStandard(),
          listStadard(),
          FooterWidget(),
        ],
      ),
    );
  }
}

Widget landingPage() {
  return Visibility(
    visible: true,
    child: Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 150,
              child: Image.asset(
                "assets/logo/logo-small.png",
                fit: BoxFit.cover,
              ),
            ),
            Text(
              "Lorem ipsum dolor sit amet",
              style: TextStyle(
                color: Color(0xFF006CD0),
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Life can feel overwhelming, but it doesn't have to. Todoist lets you keep track of everything in one place, so you can get it all done and enjoy more peace of mind along way",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget searchStandard() {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      height: 50,
      color: Colors.white,
      child: TextFormField(
        style: TextStyle(
          fontSize: 18,
        ),
        decoration: InputDecoration(
          hintText: "Buscar norma",
          border: InputBorder.none,
          icon: Icon(Icons.search),
        ),
      ),
    ),
  );
}

Widget filterStandard() {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Filtrar",
              style: TextStyle(
                color: Colors.black54,
              ),
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
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
        Visibility(
          visible: false,
          maintainSize: false,
          maintainAnimation: true,
          maintainState: true,
          child: Container(
            height: 80,
            color: Colors.black12,
          ),
        )
      ],
    ),
  );
}

Widget listStadard() {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
    child: Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {},
            child: Container(
              width: 110,
              alignment: Alignment.center,
              height: 30,
              child: Text(
                "CARREGAR MAIS",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ),
        cardItem(),
        cardItem(),
        cardItem(),
        cardItem(),
        cardItem(),
        cardItem(),
      ],
    ),
  );
}

Widget cardItem() {
  return Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Norma ABNT 002NTR",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "365",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.visibility,
                      size: 20,
                      color: Colors.black54,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          width: double.infinity,
          child: Text(
            "Tags: ABNT, Acadêmcio",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 12,
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          width: double.infinity,
          child: Text(
            "Dolore ex deserunt aute fugiat aute nulla ea sunt aliqua nisi cupidatat eu. Nostrud in laboris labore nisi amet do dolor eu fugiat consectetur elit cillum esse. Pariatur occaecat nisi laboris tempor laboris eiusmod qu…",
            maxLines: 5,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 12,
            ),
          ),
        ),
        Divider(
          color: Colors.black54,
        ),
        Container(
          height: 50,
          padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 85,
                  child: Text(
                    "VISUALIZAR",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    ClipOval(
                      child: Material(
                        child: InkWell(
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: Icon(
                              Icons.favorite_border,
                              size: 25,
                              color: Colors.black54,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ClipOval(
                      child: Material(
                        child: InkWell(
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: Icon(
                              Icons.file_download,
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
              )
            ],
          ),
        ),
      ],
    ),
  );
}
