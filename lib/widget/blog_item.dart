import 'package:flutter/material.dart';
import 'package:mini_blogapp/models/blogs.dart';

class BlogItem extends StatelessWidget {
  const BlogItem({super.key, required this.blog});

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(14),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            AspectRatio(
                aspectRatio: 4 / 2,
                child: Container(
                  width: double.infinity,
                  color: Color.fromARGB(255, 238, 238, 238),
                  child: Center(child: Image.network(blog.thumbnail!)),
                )),
            ListTile(
              title: Text(blog.title!,style: TextStyle(fontWeight: FontWeight.w600),),
              subtitle: Text(blog.author!,style: TextStyle(fontWeight: FontWeight.w500),),
            )
          ],
        ),
      ),
    );
  }
}