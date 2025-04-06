import 'package:flutter/material.dart';

class CircleAvatarPage extends StatelessWidget {
  const CircleAvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Circle Avatar'),
      ),
      body: const Row(
        children: [
          // ignore: sized_box_for_whitespace
          // Container(
          //   width: 100,
          //   height: 100,
          //   child: const CircleAvatar(
          //     backgroundImage: NetworkImage(
          //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdCDz7A5Mq4ZtVagBg06KQ6eotAzziDJRsVg&s'),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ImageAvatar(
              urlImage:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdCDz7A5Mq4ZtVagBg06KQ6eotAzziDJRsVg&s',
            ),
          ),
          ImageAvatar(
            urlImage:
                'https://i.pinimg.com/736x/cf/c8/01/cfc80109568e0c89147c0e9591df1c85.jpg',
          )
        ],
      ),
    );
  }
}

class ImageAvatar extends StatelessWidget {
  final String urlImage;
  const ImageAvatar({super.key, required this.urlImage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Colors.red,
              Colors.black,
            ], begin: Alignment.topCenter),
            color: Colors.red,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        Container(
          height: 100,
          width: 100,
          padding: const EdgeInsets.all(5),
          child: CircleAvatar(
            backgroundImage: NetworkImage(urlImage),
            radius: 50,
          ),
        ),
        Container(
          height: 100,
          width: 100,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                'AO VIVO',
                style: TextStyle(fontSize: 8),
              ),
            ),
          ),
        )
      ],
    );
  }
}

// Usage in Scaffold:
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Circle Avatar'),
    ),
    body: const Column(
      children: [
        ImageAvatar(
            urlImage:
                'https://i.pinimg.com/736x/cf/c8/01/cfc80109568e0e89147c0e9591df1c85.jpg'),
      ],
    ),
  );
}
