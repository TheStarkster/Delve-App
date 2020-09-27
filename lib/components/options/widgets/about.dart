import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:delve_app/providers/company.dart';
import 'package:delve_app/utils/repository/api/handlers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

class AboutDelve extends StatefulWidget {
  @override
  _AboutDelveState createState() => _AboutDelveState();
}

class _AboutDelveState extends State<AboutDelve> {
  dynamic html;
  File file;
  CompanyContext companyContext;
  ApiHandlers apiHandlers = new ApiHandlers();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    companyContext = Provider.of<CompanyContext>(context);
    if (companyContext.company?.desc == null) {
      apiHandlers.getCompanyDescription().then((value) {
        companyContext.setDescription(value["description"]);
      });
    }
    if (companyContext.company?.gallery == null) {
      apiHandlers.getCompanyGallery().then((value) {
        companyContext.setGallery(value);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Padding(
        padding: EdgeInsets.only(left: 29,right: 29),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            CupertinoSliverRefreshControl(),
            SliverList(
              delegate: SliverChildListDelegate([
                Center(
                  child: Container(
                    padding: EdgeInsets.all(32),
                    child: Image.asset(
                      "assets/images/banner.png",
                      width: MediaQuery.of(context).size.width / 1.4,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    "About Us",
                    style: TextStyle(
                      color: Colors.black54,
                      fontFamily: 'Raleway-Medium',
                      fontSize: 21,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 29,bottom: 29),
                  child: companyContext.company.desc == null
                      ? Column(
                    children: [CircularProgressIndicator()],
                  )
                      : companyContext.company.desc == ""
                      ? Container(
                    child: Text("No Description Available :("),
                  )
                      : Html(
                    data: companyContext.company.desc,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30,bottom: 29),
                  child: Text(
                    "Gallery",
                    style: TextStyle(
                      color: Colors.black54,
                      fontFamily: 'Raleway-Medium',
                      fontSize: 21,
                    ),
                  ),
                ),
              ]),
            ),
            companyContext.company.gallery == null
                ?
            SliverToBoxAdapter(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(23),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            )
                : companyContext.company.gallery.length == 0
                ?
            SliverToBoxAdapter(
              child: Container(
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
              ),
            )
                :
            // Container(color: Colors.green,width: 50,height: 50,)
            SliverGrid(
              gridDelegate:
              SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    color: Colors.black12,
                    child:CachedNetworkImage(
                      imageUrl: companyContext.company.gallery[index]["url"],
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
                  );
                },
                childCount: companyContext.company.gallery.length,
              ),
            )
          ],
        ),
      )
    );
  }
}
