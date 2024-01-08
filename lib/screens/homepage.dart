import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_blogapp/blocs/article_bloc/article_bloc.dart';
import 'package:mini_blogapp/blocs/article_bloc/article_event.dart';
import 'package:mini_blogapp/blocs/article_bloc/article_state.dart';
import 'package:mini_blogapp/models/blogs.dart';
import 'package:mini_blogapp/screens/add_blog.dart';
import 'package:mini_blogapp/widget/blog_item.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
    final ScrollController _scrollController = ScrollController();

   List<Blog> blogs = [];

  @override
  void initState() {
    super.initState();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 200),
      curve: Curves.bounceOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(55, 0, 105, 180),
        title: const Text(
          "Bloglar",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              bool? result = await Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => AddBlog()),
              );

              if (result == true) {
              context.read<ArticleBloc>().add(FetchArticles());  }
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<ArticleBloc, ArticleState>(
          builder: (context, state) {
            if (state is ArticlesInitial) {context .read<ArticleBloc>()
            .add(FetchArticles()); 
              return const Center(
                child: Text("İstek atılıyor..."),
              );
            }
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            );

            if (state is ArticlesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            );

            if (state is ArticlesLoaded) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<ArticleBloc>().add(FetchArticles());
                },
                child: ListView.builder(
                    itemCount: state.blogs.length,
                    itemBuilder: (context, index) =>
                        BlogItem(blog: state.blogs[index])),
              );
            }
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            );

            if (state is ArticlesError) {
              return const Center(
                child: Text("Bloc'lar yüklenirken hata oluştu."),
              );
            }

            return const Center(
              child: Text("Unknow State"),
            );
          },
        ),
      ),
    );
  }
}

