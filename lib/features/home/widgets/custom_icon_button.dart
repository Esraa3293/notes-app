import 'package:flutter/material.dart';
import 'package:notes_app/core/colors_manager.dart';
import 'package:notes_app/features/home/models/icon_button_model.dart';

class CustomIconButton extends StatelessWidget {
  final IconButtonModel iconButtonModel;

  const CustomIconButton({super.key, required this.iconButtonModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: ColorsManager.onPrimaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: IconButton(
        onPressed: iconButtonModel.onPressed,
        icon: Icon(iconButtonModel.icon, color: Colors.white),
      ),
    );
  }
}
