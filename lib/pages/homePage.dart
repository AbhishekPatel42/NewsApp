import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:tajakhabar/GoogleMap/googleMap.dart';
import 'package:tajakhabar/Models/viewHeadlineModel.dart';
import 'package:tajakhabar/pages/DetailPages.dart';
import '../DroverPage.dart';
import '../Models/headlinesModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //NewsViewModel newsViewModel = NewsViewModel();
  final formate = DateFormat('MMMM dd, yyyy');
  int isSelected = 0;
  String selectedName = "india";
  final items = [' india ', ' usa ', ' usa ', ' china ', ' russia '];

  final ScrollController _scrollController = ScrollController();

  void scrollToIndex(int index) {
    double itemWidth = MediaQuery.of(context).size.width *
        0.2; // Adjust based on your item width
    double offset = index * itemWidth;

    _scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 500), // Adjust duration as needed
      curve: Curves.easeInOut,
    );
  }

  Future<void> _onRefresh() async {
    // Simulate a network request or data fetch
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      // Add a new item or refresh your data
     // items.insert(0, 'New Item ${items.length}');
    });
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      key: _key, // Assign the key to Scaffold.
      drawer: DrawerPage(),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //         context, MaterialPageRoute(builder: (context) => MapExample()));
      //   },
      //   child: Icon(
      //     Icons.location_on,
      //     color: Colors.red,
      //   ),
      // ),
      appBar: AppBar(
        leading: GestureDetector(
         onTap: () => _key.currentState!.openDrawer(),

          // onTap: () {
          //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Scaffold.of(context).openDrawer()));
          // },
          child: Image.asset(
            "assets/dashboard.png",
            scale: 3,
            color: Colors.teal,
          ),
        ),
        title: Center(
          child: Text(
            "News App ",
            style: TextStyle(color: Colors.teal),
          ),
        ),
        actions: [Icon(Icons.add,size: 45,color: Colors.transparent,)],
      ),

      body: SingleChildScrollView(
        child: CustomMaterialIndicator(
          indicatorBuilder: (context, controller) {
            return const Padding(
              padding: EdgeInsets.all(11.0),
              child: CircularProgressIndicator(
                color: Colors.teal,
                // value: controller.state.isLoading ? null : math.min(controller.value, 1.0),
              ),
            );
          },
          onRefresh: _onRefresh,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Horizontal scrolling list for categories
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    items.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedName = items[index];
                              isSelected = index;
                              scrollToIndex(
                                  index); // Scroll to the selected index
                            });
                          },
                          child: Container(
                            height: height * .050,
                            width: width*.2,
                            child: Center(
                              child: Text(
                                items[index],
                                style: TextStyle(
                                  fontSize: 13,
                                  color: isSelected == index
                                      ? Colors.teal
                                      : Colors.grey,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  color: isSelected == index
                                      ? Colors.teal
                                      : Colors.grey),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Top Headlines",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: Colors.teal),
                ),
              ),
              SizedBox(height: height * .010),
              Container(
                height: 400,
                child: Expanded(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: height * .50,
                        width: width,
                        child: FutureBuilder<HeadlinesModel>(
                          future: NewsViewModel.getHeadlines(selectedName),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              if (snapshot.data == null) {
                                return Center(
                                  child:
                                      SpinKitCircle(size: 50, color: Colors.teal),
                                );
                              }
                              return Center(
                                child:
                                    SpinKitCircle(size: 50, color: Colors.teal),
                              );
                            } else {
                              debugPrint('asf${snapshot}');
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                controller: _scrollController,
                                itemCount: snapshot.data?.articles?.length,
                                itemBuilder: (context, index) {
                                  DateTime datetime = snapshot.data == null
                                      ? DateTime.now()
                                      : DateTime.parse(snapshot
                                          .data!.articles![index].publishedAt
                                          .toString());
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPages(img: snapshot.data?.articles?[index].urlToImage, title: snapshot.data?.articles?[index].title, subtle: snapshot.data?.articles?[index].description)));
                                    },
                                    child: Container(
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            height: height * 0.6,
                                            width: width * 0.8,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: CachedNetworkImage(
                                                imageUrl: snapshot.data == null
                                                    ? ""
                                                    : snapshot.data!
                                                        .articles![index].urlToImage
                                                        .toString(),
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) =>
                                                    spinkit,
                                                errorWidget: (i, c, w) {
                                                  return Image.network(
                                                    "https://st4.depositphotos.com/14953852/24787/v/450/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg",
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 12,
                                            child: Card(
                                              elevation: 2,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12)),
                                              child: Container(
                                                height: height * .11,
                                                width: width * .70,
                                                alignment: Alignment.bottomLeft,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                          horizontal: 8.0,
                                                          vertical: 1),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        snapshot.data == null
                                                            ? ""
                                                            : snapshot
                                                                .data!
                                                                .articles![index]
                                                                .title
                                                                .toString(),
                                                        maxLines: 2,
                                                        overflow:
                                                            TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold),
                                                      ),
                                                      SizedBox(
                                                          height: height * .02),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            snapshot.data == null
                                                                ? "No data"
                                                                : snapshot
                                                                    .data!
                                                                    .articles![
                                                                        index]
                                                                    .source!
                                                                    .name
                                                                    .toString(),
                                                            maxLines: 1,
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            style: TextStyle(
                                                                fontSize: 12),
                                                          ),
                                                          Text(
                                                            formate
                                                                .format(datetime),
                                                            maxLines: 1,
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            style: TextStyle(
                                                                fontSize: 12),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Top Leaders",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: Colors.teal),
                ),
              ),
              TopLiders(),
            ],
          ),
        ),
      ),
    );
  }
}

