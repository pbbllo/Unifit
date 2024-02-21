import 'package:flutter/material.dart';
import 'package:unifit/controllers/event_comment_controller.dart';
import 'package:unifit/enums/date_format_enum.dart';
import 'package:unifit/models/event.dart';
import 'package:unifit/models/user_data.dart';
import 'package:unifit/services/auth_service.dart';
import 'package:unifit/utils/constants.dart';
import 'package:unifit/utils/extensions.dart';
import 'package:unifit/utils/logging.dart';
import 'package:unifit/utils/utils.dart';
import 'package:unifit/views/event_comment_list_view.dart';
import 'package:unifit/widgets/join_event_button.dart';
import 'package:unifit/widgets/score_card.dart';

class EventPage extends StatefulWidget {
  /// Shows the complete details of an [Event].
  const EventPage({super.key, required this.event});
  final Event event;

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final TextEditingController _commentController = TextEditingController();
  TextOverflow? textDescriptionOverflow = TextOverflow.ellipsis;
  int? textDescriptionMaxLines = 1;
  bool textDescriptionSoftWrap = false;
  bool isMoreTextCollapsed = false;
  bool isCommentTextFieldActive = false;
  bool isCommentSectionActive = false;
  final FocusNode _focusNode = FocusNode();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  IUser userData = Auth.instance.userData;

  void updateTextProperties() {
    setState(() {
      textDescriptionOverflow = null;
      textDescriptionMaxLines = null;
      textDescriptionSoftWrap = true;
      isMoreTextCollapsed = true;
    });
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      isCommentTextFieldActive = true;
      Logging.logInfo('Teclado ativado');
    } else {
      // isCommentTextFieldActive = false;
      // Use Navigator.of(context).pop para fechar o BottomSheet se estiver aberto
      // isCommentTextFieldActive = false;
      if (isCommentSectionActive) {
        setState(() {
          Navigator.of(context).pop();
          isCommentSectionActive = false;
        });
      }
      Logging.logInfo('Teclado desativado');
    }
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    EventCommentListView eventCommentListView = EventCommentListView(
      event: widget.event,
      eventCommentController: EventCommentController(widget.event),
    );

