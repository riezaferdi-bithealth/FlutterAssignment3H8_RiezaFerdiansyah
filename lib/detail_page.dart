import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/album_control.dart';
import './api/posts_service.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: const Text("Detail Berita"),
        title: Consumer<AlbumDetailProvider>(builder: (_, cp, __) {
          return Text("Detail Page albumId: ${cp.selectedAlbum?.id}");
        }),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: const AlbumBody(),
    );
  }
}

class AlbumBody extends StatelessWidget {
  const AlbumBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<AlbumDetailProvider>(
        builder: (_, cp, __) {
          return Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                child: FutureBuilder(
                  future: getAlbumDetail(cp.selectedAlbum!.id!),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data?.length ?? 0,
                        //scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: Container(
                              color: Colors.grey,
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
                                      "Source: ${snapshot.data?[index].url! ?? '_'}",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                    leading: Container(
                                      width: 70,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                            snapshot.data?[index]
                                                    .thumbnailUrl ??
                                                '_',
                                          ),
                                        ),
                                      ),
                                    ),
                                    trailing: Text(
                                      "${snapshot.data?[index].id! ?? '_'}",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                      maxLines: 2,
                                    ),
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
          );
        },
      ),
    );
  }
}
