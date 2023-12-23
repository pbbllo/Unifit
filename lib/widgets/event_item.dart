import 'package:flutter/material.dart';
import 'package:unifit/controllers/event_controller.dart';
import 'package:unifit/models/event.dart';
import 'package:unifit/services/firebase_service.dart';
import 'package:unifit/utils/constants.dart';
import 'package:unifit/widgets/score_card.dart';

class EventItem extends StatefulWidget {
  final Event event;

  const EventItem(this.event, {super.key});

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height; // 1030.56
    double screenWidth = MediaQuery.of(context).size.width; // 485.39
    double eventItemPadding = screenHeight * 0.008;
    double eventItemHeight = screenHeight * 0.32;
    return Padding(
      padding: EdgeInsets.fromLTRB(eventItemPadding, eventItemPadding / 2,
          eventItemPadding, eventItemPadding / 2),
      child: Container(
        height: eventItemHeight,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Event header
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Profile picture TODO: Insert autor profile picture;
                  InkWell(
                    onTap: () {
                      // TODO: handle button press;
                    },
                    child: Container(
                      width: screenHeight * 0.05,
                      height: screenHeight * 0.05,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.015),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Event title
                        Row(
                          children: <Widget>[
                            SizedBox(width: screenWidth * 0.012),
                            Text(widget.event.title,
                                style: TextStyle(
                                    fontSize: screenHeight * 0.019,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        // Event location
                        Row(
                          children: <Widget>[
                            const Icon(Icons.location_on),
                            Text(
                              widget.event.description,
                              style: const TextStyle(color: Colors.blue),
                            ),
                          ],
                        )
                      ]),
                  Expanded(
                    child: Container(),
                  ),
                  Column(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        color: AppColors.MAIN_BLUE,
                      ),
                      Text(widget.event.getEventDate()) // TODO: call eventDate
                    ],
                  )
                ],
              ),
              // Event picture
              Padding(
                padding: EdgeInsets.fromLTRB(
                    0, eventItemPadding, 0, eventItemPadding),
                child: Container(
                  color: AppColors.MAIN_BLUE.withOpacity(0.1),
                  height: eventItemHeight / 2,
                ),
              ),
              // Event footer
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                      onPressed: () {
                        setState(() {
                          EventController.toggleIsLiked(widget.event);
                        });
                      },
                      icon: widget.event.isLiked
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red.withOpacity(0.8),
                            )
                          : const Icon(Icons.favorite_border_outlined)),
                  IconButton(
                      onPressed: () {},
                      padding:
                          EdgeInsets.fromLTRB(0, screenHeight * 0.0019, 0, 0),
                      icon: const Icon(Icons.message_outlined)),
                  IconButton(
                      onPressed: () {},
                      padding:
                          EdgeInsets.fromLTRB(0, 0, 0, screenHeight * 0.0048),
                      icon: Transform.rotate(
                        angle: -45 * (3.1415926535 / 180),
                        child: const Icon(
                          Icons.send_outlined,
                        ),
                      )),
                  Expanded(
                    child: Container(),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                    child: ScoreCard(score: '25'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
