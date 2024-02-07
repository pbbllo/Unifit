import 'package:flutter/material.dart';
import 'package:unifit/controllers/event_controller.dart';
import 'package:unifit/utils/logging.dart';
import 'package:unifit/models/event.dart';
import 'package:unifit/utils/constants.dart';
import 'package:unifit/widgets/event_item.dart';
import 'package:unifit/widgets/progress_indicator.dart';

class EventListView extends StatefulWidget {
  /// Displays a list of [Event] objects.
  const EventListView({super.key});

  @override
  State<EventListView> createState() => _EventListViewState();
}

class _EventListViewState extends State<EventListView> {
  EventController eventController = EventController();

  void callBack() => setState(() {});

  getEvents() async {
    if (!eventController.hasMore) {
      Logging.logInfo('No more documents.');
      return;
    }

    if (eventController.isLoading) {
      return;
    }

    setState(() {
      eventController.isLoading = true;
    });

    eventController.loadEvents();

    setState(() {
      eventController.isLoading = false;
    });
  }

  void scrollHeightResolver() {
    double maxScroll =
        eventController.scrollController.position.maxScrollExtent;
    double currentScroll = eventController.scrollController.position.pixels;
    double delta = MediaQuery.of(context).size.height * 0.20;
    if (maxScroll - currentScroll <= delta) {
      getEvents();
    }
  }

  @override
  void initState() {
    super.initState();
    getEvents();
    eventController.scrollController.addListener(() => scrollHeightResolver());
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: eventController.streamController,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {
            return const Center(
              child: Text(AppStrings.NO_CONNECTION),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const DefaultLoadingIndicator();
          } else if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData && snapshot.data.length > 0) {
              return ListView.builder(
                  shrinkWrap: true,
                  reverse: false,
                  itemCount: snapshot.data.length,
                  controller: eventController.scrollController,
                  itemBuilder: (_, index) {
                    Event currentEvent =
                        Event.fromDocumentSnapshot(snapshot.data[index]);
                    return EventItem(currentEvent);
                  });
            } else {
              return const Center(
                child: Text(AppStrings.NO_DATA_TO_LOAD),
              );
            }
          } else {
            return const Text(AppStrings.UNKNOWN_PROBLEM);
          }
        });
  }
}