    void showCommentSection() {
      isCommentTextFieldActive = false;
      isCommentSectionActive = true;
      setState(() {});

      showModalBottomSheet(
          context: context,
          builder: (context) {
            return StatefulBuilder(
                builder: (BuildContext context, StateSetter state) {
              return SizedBox(
                width: screenWidth,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      AppStrings.COMMENTS,
                      style: TextStyle(fontSize: screenHeight * 0.02),
                    ),
                  ),
                  Visibility(
                    visible: !isCommentTextFieldActive,
                    child: eventCommentListView,
                  ),
                  Container(
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    width: screenWidth,
                    child: Row(
                      children: [
                        Container(
                            width: screenHeight * 0.05,
                            height: screenHeight * 0.05,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            child: (userData.id.isNotNull())
                                ? ClipOval(
                                    child: Image.asset(
                                      'lib/assets/layers/user/${userData.id}.jpg',
                                      width: screenHeight * 0.05,
                                    ),
                                  )
                                : const Icon(Icons.person,
                                    color: Colors.white)),
                        SizedBox(
                          width: screenWidth * 0.03,
                        ),
                        SizedBox(
                          width: screenWidth * 0.65,
                          child: TextField(
                            focusNode: _focusNode,
                            controller: _commentController,
                            textInputAction: TextInputAction.send,
                            onTap: () {},
                            onTapOutside: (value) {
                              // Tapping outside means the
                              // BottomSheet closes by itself
                              isCommentSectionActive = false;
                            },
                            onSubmitted: (value) {
                              // commentController.createEventComment(
                              //     _commentController.text,
                              //     UserController.instance
                              //         .getUserFromCurrentSession());

                              // state(() {
                              //   isCommentTextFieldActive = false;
                              // });
                              Logging.logInfo(_commentController.text);
                            },
                            decoration: InputDecoration.collapsed(
                                hintText: AppStrings.ADD_A_COMMENT,
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: screenHeight * 0.014)),
                          ),
                        ),
                        InkWell(
                            onTap: () {},
                            child: const Text(
                              AppStrings.SEND,
                              style: TextStyle(color: AppColors.MAIN_BLUE),
                            ))
                      ],
                    ),
                  )
                ]),
              );
            });
          });
    }

    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: Colors.white,
        child: Center(
          child: Container(
            height: screenHeight * 0.9,
            width: screenWidth * 0.8,
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Flexible(
                        child: Text(
                      widget.event.title,
                      style: TextStyle(
                        color: AppColors.MAIN_BLUE,
                        decoration: TextDecoration.none,
                        fontSize: screenHeight * 0.035,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                      ),
                    )),
                    Column(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: AppColors.MAIN_BLUE,
                          size: screenHeight * 0.05,
                        ),
                        Text(
                          Utils.timestampToString(
                              timestamp: widget.event.eventDate,
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
                      AppStrings.UFRPE,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: screenHeight * 0.015,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.01),
                (widget.event.eventURL.isNotNull())
                    ? SizedBox(
                        height: screenHeight / 4,
                        child: Image.network(
                          widget.event.eventURL!,
                          width: double.infinity,
                          alignment: Alignment.center,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(
                        color: AppColors.MAIN_BLUE.withOpacity(0.1),
                        height: screenHeight / 4,
                      ),
                SizedBox(height: screenHeight * 0.01),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                        onPressed: () {
                          setState(() {});
                        },
                        icon: widget.event.isLiked
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red.withOpacity(0.8),
                              )
                            : const Icon(Icons.favorite_border_outlined)),
                    IconButton(
                        onPressed: () => showCommentSection(),
                        padding: EdgeInsets.only(top: screenHeight * 0.0019),
                        icon: const Icon(Icons.message_outlined)),
                    IconButton(
                        onPressed: () {},
                        padding: EdgeInsets.only(bottom: screenHeight * 0.0048),
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
                ),
                SizedBox(height: screenHeight * 0.01),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      widget.event.description,
                      overflow: textDescriptionOverflow,
                      maxLines: textDescriptionMaxLines,
                      softWrap: textDescriptionSoftWrap,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: screenHeight * 0.014),
                    )),
                    InkWell(
                      child: isMoreTextCollapsed
                          ? const Text(
                              AppStrings.EMPTY,
                              style: TextStyle(color: Colors.grey),
                            )
                          : Text(
                              AppStrings.MORE,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: screenHeight * 0.014),
                            ),
                      onTap: () {
                        updateTextProperties();
                      },
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.01),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      //Container(),
                      InkWell(
                        child: SizedBox(
                          width: screenWidth,
                          child: Text(
                            AppStrings.SEE_ALL_COMMENTS,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: screenHeight * 0.014),
                          ),
                        ),
                        onTap: () => showCommentSection(),
                      ),
                      SizedBox(
                        height: screenHeight * 0.075,
                        child: Row(
                          children: [
                            Container(
                              width: screenHeight * 0.05,
                              height: screenHeight * 0.05,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.grey),
                              child: (userData.id.isNotNull())
                                  ? ClipOval(
                                      child: Image.asset(
                                        'lib/assets/layers/user/${userData.id}.jpg',
                                        width: screenHeight * 0.05,
                                      ),
                                    )
                                  : const Icon(Icons.person,
                                      color: Colors.white),
                            ),
                            SizedBox(
                              width: screenWidth * 0.03,
                            ),
                            InkWell(
                              child: SizedBox(
                                width: screenWidth * 0.65,
                                child: Text(
                                  AppStrings.ADD_A_COMMENT,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: screenHeight * 0.014),
                                ),
                              ),
                              onTap: () => showCommentSection(),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Row(children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: JoinEventButton(),
                  )
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
