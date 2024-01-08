import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_blogapp/blocs/detail_bloc/detail_event.dart';
import 'package:mini_blogapp/blocs/detail_bloc/detail_state.dart';
import 'package:mini_blogapp/repositories/article_repository.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final ArticleRepository articleRepository;

  DetailBloc({required this.articleRepository}) : super(DetailInitial()) {

    on<FetchDetailId>(
        _onFetchDetailId); 
    on<ResetEvent>(_onResetEvent);
  }
  void _onFetchDetailId(FetchDetailId event, Emitter<DetailState> emit) async {
    emit(DetailLoading());

    try {
      final articles = await articleRepository.fetchBlogId(event.id);
      emit(DetailLoaded(
        blogs: articles,
      )); 
    } catch (e) {
      emit(DetailError());
    }
  }

  void _onResetEvent(ResetEvent event, Emitter<DetailState> emit) async {
    emit(DetailInitial());
  }
}