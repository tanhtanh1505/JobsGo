import 'package:flutter/material.dart';
import 'package:jobsgo/component/button_image.dart';
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
        Container(
          padding: const EdgeInsets.only(left: 22),
          child: Row(
            children: [
              ButtonImage(
                  urlImage: widget.job.authorAvatar,
                  isNetWorkImage: true,
                  isStaticImage: false,
                  goto: Employer(
                    id: widget.job.author,
                  )),
              Container(
                padding: const EdgeInsets.only(left: 15),
                child: RichText(
                  text: TextSpan(
                    text: widget.job.authorName,
                    style: TextStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    children: [
                      TextSpan(
                        text: "\n${widget.job.title}",
                        style: TextStyle(
                          color: AppColor.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 22, top: 22, bottom: 10),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xffE4F9FF)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ))),
                            child: const Text(
                              "UI/UX Designer",
                              style: TextStyle(
                                  color: Color(0xff1976D2),
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xffE4F9FF)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ))),
                            child: const Text(
                              "Remote",
                              style: TextStyle(
                                  color: Color(0xff1976D2),
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xffE4F9FF)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ))),
                        child: const Text(
                          "Fulltime",
                          style: TextStyle(
                              color: Color(0xff1976D2),
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 60,
          width: 316,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffF6F6F6)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonTab(context, isDescription, "Description"),
              buttonTab(context, !isDescription, "Company"),
            ],
          ),
        ),
        isDescription ? description() : company(),
        Container(
          padding:
              const EdgeInsets.only(left: 22, right: 30, top: 10, bottom: 30),
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

  Widget buttonTab(BuildContext context, isActive, text) {
    return SizedBox(
      height: 40,
      width: 180,
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
          style: const TextStyle(
            color: Color(0xffA9A9A9),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget description() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Text(
        widget.job.description,
        style: const TextStyle(
          fontSize: 13,
        ),
      ),
    );
  }

  Widget company() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Text(
        widget.job.authorAbout,
        style: const TextStyle(
          fontSize: 13,
        ),
      ),
    );
  }
}
