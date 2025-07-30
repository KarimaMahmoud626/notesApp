import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/widgets/color_item.dart';

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int colorIndex = 0;
  List<Color> colorsList = [
    Color(0xFFD96B6F),
    Color(0xFF9A7085),
    Color(0xFFD96B6F),
    Color(0xFF456990),
    Color(0xFF47949D),
    Color(0xFF49BEAA),
    Color(0xFF49CDAE),
    Color(0xFF49DCB1),
    Color(0xFF9CCA8D),
    Color(0xFFEEB868),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: colorsList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                colorIndex = index;
                BlocProvider.of<AddNotesCubit>(context).noteColor =
                    colorsList[index];
                setState(() {});
              },
              child: ColorItem(
                isPicked: colorIndex == index,
                itemColor: colorsList[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
