import 'dart:convert';
import 'package:fmp/models/photo.dart';
import 'package:http/http.dart' as http;

const _photosURL = "https://jsonplaceholder.typicode.com/photos?albumId=1";

class PhotosService {
  static final PhotosService _singleton = PhotosService._internal();

  PhotosService._internal();

  factory PhotosService() {
    return _singleton;
  }

  Future<List<Photo>> getPhotos() async {
    final response = await http.get(_photosURL);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<Photo> photos = body
          .map(
            (dynamic item) => Photo.fromJson(item),
          )
          .toList();

      return photos;
    } else {
      throw "Unable get photos.";
    }
  }
}
