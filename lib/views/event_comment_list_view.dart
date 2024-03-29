import 'package:flutter/material.dart';
import 'package:unifit/controllers/event_comment_controller.dart';
import 'package:unifit/models/comment.dart';
import 'package:unifit/models/event.dart';
import 'package:unifit/utils/constants.dart';
import 'package:unifit/widgets/progress_indicator.dart';

class EventCommentListView extends StatefulWidget {
  /// Display a [Comment] list of an [Event] object.
  const EventCommentListView(
      {super.key, required this.event, required this.eventCommentController});

  final Event event;
  final EventCommentController eventCommentController;

  @override
  State<EventCommentListView> createState() => _EventCommentListViewState();
}

class _EventCommentListViewState extends State<EventCommentListView> {
  late EventCommentController eventCommentController;

  void callBack() => setState(() {});

  @override
  void initState() {
    super.initState();
    eventCommentController = widget.eventCommentController;
    eventCommentController.loadEventComments();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height; // 1030.56
    return StreamBuilder<List<Comment>>(
        stream: eventCommentController.streamController,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {
            return const Center(
              child: Text(AppStrings.NO_CONNECTION),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const DefaultLoadingIndicator();
          } else if (snapshot.hasData) {
            List<Comment> comments = snapshot.data!;
            return Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                reverse: false,
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  Comment comment = comments[index];
                  return Card(
                      child: ListTile(
                          leading: InkWell(
                            onTap: () {
                              // TODO: handle button press;
                            },
                            child: Container(
                                width: screenHeight * 0.03,
                                height: screenHeight * 0.03,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey,
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    'lib/assets/layers/user/${comment.authorId.id}.jpg',
                                    width: screenHeight * 0.03,
                                  ),
                                )),
                          ),
                          title: Text(comment.content)));
                },
              ),
            );
          } else {
            return const Center(
              child: Text(AppStrings.NO_DATA_TO_LOAD),
            );
          }
        });
  }
}
