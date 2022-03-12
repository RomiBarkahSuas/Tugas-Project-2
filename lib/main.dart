import 'package:flutter/material.dart';
import 'package:tugasproject2/Color.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Montserrat",
        scaffoldBackgroundColor: kbackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: HomePage(),

    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        height: 80,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            BottomNavItem(
              title: "Today",
              svgSrc: "asset/icons/calendar.svg",
              isActive: false,
            ),
            BottomNavItem(
              title: "Settings",
              svgSrc: "asset/icons/Settings.svg",
              isActive: true,
            ),
            BottomNavItem(
              title: "Tomorrow",
              svgSrc: "asset/icons/calendar.svg",
              isActive: false,
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0XFFF5CEBB),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("asset/images/undraw_pilates_gpdb.png"),
              ),
            ),
          ),
          SafeArea(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          alignment: Alignment.center,
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                            color: Color(0XFFF2BEA1),
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset("asset/icons/menu.svg"),
                        ),
                      ),
                      Text(
                        "Good Morning \nRomi Barkah Suas",
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(fontWeight: FontWeight.w700,
                            fontFamily: 'Montserrat',
                            fontSize: 32,
                            color: Colors.black
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 30),
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(29.5)
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                fontFamily: 'Montserrat',
                                color: Colors.black38
                            ),
                            icon: SvgPicture.asset("asset/icons/search.svg"),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Expanded(
                          child: GridView.count(
                            crossAxisCount: 2,
                            childAspectRatio: .85,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            children: <Widget>[
                              CategoryCard(
                                title: "Diet Plan",
                                svgSrc: "asset/icons/Hamburger.svg",
                              ),
                              CategoryCard(
                                title: "Exercises",
                                svgSrc: "asset/icons/Excrecises.svg",
                              ),
                              CategoryCard(
                                title: "Medical Tips",
                                svgSrc: "asset/icons/Meditation.svg",
                              ),
                              CategoryCard(
                                title: "Yoga",
                                svgSrc: "asset/icons/yoga.svg",
                              ),
                            ],
                          )
                      ),
                    ],
                  )
              )
          )
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String svgSrc;
  final String title;
  final bool isActive;

  const BottomNavItem({
    Key? key,
    required this.svgSrc,
    required this.title,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SvgPicture.asset(
              svgSrc, color: isActive ? kActiveIconColor : kTextColor
          ),
          Text(
              title, style: TextStyle(
              color: isActive ? kActiveIconColor : kTextColor,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600
          )
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String svgSrc;
  final String title;

  const CategoryCard({
    Key? key,
    required this.svgSrc,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 17),
            blurRadius: 17,
            spreadRadius: -23,
            color: kShadowColor,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Spacer(),
          SvgPicture.asset(svgSrc),
          Spacer(),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontFamily: 'Montserrat',
                fontSize: 15,
                fontWeight: FontWeight.w600
            ),
          )
        ],
      ),
    );
  }
}