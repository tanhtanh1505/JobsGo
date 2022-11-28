import 'package:flutter/material.dart';
import 'package:jobsgo/models/conversation/conversation.dart';
import 'package:jobsgo/models/job/job.dart';
import 'package:jobsgo/screens/Message/component/chat_area.dart';
import 'package:jobsgo/services/chat_service.dart';
import 'package:jobsgo/services/job_service.dart';
import 'package:jobsgo/themes/styles.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FooterJobDetail extends StatefulWidget {
  const FooterJobDetail({super.key, required this.job});
  final Job job;
  @override
  State<FooterJobDetail> createState() => _FooterJobDetailState();
}

class _FooterJobDetailState extends State<FooterJobDetail> {
  bool isMarked = false;
  late ConversationModel conversationModel;
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    ConversationModel? conversationModelTemp =
        await ChatService.getConversationWith(widget.job.author);
    setState(() {
      conversationModel = conversationModelTemp;
      isMarked = widget.job.bookmark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 10),
      child: Row(
        children: [
          saveBtn(),
          contactBtn(),
          applyBtn(),
        ],
      ),
    );
  }

  Widget saveBtn() {
    return Expanded(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        height: 44,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: isMarked
              ? IconButton(
                  onPressed: () async {
                    var res = await JobService().unmarkJob(widget.job.id);
                    if (res) {
                      setState(() {
                        Fluttertoast.showToast(
                            msg: "Unmarked this job!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green.shade500,
                            textColor: AppColor.white,
                            fontSize: 15.0);
                        isMarked = false;
                      });
                    }
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: AppColor.red,
                  ),
                )
              : IconButton(
                  onPressed: () async {
                    var res = await JobService().markJob(widget.job.id);

                    if (res) {
                      setState(() {
                        Fluttertoast.showToast(
                            msg: "Marked this job!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green.shade500,
                            textColor: AppColor.white,
                            fontSize: 15.0);
                        isMarked = true;
                      });
                    }
                  },
                  icon: Icon(
                    Icons.favorite_outline,
                    color: AppColor.gray,
                  ),
                ),
        ),
      ),
    );
  }

  Widget contactBtn() {
    return Expanded(
      flex: 1,
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatArea(
                    conversation: conversationModel,
                    textSend:
                        "Hi, I'm interested in your job ${widget.job.title}!"),
              ),
            ),
            icon: Icon(
              Icons.messenger_outline,
              color: AppColor.gray,
            ),
          ),
        ),
      ),
    );
  }

  Widget applyBtn() {
    return Expanded(
      flex: 3,
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        height: 44,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Apply",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: AppColor.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
