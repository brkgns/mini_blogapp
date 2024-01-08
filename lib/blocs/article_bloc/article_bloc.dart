
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_blogapp/blocs/article_bloc/article_event.dart';
import 'package:mini_blogapp/blocs/article_bloc/article_state.dart';
import 'package:mini_blogapp/repositories/article_repository.dart';

class ArticleBloc extends Bloc<ArticleEvent,ArticleState>  {
  final ArticleRepository articleRepository;


  ArticleBloc({required this.articleRepository}) : super(ArticlesInitial()) {
    on<FetchArticles>(_onFetchArticles);
   //on<AddArticle>(_onAddArticle);


  }
    void _onFetchArticles(FetchArticles event,Emitter<ArticleState> emit) async {
      emit(ArticlesLoading());
      
    //..
    try {

      final articles = await articleRepository.fetchAllBlogs();
      emit(ArticlesLoaded(blogs: articles));

    }catch (e) {
      
    emit(ArticlesError());
      
    //..

    } 
 
  }

    }
