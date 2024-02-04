import 'package:flutter/material.dart';
import 'controller/album_control.dart';
import './detail_page.dart';
import './api/posts_service.dart';
import 'package:provider/provider.dart';

const List<Widget> _post = <Widget>[
  PostsBody(),
  PhotosBody(),
  UsersBody(),
]; //New

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AlbumDetailProvider(),
        )
      ],
      child: MaterialApp(
        home: Scaffold(
          body: _post.elementAt(_selectedIndex),
          //body: PostsBody(),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: 'Posts',
                icon: Icon(Icons.post_add),
              ),
              BottomNavigationBarItem(
                label: 'Photos',
                icon: Icon(Icons.image),
              ),
              BottomNavigationBarItem(
                label: 'Users',
                icon: Icon(Icons.account_circle),
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment(0, 0),
          color: Colors.blue,
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: const Text(
            "REST API_json_place holder",
            style: TextStyle(
              color: Colors.black,
              fontSize: 23,
            ),
          ),
        ),
      ],
    );
  }
}

class PostsBody extends StatelessWidget {
  const PostsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TopBar(),
            SizedBox(
              child: FutureBuilder(
                future: getPostsData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Container(
                            color: Colors.grey.shade200,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    snapshot.data?[index].title! ?? '_',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                    maxLines: 2,
                                  ),
                                  subtitle: Text(
                                    snapshot.data?[index].body! ?? '_',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                  leading: Text(
                                    "${snapshot.data?[index].id! ?? '_'}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      //fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  // trailing: Text(
                                  //   "${snapshot.data?[index].userId! ?? '_'}",
                                  //   style: const TextStyle(
                                  //     fontSize: 12,
                                  //     color: Colors.black,
                                  //   ),
                                  //   maxLines: 2,
                                  // ),
                                ),
                                Container(
                                  height: 10,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return const Text("Snapshot Error");
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UsersBody extends StatelessWidget {
  const UsersBody({super.key});

  @override
  Widget build(BuildContext context) {
    //final newsProviders = Provider.of<AlbumProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TopBar(),
            SizedBox(
              child: FutureBuilder(
                future: getProfileData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //print(snapshot.data?.length);
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Container(
                            color: Colors.grey.shade200,
                            child: Column(
                              children: [
                                Text(
                                  "${snapshot.data?[index].id! ?? '_'}",
                                  style: const TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                                Text(snapshot.data?[index].name! ?? '_'),
                                Text(snapshot.data?[index].username! ?? '_'),
                                Text(snapshot.data?[index].email! ?? '_'),
                                Text(
                                    "${snapshot.data?[index].address!.street ?? '_'}, ${snapshot.data?[index].address!.suite ?? '_'}, ${snapshot.data?[index].address!.city ?? '_'}, ${snapshot.data?[index].address!.zipcode ?? '_'} geo: ${snapshot.data?[index].address!.geo!.lat ?? '_'}, ${snapshot.data?[index].address!.geo!.lng ?? '_'}"),
                                Text(snapshot.data?[index].phone! ?? '_'),
                                Text(snapshot.data?[index].website! ?? '_'),
                                Text(
                                    "${snapshot.data?[index].company!.name ?? '_'}: ${snapshot.data?[index].company!.catchPhrase ?? '_'} (${snapshot.data?[index].company!.bs ?? '_'})"),
                                Container(
                                  height: 10,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return const Text("Snapshot Error");
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PhotosBody extends StatelessWidget {
  const PhotosBody({super.key});

  @override
  Widget build(BuildContext context) {
    final albumProviders = Provider.of<AlbumDetailProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TopBar(),
            SizedBox(
              child: FutureBuilder(
                future: getAlbumData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //print(snapshot.data?.length);
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            if (snapshot.hasData) {
                              albumProviders.selectAlbum(
                                snapshot.data![index],
                              );
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DetailPage(),
                              ),
                            );
                          },
                          child: Container(
                            color: Colors.grey.shade200,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    snapshot.data?[index].title! ?? '_',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                    maxLines: 2,
                                  ),
                                  leading: Text(
                                    "${snapshot.data?[index].id! ?? '_'}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      //fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  // trailing: Text(
                                  //   "${snapshot.data?[index].userId! ?? '_'}",
                                  //   style: const TextStyle(
                                  //     fontSize: 12,
                                  //     color: Colors.black,
                                  //   ),
                                  //   maxLines: 2,
                                  // ),
                                ),
                                Container(
                                  height: 10,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return const Text("Snapshot Error");
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
