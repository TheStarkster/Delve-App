import 'package:cached_network_image/cached_network_image.dart';
import 'package:delve_app/providers/event.dart';
import 'package:delve_app/providers/user.dart';
import 'package:flutter/material.dart';
import 'package:delve_app/utils/SizeConfig.dart';
import 'package:provider/provider.dart';

class AboutCity extends StatefulWidget {
  @override
  _AboutCityState createState() => _AboutCityState();
}

class _AboutCityState extends State<AboutCity> {
  UserContext userContext;
  EventContext eventContext;
  Map<String, dynamic> location;
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userContext = Provider.of<UserContext>(context);
    eventContext = Provider.of<EventContext>(context);
    location = eventContext.event.location;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: SizeConfig.blockSizeVertical * 46,
                child:CachedNetworkImage(
                  imageUrl: location["Cities"]["image"],
                  imageBuilder: (context, imageProvider) => Container(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            location["Cities"]["name"],
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 48,
                              fontFamily: 'Raleway-Bold',
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                color: Colors.white,
                              ),
                              Text(
                                location["Countries"]["name"],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontFamily: 'Raleway-Medium',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 14,
                          offset: Offset(4, 8),
                        ),
                      ],
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Container(
                    width: MediaQuery.of(context).size.width,
                    height: 180,
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                          Color(0xFF080F2F),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 12,
                      offset: Offset(0, 12),
                    ),
                  ],
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),

              ),
              Container(
                width: SizeConfig.blockSizeHorizontal * 100,
                padding: EdgeInsets.only(left: 12, right: 12, top: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(location["Cities"]["CityAttractions"].length, (index){
                    return Padding(
                      padding: EdgeInsets.only(left: 8, right: 8, bottom: 24),
                      child: Container(
                        width: SizeConfig.blockSizeHorizontal * 68,
                        height: SizeConfig.blockSizeVertical * 34,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          color: Color(0xFFEAEAEA),
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Align(
                                alignment: const Alignment(-0.92, 0.0),
                                child: SizedBox(
                                  width: 0.0,
                                  height: 0.0,
                                  child: OverflowBox(
                                    maxWidth:SizeConfig.blockSizeHorizontal * 42,
                                    maxHeight: SizeConfig.blockSizeVertical * 30,
                                    child: CachedNetworkImage(
                                    imageUrl: location["Cities"]["CityAttractions"][index]["image"],
                                    imageBuilder: (context, imageProvider) => Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black38,
                                              blurRadius: 14,
                                              offset: Offset(4, 8),
                                            ),
                                          ],
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) => Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 180,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          valueColor: new AlwaysStoppedAnimation<Color>(
                                            Color(0xFF080F2F),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 24, left: 12, right: 12, bottom: 12),
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 12),
                                        child: Text(
                                          location["Cities"]["CityAttractions"][index]["name"],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Raleway-Medium',
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        location["Cities"]["CityAttractions"][index]["desc"],
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontFamily: 'Raleway-Regular',
                                          fontSize: 15,
                                        ),
                                        softWrap: true,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
