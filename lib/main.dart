import 'package:flutter/material.dart';
import 'package:test_project/main_title_text.dart';
import 'post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "flutter demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BasicPage(),
    );
  }
}

class BasicPage extends StatelessWidget {
  

  List<Post> posts = [
    Post(
        name: "Yahya Diakhite",
        time: "5 minutes",
        imagePath: 'images/carnaval.jpg',
        decs:
            "Petit tour au Magic world, on s'est bien amuses, en plus il  n'y avait grand monde. Bref, le kiffe"),
    Post(
        name: "Yahya Diakhite",
        time: "2 jours",
        imagePath: 'images/mountain.jpg',
        decs: "La montagne ca vous gagne"),
    Post(
        name: "Yahya Diakhite",
        time: "1 semaine",
        imagePath: "images/work.jpg",
        decs: "Retour au boulot apres plusieur mois de confinement"),
    Post(
        name: "Yahya Diakhite",
        time: " 5 ans",
        imagePath: "images/playa.jpg",
        decs:
            "Le boulot en remote c'est le pied: la preuve ceci sera mon bureau pour les prochaines semaines ")
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Facebook Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  "images/cover.jpg",
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 125),
                  child: CircleAvatar(
                      radius: 75,
                      backgroundColor: Colors.white,
                      child: myProfilePic(72)),
                ),
              ],
            ),
            Row(
              children: [
                Spacer(),
                MainTitleText(data: "Diakhite"),
                Spacer(),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Un jour les chats domineront le monde, mais pas aujourd'hui, c'est l'heure de la sieste",
                style:
                    TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blue,
                    margin: EdgeInsets.only(left: 5, right: 5),
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Modifier le profit",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                    color: Colors.blue,
                    margin: EdgeInsets.only(left: 5, right: 5),
                    padding: EdgeInsets.all(15),
                    child: Icon(
                      Icons.border_color,
                      color: Colors.white,
                      size: 28,
                    ))
              ],
            ),
            Divider(
              thickness: 2,
            ),
            sectionTitleText(" A propos de moi"),
            aboutRow(icon: Icons.house, text: "Hyéres les palmiers, France "),
            aboutRow(icon: Icons.work, text: "Développeur Flutter"),
            aboutRow(icon: Icons.favorite, text: "En couple avec mon chat"),
            Divider(
              thickness: 2,
            ),
            sectionTitleText("Amis"),
            allFriends(width / 3.5),
            Divider(
              thickness: 2,
            ),
            sectionTitleText("Mes posts"),
            allPosts(),
          ],
        ),
      ),
    );
  }

  CircleAvatar myProfilePic(double radius) {
    return CircleAvatar(
        radius: 72, backgroundImage: AssetImage("images/profile.jpg"));
  }

  // pour le profil ;
  Container buttonContainer(IconData? icon, String? text) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
      ),
      child: (icon == null)
          ? Text(
              text ?? "",
              style: TextStyle(color: Colors.white),
            )
          : Icon(
              icon,
              color: Colors.white,
            ),
    );
  }

  Widget sectionTitleText(String text) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget aboutRow({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(icon),
        Padding(
          padding: EdgeInsets.all(5),
          child: Text(text),
        ),
      ],
    );
  }

  Column friendsImage(String name, String imagePath, double width) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          height: width,
          width: width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imagePath), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(color: Colors.grey)],
              color: Colors.blue),
        ),
        Text(name),
        Padding(padding: EdgeInsets.only(bottom: 5))
      ],
    );
  }

  Row allFriends(double width) {
    Map<String, String> friend = {
      "Moctar": "images/cat.jpg",
      "abdoul": "images/sunflower.jpg",
      "Mouatapha": "images/duck.jpg",
    };
    List<Widget> children = [];
    friend.forEach((name, imagePath) {
      children.add(friendsImage(name, imagePath, width));
    });
    return Row(
      children: children,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }

  Column allPosts() {
    List<Widget> postToAdd = [];
    posts.forEach((element) {
      postToAdd.add(post(post: element));
    });
    return Column(
      children: postToAdd,
    );
  }

  Container post({required Post post}) {
    return Container(
      margin: EdgeInsets.only(top: 8, left: 3, right: 3),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      child: Column(
        children: [
          Row(
            children: [
              myProfilePic(2),
              Padding(padding: EdgeInsets.only(left: 8)),
              Text("Yahya Diakhite"),
              Spacer(),
              timeText(post.setTime()),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: Image.asset(
              post.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            post.decs,
            style: TextStyle(color: Colors.blueAccent),
            textAlign: TextAlign.center,
          ),
          Divider(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.favorite),
              Text(post.setLikes()),
              Icon(Icons.message),
              Text(post.setComments()),
            ],
          )
        ],
      ),
    );
  }

  Text timeText(String time) {
    return Text(
      " $time",
      style: TextStyle(color: Colors.blue),
    );
  }
}
