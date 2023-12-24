import 'package:flutter/material.dart';
import 'package:unifit/models/event.dart';
import 'package:unifit/utils/constants.dart';
import 'package:unifit/utils/utils.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key, required this.event});
  final Event event;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      height: screenHeight,
      color: Colors.white,
      child: Center(
        child: Container(
          height: screenHeight * 0.8,
          width: screenWidth * 0.8,
          decoration: BoxDecoration(border: Border.all(width: 1)),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Text(
                    event.title,
                    style: TextStyle(
                      color: AppColors.MAIN_BLUE,
                      decoration: TextDecoration.none,
                      fontSize: screenHeight * 0.05,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: 1.2,
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  const Icon(Icons.location_on),
                  Text(
                    event.description,
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.none,
                      fontSize: screenHeight * 0.02,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.01),
              Container(
                color: AppColors.MAIN_BLUE.withOpacity(0.1),
                height: screenHeight / 4,
              ),
              SizedBox(height: screenHeight * 0.01),
              Row(
                children: [
                  Text(
                    event.description,
                    style: TextStyle(
                      color: AppColors.MAIN_BLUE,
                      decoration: TextDecoration.none,
                      fontSize: screenHeight * 0.02,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.01),
              Row(
                children: [
                  Text(
                    'Data do Evento: ${Utils.timestampToString(timestamp: event.eventDate)}',
                    style: TextStyle(
                      color: AppColors.MAIN_BLUE,
                      decoration: TextDecoration.none,
                      fontSize: screenHeight * 0.02,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
