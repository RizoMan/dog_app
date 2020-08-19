import 'package:flutter/material.dart';
import 'dog_model.dart';

class DogCard extends StatefulWidget {
  final Dog dog;

  DogCard(this.dog);

  @override
  DogCardState createState() {
    return new DogCardState(dog);
  }
}

class DogCardState extends State<DogCard> {
  Dog dog;
  String renderUrl;

  DogCardState(this.dog);

  void initState() {
    super.initState();
    renderDogPic();
  }

  void renderDogPic() async {
    await dog.getImageUrl();

    if (mounted) {
      setState(() {
        renderUrl = dog.imageUrl;
      });
    }
  }

  Widget get dogImage {
    var dogAvatar = new Hero(
      tag: dog,
      child: new Container(
        // You can explicitly set heights and widths on Containers.
        // Otherwise they take up as much space as their children.
        width: 100.0,
        height: 100.0,
        // Decoration is a property that lets you style the container.
        // It expects a BoxDecoration.
        decoration: new BoxDecoration(
            // BoxDecorations have many possible properties.
            // Using BoxShape with a background image is the
            // easiest way to make a circle cropped avatar style image.
            shape: BoxShape.circle,
            image: DecorationImage(
                // Just like CSS's `imagesize` property.
                fit: BoxFit.cover,
                // A NetworkImage widget is a widget that
                // takes a URL to an image.
                // ImageProviders (such as NetworkImage) are ideal
                // when your image needs to be loaded or can change.
                // Use the null check to avoid an error.
                image: new NetworkImage(renderUrl ?? ''))),
      ),
    );
  }

  Widget get dogCard{
    return new Positioned(
      right: 0.0,
      child: new Container(
        width: 299.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115.0,
      //A stack takes children, with a list of widgets
      child: Stack(
        children: <Widget>[
          Positioned(
            child: dogImage,
          )
        ],
      ),
    );
  }
}
