import 'package:flutter/material.dart';
import 'package:UniteToHeal/constants.dart';

class BlogList extends StatelessWidget {

  final title;
  final written;
  final image;

  const BlogList({Key? key,required this.title,required this.written,required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: Colors.grey
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(image,width: double.infinity, height: 200),
                  Divider(
                    color: Colors.grey,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Rakkas',
                        color: kDarkBlue
                    ),
                  ),
                  Text(
                    'By: $written',
                    style:TextStyle(
                        fontSize: 15,
                        fontFamily: 'Rakkas',
                        color: kDarkBlue
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
