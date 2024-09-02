import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp(appTitle: "Burger Queen",));
}

class MyApp extends StatelessWidget {
  final String appTitle;
  const MyApp({super.key, required this.appTitle});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  final TextStyle titleStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Colors.brown
  );

  @override
  Widget build(BuildContext context) {
  //   TODO: implement build
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          leading: const Icon(Icons.token, color: Colors.black,),
          title: Text(title),
          centerTitle: true,
          actions: const [Icon(Icons.account_circle)],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /* Section Mon restaurant le plus proche */

            Container(
              color: Theme.of(context).colorScheme.inversePrimary,
              height: 150,
              child: Center(
                child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.location_on),
                            const Text(
                              "Mon restaurant le plus proche",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Text(
                              "4km",
                            style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.pink
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.touch_app, color: Colors.white),
                              SizedBox(width: 16,),
                              Text(
                                "Commander !",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ),

            /* Section En ce moment */
            
            sectionTitle(title: "En ce moment"),
            Center(
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 10,
                child: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/layer-burger.jpg"),
                      fit: BoxFit.cover
                    )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Une petite faim ?",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "Venez personnaliser votre Burger",
                        style: TextStyle(
                          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /* Section Burgers */

            sectionTitle(title: "Chaud devant !"),
            const Text("Le meilleur de nos burgers à portée de clic !"),
            SizedBox(
              height: 250,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      burgerCard(name: "Twins", imageUrl: "twins", description: "Le burger des jumeaux qui font la paire"),
                      burgerCard(name: "Big Queen", imageUrl: "big-queen", description: "Pour celles qui portent la couronne à la maison"),
                      burgerCard(name: "Egg Bacon", imageUrl: "egg-bacon-burger", description: "Le burger des lève tôt"),
                      burgerCard(name: "Prince", imageUrl: "prince", description: "le préféré du roi"),
                      burgerCard(name: "Cheese", imageUrl: "cheese", description: "Le classique pour les fans de fromage"),
                    ],
                  ),
                ),
            ),

            /* Section Accompagnements */

            sectionTitle(title: "Les accompagnements"),
            Card(
              elevation: 8,
              child: Column(
                children: [
                  sideDish(name: "Frites classiques", imageUrl: "fries"),
                  sideDish(name: "Frites de patate douce", imageUrl: "patate-douce"),
                  sideDish(name: "Poutine", imageUrl: "poutine"),
                  sideDish(name: "Potatoes", imageUrl: "potatoes"),
                ],
              ),
            ),

            /* Section Boissons */

            sectionTitle(title: "Une petite soif ?"),
            Container(
              color: Theme.of(context).colorScheme.inversePrimary,
              height: 250,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    drink(name: "Le classique", imageUrl: "classic-cola"),
                    drink(name: "Eau gazeuse", imageUrl: "sparkling"),
                    drink(name: "A l'orange", imageUrl: "orange-soda"),
                    drink(name: "Goût fraise", imageUrl: "strawberry-soda"),
                  ],
                ),
              ),
            ),

            /* Section Desserts */

            sectionTitle(title: "Pour finir une petite touche sucrée"),
            Wrap(
              alignment: WrapAlignment.spaceAround,
              children: [
                douceur(name: "Glace Oreo", imageUrl: "oreo-ice", size: MediaQuery.of(context).size.width * 0.4, context: context),
                douceur(name: "Crêpe à la fraise", imageUrl: "strawberry-waffle", size: MediaQuery.of(context).size.width * 0.4, context: context),
                douceur(name: "Donut", imageUrl: "donut", size: MediaQuery.of(context).size.width * 0.4, context: context),
                douceur(name: "Cup Cake", imageUrl: "cupcake", size: MediaQuery.of(context).size.width * 0.4, context: context),
                douceur(name: "Brownie", imageUrl: "brownie", size: MediaQuery.of(context).size.width * 0.4, context: context),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: sectionTitle(title: "Et bon appétit bien sûr !"),
                    ),
                  )
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget sectionTitle({required String title}) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
        top: 8,
      ),
      child: Text(
        title,
        style: titleStyle,
      ),
    );
  }

  Container burgerCard({required String name, required String imageUrl, required String description}) {
    const double size = 250;

    TextStyle descriptionStyle = const TextStyle(
      fontStyle: FontStyle.italic,
      color: Colors.black54,
    );

    return Container(
      margin: const EdgeInsets.all(12),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.pinkAccent.withOpacity(0.3),
      ),
      height: size,
      width: size,
      child: Column(
        children: [
          Image.asset(
            "assets/images/$imageUrl.jpg",
            height: size * 0.6,
            width: size,
            fit: BoxFit.cover,
          ),
          Text(name, style: titleStyle),
          Text(description, style: descriptionStyle, textAlign: TextAlign.center,),
        ],
      ),
    );
  }

  Container sideDish({required String name, required String imageUrl}) {
    return Container(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage("assets/images/$imageUrl.jpg"),
                ),
                Text(
                  name,
                  style: const TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                )
              ],
            ),
            const Divider(
              indent: 8,
              endIndent: 8,
            )
          ],
        )

    );
  }

  Container drink({required String name, required String imageUrl}) {
    const double height = 250;
    const double width = 125;
    return Container(
      margin: const EdgeInsets.all(8),
      height: height,
      width: width,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset("assets/images/$imageUrl.jpg", fit: BoxFit.cover, height: height,),
          Text(
            name,
            style: const TextStyle(
              color: Colors.pink,
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          )
        ]

      ),
    );
  }

  Container douceur({required String name, required String imageUrl, required double size, required BuildContext context}) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  "assets/images/$imageUrl.jpg"
              ),
              fit: BoxFit.cover
          ),
          borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(8),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inversePrimary,
            borderRadius: BorderRadius.circular(6),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
          ),
        ),
      ),
    );
  }

}

