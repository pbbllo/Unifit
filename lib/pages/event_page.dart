import 'package:flutter/material.dart';
import 'package:unifit/enums/date_format_enum.dart';
import 'package:unifit/models/event.dart';
import 'package:unifit/utils/constants.dart';
import 'package:unifit/utils/extensions.dart';
import 'package:unifit/utils/utils.dart';
import 'package:unifit/views/event_comment_list_view.dart';

class EventPage extends StatelessWidget {
  /// Shows the complete details of an [Event].
  EventPage({super.key, required this.event});
  final Event event;
  final TextEditingController _commentController = TextEditingController();

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
          height: screenHeight * 0.9,
          width: screenWidth * 0.8,
          decoration: BoxDecoration(border: Border.all(width: 1)),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Flexible(
                    child: Text(
                      event.title,
                      style: TextStyle(
                        color: AppColors.MAIN_BLUE,
                        decoration: TextDecoration.none,
                        fontSize: screenHeight * 0.035,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: AppColors.MAIN_BLUE,
                        size: screenHeight * 0.05,
                      ),
                      Text(
                        Utils.timestampToString(
                            timestamp: event.eventDate,
                            format: DateFormatEnum.ddmm),
                        style: TextStyle(
                            fontSize: screenHeight * 0.015,
                            decoration: TextDecoration.none),
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    size: screenHeight * 0.015,
                  ),
                  Text(
                    // TODO: Add the reference to the location.
                    'Localização',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.none,
                      fontSize: screenHeight * 0.015,
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
                  Flexible(
                    child: Text(
                      event.description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: AppColors.MAIN_BLUE,
                          decoration: TextDecoration.none,
                          fontSize: screenHeight * 0.014,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Roboto'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.01),
              Row(
                children: [
                  Text(
                    AppStrings.EVENT_DATE.format(
                        [Utils.timestampToString(timestamp: event.eventDate)]),
                    style: TextStyle(
                      color: AppColors.MAIN_BLUE,
                      decoration: TextDecoration.none,
                      fontSize: screenHeight * 0.02,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Comentários',
                      style: TextStyle(
                          color: AppColors.MAIN_BLUE,
                          decoration: TextDecoration.none,
                          fontSize: screenHeight * 0.02,
                          fontFamily: 'Roboto'),
                    ),
                    //Container(),
                    EventCommentListView(event: event),
                    Container(
                      child: Row(),
                      height: screenHeight * 0.075,
                      decoration: BoxDecoration(border: Border.all(width: 1)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
