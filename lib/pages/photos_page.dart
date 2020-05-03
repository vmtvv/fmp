import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmp/models/photo.dart';
import 'package:fmp/services/photos_service.dart';

class PhotosPage extends StatelessWidget {
  PhotosPage({Key key, this.title}) : super(key: key);

  final String title;
  final httpService = PhotosService();
  List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(title),
        ),
        child: _buildPage());
  }

  Widget _buildPage() {
    return SafeArea(
      top: true,
      child: FutureBuilder(
        future: httpService.getPhotos(),
        builder: (BuildContext context, AsyncSnapshot<List<Photo>> snapshot) {
          if (snapshot.hasData) {
            photos = snapshot.data;
            return ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: photos.length,
              itemBuilder: _buildRow,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _buildRow(BuildContext context, int index) {
    final photo = photos[index];
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                image: NetworkImage(photo.thumbnailUrl),
                width: 100,
                height: 100,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    photo.title,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
