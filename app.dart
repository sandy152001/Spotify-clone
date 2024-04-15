import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/music.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/search.dart';
import 'package:flutter_application_1/screens/yourlibrary.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: non_constant_identifier_names
  var Tabs = [];
  int currentTabIndex = 0;

  Music? music;

  Widget miniPlayer(Music ?music) {
    this.music = music;
    setState(() {});
    if (music==null) {
      return  const SizedBox();
    }
    Size deviceSize = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      color: Colors.blueGrey,
      width: deviceSize.width,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(music.image, fit: BoxFit.cover),
          Text(
            music.name,
            style: const TextStyle(color: Colors.white70, fontSize: 20),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.play_arrow,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  @override
  initState() {
    super.initState();
    Tabs = [Home(miniPlayer), const Search(), const YourLibrary()];
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tabs[currentTabIndex],
      backgroundColor: Colors.black,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          miniPlayer(music),
          BottomNavigationBar(
              currentIndex: currentTabIndex,
              onTap: (currentIndex) {
                currentTabIndex = currentIndex;
                setState(() {
                  // re-rendering because build is run one time to run build again we use setState //
                });
              },
              selectedLabelStyle: TextStyle(color: Colors.white),
              selectedItemColor: Colors.white,
              selectedIconTheme:
                  const IconThemeData(grade: BorderSide.strokeAlignCenter),
              backgroundColor: Colors.black45,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, color: Colors.white), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search, color: Colors.white),
                    label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.library_books, color: Colors.white),
                    label: 'Your library')
              ]),
        ],
      ),
    );
  }
}
