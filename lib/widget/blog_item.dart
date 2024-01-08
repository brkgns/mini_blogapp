import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_blogapp/blocs/detail_bloc/detail_bloc.dart';
import 'package:mini_blogapp/blocs/detail_bloc/detail_event.dart';
import 'package:mini_blogapp/models/blogs.dart';
import 'package:mini_blogapp/screens/blog_details.dart';

class BlogItem extends StatelessWidget {
  const BlogItem({super.key, required this.blog});

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<DetailBloc>().add(ResetEvent());
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogDetails(id: blog.id!, blogId: '',),
          ),
        );
      },
      child: Card(
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