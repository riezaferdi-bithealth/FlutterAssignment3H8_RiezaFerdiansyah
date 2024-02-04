//import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import '../models/posts_models.dart';
import '../models/profile_models.dart';
import '../models/album_models.dart';
import '../models/album_detail_model.dart';

Future<List<ListPosts>> getPostsData() async {
  try {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/'),
    );

    final list = json.decode(response.body) as List<dynamic>;
    //print(list);
    return list.map((index) => ListPosts.fromJson(index)).toList();
  } catch (error) {
    throw Exception('Failed to load album');
  }
}

Future<List<ListProfile>> getProfileData() async {
  try {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/'),
    );

    final list = json.decode(response.body) as List<dynamic>;
    //print(list);
    return list.map((index) => ListProfile.fromJson(index)).toList();
  } catch (error) {
    throw Exception('Failed to load album');
  }
}

Future<List<ListAlbum>> getAlbumData() async {
  try {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/'),
    );

    final list = json.decode(response.body) as List<dynamic>;
    //print(list);
    return list.map((index) => ListAlbum.fromJson(index)).toList();
  } catch (error) {
    throw Exception('Failed to load album');
  }
}

Future<List<ListAlbumDetail>> getAlbumDetail(int index) async {
  try {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/$index/photos'),
    );

    final list = json.decode(response.body) as List<dynamic>;
    //print(list);
    return list.map((index) => ListAlbumDetail.fromJson(index)).toList();
  } catch (error) {
    throw Exception('Failed to load album');
  }
}
