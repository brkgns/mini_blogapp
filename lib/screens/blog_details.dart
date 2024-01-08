
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mini_blogapp/blocs/detail_bloc/detail_bloc.dart';
import 'package:mini_blogapp/blocs/detail_bloc/detail_event.dart';
import 'package:mini_blogapp/blocs/detail_bloc/detail_state.dart';

class BlogDetails extends StatefulWidget {
  const BlogDetails({
    Key? key,
    required this.blogId, required String id,
  }) : super(key: key);

  final String blogId;

  @override
  _BlogDetailsState createState() => _BlogDetailsState();
}

class _BlogDetailsState extends State<BlogDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(
      builder: (context, state) {
        if (state is DetailInitial) {
          context.read<DetailBloc>().add(FetchDetailId(id: widget.blogId));
          return const Center(
            child: Text("İstek Atılıyor"),
          );
        }
        if (state is DetailLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is DetailLoaded) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(55, 0, 105, 180),
              title: Text(state.blogs.title!),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 4 / 3,
                    child: Image.network(state.blogs.thumbnail!),
                  ),
                  Text(
                    state.blogs.author!,
                    style: const TextStyle(
                        color: Color.fromARGB(55, 0, 105, 180),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    state.blogs.content!,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        }
        if (state is DetailError) {
          return const Center(
            child: Text(
              "Hata Alındı",
              style: TextStyle(
                  fontWeight: FontWeight.w900, color: Colors.redAccent),
            ),
          );
        }
        return const Center(
          child: Text(
            "Veri Alınamadı",
            style:
                TextStyle(fontWeight: FontWeight.w900, color: Colors.redAccent),
          ),
        );
      },
    );
  }
}