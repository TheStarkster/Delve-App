import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:delve_app/main.dart';
import 'package:http/http.dart';
import 'package:delve_app/utils/repository/api/constants.dart';
import 'package:flutter_uploader/flutter_uploader.dart';
import 'package:delve_app/providers/event.dart';
import 'package:delve_app/utils/repository/api/handlers.dart';
import 'package:flutter/material.dart';
import 'package:delve_app/utils/SizeConfig.dart';
import 'package:flutter/rendering.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  ScrollController controller;
  bool fabIsVisible;
  ApiHandlers apiHandlers = new ApiHandlers();
  ApiConstants apiConstants = new ApiConstants();
  EventContext eventContext;
  final picker = ImagePicker();
  final uploader = FlutterUploader();

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    fabIsVisible = false;
    controller.addListener(() {
      setState(() {
        if (controller.position.pixels > 250) {
          fabIsVisible = true;
        } else {
          fabIsVisible = false;
        }
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    eventContext = Provider.of<EventContext>(context);
    if(eventContext.event.eventGallery == null){
      apiHandlers.getGallery(eventContext.event.id.toString())
          .then((value) => eventContext.setGalleryImages(value));
    }
  }

  void downloadImage(String url) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    await FlutterDownloader.enqueue(
      url: url,
      savedDir: appDocPath,
      showNotification: true,
      openFileFromNotification: true,
    );
  }
  void refreshList() async {
    showDialog(
      context: context,
      child: AlertDialog(
        title: Row(
          children: [
            Padding(
              child: CircularProgressIndicator(),
              padding: EdgeInsets.only(right: 14),
            ),
            Text(
              "Refreshing Gallery",
              style: TextStyle(
                color: Colors.black54,
              ),
            )
          ],
        ),
      ),
    );
    await apiHandlers.getGallery(eventContext.event.id.toString())
        .then((value) => eventContext.setGalleryImages(value));
    Navigator.pop(context);
  }

  Future pickImage() async {
    showDialog(
      context: context,
      child: AlertDialog(
        title: Row(
          children: [
            Padding(
              child: CircularProgressIndicator(),
              padding: EdgeInsets.only(right: 14),
            ),
            Text(
              "Uploading Please Wait",
              style: TextStyle(
                color: Colors.black54,
              ),
            )
          ],
        ),
      ),
    );
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 80);
    File cropped = await ImageCropper.cropImage(
      sourcePath: image.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      compressQuality: 100,
      maxWidth: 700,
      maxHeight: 700,
      compressFormat: ImageCompressFormat.png,
      androidUiSettings: AndroidUiSettings(
        toolbarColor: Theme.of(context).appBarTheme.color,
        toolbarTitle: "Crop",
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
    );

    var uri = Uri.parse(apiConstants.version1.saveImageToGallery);
    var request = MultipartRequest('POST', uri)
      ..fields['EventId'] = prefs.getString("EventId")
      ..files.add(
        await MultipartFile.fromPath(
          'image',
          cropped.path,
        ),
      );
    var response = await request.send();
    if (response.statusCode == 201) {
      Navigator.pop(context);
      eventContext.event.setSingleGalleryImage({
        "url":
        "http://162.241.120.139:5000/event_gallery/${cropped.path.split("/").last}"
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButton: AnimatedOpacity(
        child: FloatingActionButton(
          elevation: 0.0,
          isExtended: true,
          child: Icon(Icons.cloud_upload),
          tooltip: "Increment",
          onPressed:pickImage,
        ),
        duration: Duration(milliseconds: 100),
        opacity: fabIsVisible ? 1 : 0,
      ),
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.black,
            ),
            onPressed: refreshList,
          ),
        ],
        centerTitle: true,
        title: Text(
          "Gallery",
          style: TextStyle(
            fontSize: 21,
            fontFamily: 'Raleway-Regular',
            color: Colors.black,
          ),
        )
      ),
      body: ListView(
        controller: controller,
        padding: EdgeInsets.all(29),
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(52),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                InkWell(
                  onTap: pickImage,
                  child: Icon(
                    Icons.cloud_upload,
                    size: MediaQuery.of(context).size.width / 6,
                    color: Colors.black45,
                  ),
                ),
                Text(
                  "Upload Image",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway-Medium',
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Click on Cloud icon to Upload You Own Image of the Event",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Raleway-Regular',
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 18, top: 18),
            child: Text(
              "All Images",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15,
                fontFamily: 'Raleway-Regular',
              ),
            ),
          ),
          eventContext.event.eventGallery == null
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(23),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  ),
                )
              : eventContext.event.eventGallery.length == 0
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(23),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "No Images Available for now :(",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                              fontFamily: 'Raleway-Regular',
                            ),
                          ),
                        ],
                      ),
                    )
                  : GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      children: eventContext.event.eventGallery.map((image) {
                        return Padding(
                          padding: EdgeInsets.all(2),
                          child: Container(
                              color: Colors.black12,
                              child:CachedNetworkImage(
                                imageUrl: image["url"],
                                imageBuilder: (context, imageProvider) => Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white60,
                                            ),
                                            child: IconButton(
                                              icon: Icon(Icons.file_download),
                                              onPressed: () => downloadImage(image["url"]),
                                            ),
                                            margin: EdgeInsets.all(12),
                                          ),
                                        ],
                                        mainAxisAlignment: MainAxisAlignment.end,
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: imageProvider, fit: BoxFit.cover),
                                  ),
                                ),
                                placeholder: (context, url) => Container(
                                  child: Center(
                                    child: Text(
                                        "Loading..."
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  child: Center(
                                    child: Text(
                                      "Error in Loading"
                                    ),
                                  ),
                                ),
                              ),
                          ),
                        );
                      }).toList()
                    )
        ],
      ),
    );
  }
}
