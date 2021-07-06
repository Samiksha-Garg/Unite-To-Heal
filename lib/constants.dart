import 'package:flutter/material.dart';

final Color kPrimaryColor = Color(0xffF0D8D7);
final Color kDarkBlue=Color(0xff18325b);
final Color kPurple=Color(0xff4d18bf);

final TextStyle kTabBarStyle = TextStyle(
    fontFamily: 'Coiny',
    fontSize: 15.0,
    fontWeight: FontWeight.w600
);

final List<String> agendas=[
  "By connecting people with similar medical problems through our app, they as a community would be able to discuss problems, find solutions, motivate each other and most importantly cheer each other up, resulting in a happy community.",
  "Our idea is to fill gap between medical treatment and the need for emotional support. A person's relationship with a doctor or other medical personnel may not provide adequate emotional support, and a person's family and friends may not understand the impact of a disease or treatment. So this app may function as a bridge between medical and emotional needs.",
  "In the times like covid where people can not go out for a meet in support group, this website really solves majority of problems. This provides a more widespread reach as people aren’t just restricted to connect with the people only living near them",
];

enum Occupation {Doctor,Other}

enum Gender {Male,Female,Other}

const BLOG_DATA =[
  {
    "image":"assets/images/blogimage1.jpg",
    "title":"Coping with an Illness or Serious Health Event",
    "written":"Lawrence Robinson"
  },
  {
    "image":"assets/images/blogimage2.webp",
    "title":"Living Well with a Disability",
    "written":"Melinda Smith, M.A"
  }
];