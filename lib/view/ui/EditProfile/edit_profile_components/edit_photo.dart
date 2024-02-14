import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditPhotoPage extends StatefulWidget {
  final XFile? image;

  const EditPhotoPage({super.key, @required this.image});

  @override
  EditPhotoPageState createState() => EditPhotoPageState();
}

class EditPhotoPageState extends State<EditPhotoPage> {
  XFile? imageFile;

  @override
  void initState() {
    super.initState();
    imageFile = widget.image;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
