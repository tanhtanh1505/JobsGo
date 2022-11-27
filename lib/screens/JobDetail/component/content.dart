import 'package:flutter/material.dart';
import 'package:jobsgo/component/button_image.dart';
import 'package:jobsgo/helper/color_helper.dart';
import 'package:jobsgo/models/job/job.dart';
import 'package:jobsgo/screens/Employer/employer.dart';
import 'package:jobsgo/themes/styles.dart';

Widget temp = const Text("temp");

class Content extends StatefulWidget {
  const Content({super.key, required this.job});
  final Job job;

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  bool isDescription = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: ButtonImage(
                urlImage: widget.job.authorAvatar,
                isNetWorkImage: true,
                isStaticImage: false,
                width: 65,
                height: 65,
                goto: Employer(
                  id: widget.job.author,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.job.authorName,
                    style: TextStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    widget.job.title,
                    style: TextStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "${widget.job.startTime.substring(0, 10).replaceAll(RegExp(r'-'), '.')} - ${widget.job.endTime.substring(0, 10).substring(0, 10).replaceAll(RegExp(r'-'), '.')}",
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(top: 22, bottom: 10),
          child: Table(
            //border: TableBorder.all(),
            children: [
              TableRow(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.location_on_outlined,
                            color: Color(0xffA9A9A9)),
                        Text(
                          widget.job.authorAddress,
                          style: const TextStyle(
                            color: Color(0xffA9A9A9),
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.upload_file_outlined,
                          color: Color(0xffA9A9A9)),
                      Text(
                        " ${widget.job.slots} Applicants",
                        style: const TextStyle(
                          color: Color(0xffA9A9A9),
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              TableRow(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 14),
                    child: Row(
                      children: [
                        Container(width: 3),
                        const Icon(
                          Icons.monetization_on_outlined,
                          color: Color(0xffA9A9A9),
                          size: 20,
                        ),
                        Text(
                          "  \$${widget.job.salary}",
                          style: TextStyle(
                            color: AppColor.blue,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      tag(widget.job.tags.split(",")[0]),
                      widget.job.tags.split(",").length > 1
                          ? tag(widget.job.tags.split(",")[1])
                          : Container(),
                    ],
                  ),
                ],
              ),
              TableRow(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 14),
                    child: Row(
                      children: [
                        Container(width: 3),
                        const Icon(
                          Icons.badge_outlined,
                          color: Color(0xffA9A9A9),
                          size: 20,
                        ),
                        Text(
                          "  ${widget.job.typeOfWorking}",
                          style: TextStyle(
                            color: AppColor.gray,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.job.tags.split(",").length > 2
                          ? tag(widget.job.tags.split(",")[2])
                          : Container(),
                      widget.job.tags.split(",").length > 3
                          ? tag(widget.job.tags.split(",")[3])
                          : Container(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffF6F6F6)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonTab(context, isDescription, "General"),
              buttonTab(context, !isDescription, "Company"),
            ],
          ),
        ),
        isDescription ? general() : company(),
        Container(
          padding: const EdgeInsets.only(top: 10, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/web.png"),
                      const Text(
                        "Website",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "www.pinterest.com",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: Color(0xff1976D2),
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xff1976D2),
                          decorationThickness: 3,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/Industry.png"),
                      const Text(
                        "Industry",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "Socialmedia",
                        style: TextStyle(
                          color: Color(0xffA9A9A9),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/CompanySize.png"),
                      const Text(
                        "Company size",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${widget.job.authorSize} employees",
                        style: const TextStyle(
                          color: Color(0xffA9A9A9),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(height: 30),
              const Text(
                "Office address",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                widget.job.authorAddress,
                style: const TextStyle(
                  color: Color(0xffA9A9A9),
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
          margin: const EdgeInsets.only(bottom: 30),
          child: TextButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xff1976D2)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ))),
            child: const Text(
              "Apply This Job",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Color(0xffFFFFFF),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buttonTab(BuildContext context, bool isActive, text) {
    return SizedBox(
      height: 40,
      width: 150,
      child: TextButton(
        onPressed: () {
          setState(() {
            isDescription = !isDescription;
          });
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              isActive ? const Color(0xffFFFFFF) : const Color(0xffF6F6F6),
            ),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ))),
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? AppColor.blue : const Color(0xffA9A9A9),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget descriptionContent(title, String content) {
    return content.length > 1
        ? Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding:
                const EdgeInsets.only(top: 25, bottom: 25, left: 20, right: 20),
            decoration: BoxDecoration(
              color: ColorHelper.colorFromHex("#F6F6F6"),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  content,
                  style: const TextStyle(
                    color: Color(0xffA9A9A9),
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          )
        : Container();
  }

  Widget general() {
    return Container(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Expanded(
                child:
                    descriptionContent("Description", widget.job.description),
              ),
            ]),
            Row(children: [
              Expanded(
                child:
                    descriptionContent("Requirements", widget.job.requirements),
              ),
            ]),
            Row(children: [
              Expanded(
                  child: descriptionContent("Benefit", widget.job.benefits)),
            ]),
          ],
        ));
  }

  Widget company() {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child:
                    descriptionContent("Introduction", widget.job.authorAbout),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget tag(tag) {
    return tag != null
        ? Container(
            margin: const EdgeInsets.only(right: 10),
            child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xffE4F9FF)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ))),
              child: Text(
                tag,
                style: const TextStyle(
                    color: Color(0xff1976D2),
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        : Container();
  }
}
