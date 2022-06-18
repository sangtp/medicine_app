import 'package:flutter/material.dart';
import 'package:medicine_app/theme.dart';

class ProfileWidget extends StatelessWidget {
  final String? imageUrl;
  final bool isEdit;
  final VoidCallback? onTap;
  const ProfileWidget(
      {Key? key, this.imageUrl, this.onTap, this.isEdit = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        buildImage(),
        Positioned(
          bottom: 0,
          right: 4,
          child: buildEditIcon(greenColor),
        ),
      ]),
    );
  }

  Widget buildImage() {
    final image = AssetImage(imageUrl!);
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(
            onTap: onTap,
          ),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: Icon(
            isEdit ? Icons.add_a_photo : Icons.edit,
            size: 20,
            color: whiteColor,
          ),
        ),
      );

  Widget buildCircle({
    required Color color,
    required double all,
    required Widget child,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
