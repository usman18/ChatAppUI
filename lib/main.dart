import 'package:chat_app_ui/pages/chats_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(ChatApp());

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Color(0xffF1004C),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> drawerOptions = ["Home", "Chats", "Contacts", "Calendar", "Bookmarks", "Settings"];
  final List<IconData> drawerIcons = [Icons.home, Icons.comment, Icons.contacts, Icons.calendar_today, Icons.bookmark, Icons.settings];

  int currentOptionSelected = 1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: _buildSideBar(),
      body: ChatsPage(),
      appBar: AppBar(
        elevation: 0,
        title: Text("Chats", style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w900,
        ),),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Theme.of(context).accentColor,),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {},
        child: Icon(Icons.search),
      ),
    );
  }

  Drawer _buildSideBar() {
    return Drawer(
      child: Container(
        color: Color(0xff291A30),
        child: Column(
          children: <Widget>[
            SizedBox(height: 40,),
            _buildAvatarSection(),
            Divider(color: Colors.white, thickness: 0.3,),
            Expanded(
              child: ListView.builder(itemBuilder: (_, position) {
                  return Container(
                    color: position == currentOptionSelected ? Theme.of(context).accentColor : Color(0xff291A30),
                    child: ListTile(
                      leading: Icon(drawerIcons[position], color: Colors.white,),
                      title: Text(drawerOptions[position], style: TextStyle(
                        color: Colors.white,
                      ),),
                    ),
                  );
                },
                itemCount: drawerOptions.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarSection() {
    return ListTile(
      contentPadding: EdgeInsets.all(20),
      leading: CircleAvatar(
        backgroundImage: NetworkImage("https://avatars2.githubusercontent.com/u/40769429?s=460&v=4"),
        radius: 30,
      ),
      title: Text("Usman Khan", style: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w600
      ),),
      subtitle: Text("usman18",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w100,
        ),
      ),
    );
  }
}




