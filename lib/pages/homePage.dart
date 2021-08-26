import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [
    "assets/images/ic_hotel1.jpg",
    "assets/images/ic_hotel2.jpg",
    "assets/images/ic_hotel3.jpg",
    "assets/images/ic_hotel4.jpg",
    "assets/images/ic_hotel5.jpg"
  ];
  List<String> hotels = [
    "Hotel1",
    "Hotel2",
    "Hotel3",
    "Hotel4",
    "Hotel5",
  ];
  List<String> hotelTypes = [
    "Business Hotels",
    "Airport Hotels",
    "Resort Hotels",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // toolbarHeight: 200,
            expandedHeight: 200,
            elevation: 0,
            pinned: true, snap: true, floating: true,
            backgroundColor: Colors.amber,
            centerTitle: true,
            stretch: true,

            // floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Image.asset("assets/images/ic_header.jpg").image,
                      fit: BoxFit.cover),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      colors: [Colors.black38, Colors.black12],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Best Hotels Ever",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottom: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Container(
                height: 45,
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey[400],
                      ),
                      hintText: "Search for hotels ...",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return Container(
                  width: double.infinity,
                  height: 200,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${hotelTypes[index]}",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 200,
                                height: 180,
                                margin: EdgeInsets.only(right: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage("${images[index]}"),
                                      fit: BoxFit.cover),
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        colors: [
                                          Colors.black45,
                                          Colors.black12
                                        ]),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${hotels[index]}",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                );
              },
              childCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}
