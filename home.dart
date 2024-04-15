import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Music.dart';
import 'package:flutter_application_1/models/category.dart';
import 'package:flutter_application_1/services/category_operations.dart';
import 'package:flutter_application_1/services/music_operations.dart';

class Home extends StatelessWidget {
  // ignore: prefer_final_fields
  Function _miniPlayer;
  Home(this._miniPlayer);

  Widget createMusic(Music music) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ignore: sized_box_for_whitespace
          Container(
            height: 200,
            width: 200,
            child: InkWell(
                onTap: () {
                  _miniPlayer(music);
                },
                child: Image.network(music.image, fit: BoxFit.cover)),
          ),
          Text(music.name, style: const TextStyle(color: Colors.white70)),
          Text(music.desc, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }

  Widget createMusicList(String label) {
    List<Music> MusicList = MusicOperations.getMusic();
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
                color: Colors.white70,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          // ignore: sized_box_for_whitespace
          Container(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return createMusic(MusicList[index]);
              },
              itemCount: MusicList.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget createCategory(category category) {
    return Container(
      color: Colors.blueGrey,
      child: Row(
        children: [
          Image.network(category.imageURL, fit: BoxFit.cover),
          const Padding(padding: EdgeInsets.only(left: 5)),
          Text(category.name, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }

  List<Widget> createListsofCategory() {
    List<category> categoryList =
        CategoryOperations.getCategories(); // receive data //
    // convert data to widget using map function //
    List<Widget> categories = categoryList
        .map((category category) => createCategory(category))
        .toList(); //
    return categories;
  }

  Widget createGrid() {
    return Container(
        padding: const EdgeInsets.all(5),
        height: 270,
        child: GridView.count(
          childAspectRatio: 6 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          // ignore: sort_child_properties_last
          children: createListsofCategory(),
          crossAxisCount: 2,
        ));
  }

  Widget createAppBar(String message) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text(message),
      actions: const [
        Padding(
            padding: EdgeInsets.only(right: 10), child: Icon(Icons.settings))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          // ignore: sort_child_properties_last
          child: Column(
            children: [
              createAppBar('Sandy Boy'),
              const SizedBox(height: 4),
              createGrid(),
              createMusicList('Made For You'),
              createMusicList('Popular Playlist'),
            ],
          ),
          // Below is the code for Linear Gradient.
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.black, Colors.black, Colors.black],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
    ); // container is store many widget //
  }
}
