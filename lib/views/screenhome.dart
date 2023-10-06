import 'package:flutter/material.dart';
import 'package:shanee/views/reusablewidgets/postsection.dart';
import 'package:shanee/views/reusablewidgets/story.dart';

class ScreenHome extends StatefulWidget {
  ScreenHome({Key? key}) : super(key: key);

  @override
  _ScreenHomeState createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 28, 27, 32),
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 28, 27, 32),
                  ),
                  width: double.infinity,
                  height: 200,
                ),
                ClipPath(
                  clipper: TopCurveClipper(),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    color: Colors.blue,
                  ),
                ),
                Positioned(
                  left: (MediaQuery.of(context).size.width - 150) / 2,
                  top: 20,
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/profileimage.jpg'),
                    radius: 75,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: double.infinity,
              height: 65,
              child: Column(
                children: [
                  Text(
                    'SHANE MATHIAS',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                  ),
                  Text(
                    'co-founder',
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15),
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 110,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  StoryCircle(
                    imagePath: 'assets/profileimage.jpg',
                    text: 'cat',
                  ),
                  StoryCircle(
                    imagePath: 'assets/profileimage.jpg',
                    text: 'cat',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Postsection(count: '2', label: 'post'),
                    Container(
                      color: Colors.black,
                      width: 1.5,
                      height: 53,
                    ),
                    const Postsection(count: '1', label: 'Followers'),
                    Container(
                      color: Colors.black,
                      width: 1.5,
                      height: 53,
                    ),
                    const Postsection(count: '2', label: 'Following'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TabBar(
              unselectedLabelColor: Colors.grey[500],
              labelColor: Colors.white,
              indicatorColor: Colors.blue,
              tabs: const [
                Tab(
                  child: Text(
                    'posts',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Tab(
                  child: Text(
                    'Stamp Book',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Tab(
                  child: Text(
                    'Commununity',
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.label,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing:
                          16.0, // Add spacing between grid items horizontally
                      mainAxisSpacing:
                          16.0, // Add spacing between grid items vertically
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      // Create grid items with different colors
                      return Container(
                        // color: index % 2 == 0 ? Colors.red : Colors.blue,
                        child: index % 2 == 0
                            ? Image.asset('assets/profileimage.jpg')
                            : Image.asset('assets/profileimage.jpg'),
                      );
                    },
                  ),
                  const Center(child: Text('Person')),
                  const Center(child: Text('tag')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height); // Start at the bottom-left corner
    path.quadraticBezierTo(
        size.width / 2, size.height - 46, size.width, size.height);
    path.lineTo(size.width, 0); // Finish at the bottom-right corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
