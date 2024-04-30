import 'package:flutter/material.dart';

class MyCloudHelperFunction {

  static Widget? checkSingleRecordState<T>(AsyncSnapshot<T> snapshot) {
    if(snapshot.connectionState == ConnectionState.waiting) {
      return const Padding(padding: EdgeInsets.all(8), child: Center(child: CircularProgressIndicator()));
    }

    if(!snapshot.hasData || snapshot.data == null) {
      return const Center(child: Icon(Icons.person));
    }

    if(snapshot.hasError) {
      return const Center(child: Text('Something went wrong'));
    }

    return null;
  }

  static Widget? checkMultipleRecordState<T>({required AsyncSnapshot<List<T>> snapshot, Widget? loader, Widget? error, Widget? nothingFound}) {
    if(snapshot.connectionState == ConnectionState.waiting) {
      if (loader != null) return loader;
      return const Padding(padding: EdgeInsets.only(top: 50), child: Center(child: CircularProgressIndicator()));
    }

    if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
      if (nothingFound != null) return nothingFound;
      return const Padding(padding: EdgeInsets.only(top: 50), child: Center(child: Text('No Pics yet! Click on the upload button')));
    }

    if(snapshot.hasError) {
      if (error != null) return error;
      return const Center(child: Text('Something went wrong'));
    }

    return null;
  }

}