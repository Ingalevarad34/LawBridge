import 'package:flutter/material.dart';
import 'package:lawbridge/component/CustomBottomNavigationBar.dart';

class Postscreen extends StatelessWidget {
  final List<Map<String, dynamic>> tweets = [
    {
      'profilePic': 'assets/titus.png',
      'username': 'John',
      'handle': '@John_the_sportz',
      'time': '1h',
      'content':
          'What’s the most obscure hobby you’ve taken up in the last few months? Mine is making my own perfume. Be glad you don’t have to smell it.',
      'comments': 3,
      'retweets': 6,
      'likes': 12,
    },
    {
      'profilePic': 'assets/tim.png',
      'username': 'Jane',
      'handle': '@Jane_tee_oh',
      'time': '1h',
      'content': 'Coffee & Plants. Best way to start the day.',
      'image':
          'https://static.vecteezy.com/system/resources/thumbnails/035/305/333/small_2x/ai-generated-law-books-gavel-and-scales-symbolizing-justice-on-a-table-generative-ai-photo.jpg',
      'comments': 1,
      'retweets': 4,
      'likes': 9,
    },
    {
      'profilePic': 'assets/soul.png',
      'username': 'Michael',
      'handle': '@Michael_232',
      'time': '2h',
      'content':
          'Summer’s here and all I have planned is staying inside and reading books. Is this a dream come true?',
      'comments': 4,
      'retweets': 2,
      'likes': 8,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 243, 255),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: const Color.fromARGB(255, 213, 234, 255),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text("Law Feeds"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: tweets.length,
        itemBuilder: (context, index) {
          final tweet = tweets[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(tweet['profilePic']),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                tweet['username'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                tweet['handle'],
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                ' · ${tweet['time']}',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            tweet['content'],
                            style: const TextStyle(fontSize: 15),
                          ),
                          if (tweet['image'] != null) ...[
                            const SizedBox(height: 8),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                tweet['image'],
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.comment, color: Colors.grey),
                      onPressed: () {},
                    ),
                    Text('${tweet['comments']}'),
                    IconButton(
                      icon: const Icon(Icons.repeat, color: Colors.grey),
                      onPressed: () {},
                    ),
                    Text('${tweet['retweets']}'),
                    IconButton(
                      icon:
                          const Icon(Icons.favorite_border, color: Colors.grey),
                      onPressed: () {},
                    ),
                    Text('${tweet['likes']}'),
                    IconButton(
                      icon: const Icon(Icons.share, color: Colors.grey),
                      onPressed: () {},
                    ),
                  ],
                ),
                Divider(thickness: 1, color: Colors.grey[300]),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {},
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
