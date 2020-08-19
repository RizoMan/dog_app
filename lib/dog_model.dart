import 'dart:io';
import 'dart:convert';

class Dog{
  final String name;
  final String location;
  final String description;
  String imageUrl;

  int rating = 10;

  Dog(this.name, this.location, this.description);

  Future getImageUrl() async{
    //null check so our app isn't doing extra work.
    //If there's already an image, we don't need to get one.
    if(imageUrl != null){
      return;
    }

    HttpClient http = new HttpClient();

    try {
      //Use darts uri builder
      var uri = Uri.http('dog.ceo', '/api/breeds/image/random');
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();
      //The dog.ceo API returns a JSON object with a property
      //called 'message', wich actually is the URL
      var decoded = json.decode(responseBody); 
      var url = decoded['message'];
    } catch(exception){
      print(exception);
    }
  }


}