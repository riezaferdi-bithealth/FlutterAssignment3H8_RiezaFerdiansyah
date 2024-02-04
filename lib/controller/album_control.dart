import '../models/album_models.dart';
import 'package:flutter/material.dart';

class AlbumDetailProvider extends ChangeNotifier {
  // Stream and Sink Process di sini !!!
  ListAlbum? selectedAlbum;

  void selectAlbum(ListAlbum data) {
    selectedAlbum = data;
    notifyListeners();
  }
}
