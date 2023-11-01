import 'package:flutter/material.dart';
import 'package:unifit/utils/constants.dart';

class HomeAppBar extends StatelessWidget {
  /// AppBar for home view, containing a search bar and direct messages button.
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
    double screenHeight = MediaQuery.of(context).size.height;
    return AppBar(
        backgroundColor: AppColors.MAIN_BLUE,
        title: Row(
          children: [
            // Search text field:
            Expanded(
                child: TextField(
              focusNode: focusNode,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  suffixIcon: IconButton(
                      onPressed: () {
                        focusNode.requestFocus();
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      )),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: AppStrings.SEARCH_HINT_TEXT,
                  hintStyle: const TextStyle(color: Colors.white)),
            )),
            SizedBox(width: screenHeight * 0.01),
            // Direct messages button:
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.forum,
                color: Colors.white,
              ),
            )
            // icon: Transform.rotate(
            //   angle: -45 * (3.1415926535 / 180),
            //   child: const Icon(
            //     Icons.send,
            //     color: Colors.white,
            //   ),
            // ))
          ],
        ));
  }
}
