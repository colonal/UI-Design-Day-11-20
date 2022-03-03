import 'package:flutter/material.dart';

class Day19Screen extends StatefulWidget {
  const Day19Screen({Key? key}) : super(key: key);

  @override
  _Day19ScreenState createState() => _Day19ScreenState();
}

class _Day19ScreenState extends State<Day19Screen> {
  final List stories = [
    [
      "Aatik Tasneem",
      "assets/images/day19/aatik-tasneem.jpg",
      "assets/images/day19/aatik-tasneem.jpg"
    ],
    [
      "Aiony Haust",
      "assets/images/day19/aiony-haust.jpg",
      "assets/images/day19/aiony-haust.jpg"
    ],
    [
      "Averie Woodard",
      "assets/images/day19/averie-woodard.jpg",
      "assets/images/day19/averie-woodard.jpg"
    ],
    [
      "jurica Koletic",
      "assets/images/day19/jurica-koletic.jpg",
      "assets/images/day19/jurica-koletic.jpg"
    ],
  ];

  final List posts = [
    [
      "Aiony Haust",
      "assets/images/day19/aiony-haust.jpg",
      "1 hr ago",
      'All the Lorem Ipsum generators on the Internet tend to repeat predefined.',
      "assets/images/day19/aiony-haust.jpg",
      "2.5K",
      400,
      true,
    ],
    [
      'Azamat Zhanisov',
      'assets/images/day19/azamat-zhanisov.jpg',
      '3 mins ago',
      "All the Lorem Ipsum generators on the Internet tend to repeat predefined.All the Lorem Ipsum generators on the Internet tend to repeat predefined.All the Lorem Ipsum generators on the Internet tend to repeat predefined.",
      '',
      "500",
      100,
      false,
    ],
    [
      'Azamat Zhanisov',
      'assets/images/day19/azamat-zhanisov.jpg',
      '3 mins ago',
      "All the Lorem Ipsum generators on the Internet tend to repeat predefined.",
      "assets/images/day19/averie-woodard.jpg",
      "5K",
      900,
      true,
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTopBar(),
                _buildStories(),
                const SizedBox(height: 20),
                _buildPosts(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildTopBar() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  icon: const Icon(Icons.search_sharp)),
            ),
          ),
        ),
        const SizedBox(width: 30),
        const Icon(Icons.camera_alt)
      ],
    );
  }

  _buildStorie(int index) {
    return Container(
      width: 150,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
            image: AssetImage(stories[index][2]), fit: BoxFit.fill),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.6),
              Colors.black.withOpacity(0.4),
              Colors.black.withOpacity(0.2),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 21,
              child: CircleAvatar(
                radius: 19,
                backgroundImage: AssetImage(stories[index][1]),
              ),
            ),
            const Spacer(),
            Text(
              stories[0][0],
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  _buildStories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              "Stories",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Text(
              "see Archive",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 220,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: stories.length,
              shrinkWrap: true,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (BuildContext context, int index) =>
                  _buildStorie(index)),
        ),
      ],
    );
  }

  _buildPost(index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(posts[index][1]),
            ),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  posts[index][0],
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  posts[index][2],
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            const Spacer(),
            Icon(Icons.more_horiz, color: Colors.grey[900])
          ],
        ),
        const SizedBox(height: 10),
        Text(
          posts[index][3],
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 10),
        if (posts[index][4] != '')
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: AssetImage(posts[index][4]), fit: BoxFit.cover)),
          ),
        if (posts[index][4] != '') const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _makeLikeButton(
                isActive: posts[index][7], text: "${posts[index][5]}  Like"),
            _makeCommentButton("${posts[index][6]}  Comments"),
            _makeShareButton()
          ],
        )
      ],
    );
  }

  _makeLikeButton({isActive, text}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.thumb_up,
              color: isActive ? Colors.blue : Colors.grey,
              size: 18,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: TextStyle(color: isActive ? Colors.blue : Colors.grey),
            )
          ],
        ),
      ),
    );
  }

  _makeCommentButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.chat, color: Colors.grey, size: 18),
            const SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

  _makeShareButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.share, color: Colors.grey, size: 18),
            SizedBox(
              width: 5,
            ),
            Text(
              "Share",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

  _buildPosts() {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => _buildPost(index),
        separatorBuilder: (_, __) => SizedBox(
              height: 30,
              child: Center(
                child: Divider(
                  color: Colors.grey[400],
                  height: 2,
                ),
              ),
            ),
        itemCount: posts.length);
  }
}
