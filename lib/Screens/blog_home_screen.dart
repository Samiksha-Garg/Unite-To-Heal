import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:UniteToHeal/constants.dart';
import 'package:UniteToHeal/CustomWidgets/custom_widgets.dart';
import 'screens.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  static String id ='blog_page';

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 180,
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 13.0),
            child: Text(
              'Blog!',
              style: TextStyle(
                color: kPurple,
                fontFamily: 'Pacifico',
                fontSize: 30,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: (){},
              icon: Icon(Icons.settings, color: kPurple, size: 30,)
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: InputBox(
                      title: 'Search what you are looking for',
                      icon: Icons.search,
                      obscureText: false
                  ),
                ),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      BlogCard(title: 'All Blogs', color: Colors.yellow,),
                      BlogCard(title: 'Covid-19 Related',color: Colors.lightGreenAccent,),
                      BlogCard(title: 'Lifestyle Related',color: Colors.lightBlueAccent,),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: BLOG_DATA.length,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context,index) {
                        return BlogList(title: BLOG_DATA[index]["title"], written: BLOG_DATA[index]["written"], image: BLOG_DATA[index]["image"]);
                      }),
                )
              ],
            ),
            Positioned(
              bottom: 30,
                left:100,
                right: 100,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black
                  ),
                  child: Center(
                    child: TextButton(
                      child: Text(
                        'Log In to add blogs \n and better user experience',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, LogInPage.id);
                      },
                    ),
                  ),
                )
            )
          ],
        )
      ),
    );
  }
}