const spinkit = SpinKitCircle(
  color: Colors.teal,
  size: 50,
);

class TopLiders extends StatefulWidget {
  const TopLiders({super.key});

  @override
  State<TopLiders> createState() => _TopLidersState();
}

class _TopLidersState extends State<TopLiders> {
  final items = [' PM Modi ', ' Joe Biden ', ' putin ', 'Jinping', ' suk '];
  //NewsViewTopLiders newsViewLiders = NewsViewTopLiders('PM Modi');
  final format = DateFormat('MMMM dd, yyyy');
  int isSelected = 0;
  String selectedName = "PM Modi";

  final ScrollController _scrollController = ScrollController();

  void scrollToIndex(int index) {
    double itemWidth = MediaQuery.of(context).size.width *
        0.8; // Adjust based on your item width
    double offset = index * itemWidth;

    _scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 50), // Adjust duration as needed
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              items.length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedName = items[index].trim();
                        isSelected = index;
                      });
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        scrollToIndex(index);
                      });
                    },
                    child: Container(
                      height: height * .050,
                      width: width*.2,
                      child: Center(
                        child: Text(
                          items[index],
                          style: TextStyle(
                            fontSize: 13,
                            color: isSelected == index
                                ? Colors.teal
                                : Colors.grey,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: isSelected == index
                                ? Colors.teal
                                : Colors.grey),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Container(
          //height: 00,
          width: width,
          child: FutureBuilder(
            future: NewsViewTopLiders.getLiders(selectedName),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: SpinKitCircle(size: 50, color: Colors.teal),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData ||
                  snapshot.data!.articles == null ||
                  snapshot.data!.articles!.isEmpty) {
                return Center(child: Text('No data available.'));
              } else {
                return Expanded(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(), // Disable inner scrolling
                    shrinkWrap: true,
                    itemCount: snapshot.data!.articles!.length,
                    itemBuilder: (context, index) {
                      DateTime datetime = DateTime.parse(snapshot
                          .data!.articles![index].publishedAt
                          .toString());
                      return GestureDetector(
                       onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPages(title: snapshot.data?.articles?[index].title, subtle: snapshot.data?.articles?[index].description ,img: snapshot.data?.articles?[index].urlToImage,)));
                       },
                        child: Card(
                          elevation: 2,
                          child: Container(
                            height: height * .15,
                            width: width * .55,
                            child: Row(
                              children: [
                                Container(
                                  height: height * 0.2,
                                  width: width * 0.5,
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: CachedNetworkImage(
                                      imageUrl: snapshot.data!.articles![index]
                                              .urlToImage ??
                                          "No Data".toString(),
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          SpinKitCircle(
                                              size: 50, color: Colors.teal),
                                      errorWidget: (context, url, error) {
                                        return Image.network(
                                          "https://st4.depositphotos.com/14953852/24787/v/450/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg",
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data!.articles![index].title
                                              .toString(),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: height * .02),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                snapshot.data!.articles![index]
                                                    .source!.name
                                                    .toString(),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ),
                                            Text(
                                              format.format(datetime),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
