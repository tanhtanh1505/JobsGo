import 'package:flutter/material.dart';
import 'package:jobsgo/themes/styles.dart';

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 22),
          child: Row(
            children: [
              Image.asset("assets/images/Pinterest.png"),
              Container(
                padding: const EdgeInsets.only(left: 15),
                child: RichText(
                  text: TextSpan(
                    text: "Pinterest",
                    style: TextStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: "\nUI/UX Designer",
                        style: TextStyle(
                          color: AppColor.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
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
                      children: const [
                        Icon(Icons.location_on_outlined,
                            color: Color(0xffA9A9A9)),
                        Text(
                          "San Francisco, USA",
                          style: TextStyle(
                            color: Color(0xffA9A9A9),
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.upload_file_outlined,
                          color: Color(0xffA9A9A9)),
                      Text(
                        "300 Applicants",
                        style: TextStyle(
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
                          "  \$10k- \$20k / Month",
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
              SizedBox(
                height: 40,
                width: 180,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color(0xffF6F6F6),
                      ),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ))),
                  child: const Text(
                    "Description",
                    style: TextStyle(
                      color: Color(0xffA9A9A9),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                width: 180,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xffFFFFFF)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ))),
                  child: const Text(
                    "Company",
                    style: TextStyle(
                      color: Color(0xffA9A9A9),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding:
              const EdgeInsets.only(left: 22, right: 30, top: 10, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Pinterest is a visual discovery engine for finding ideas like recipes,"
                " home and style inspiration, and more.",
                style: TextStyle(
                  color: Color(0xffA9A9A9),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Container(height: 40),
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
                      const Text(
                        "1-50 employees",
                        style: TextStyle(
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
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Text(
                "651 Brannan St, San Francisco, CA 94107, USA",
                style: TextStyle(
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
}
