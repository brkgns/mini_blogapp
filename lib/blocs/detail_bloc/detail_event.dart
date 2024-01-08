abstract class DetailEvent {} 

class FetchDetailId extends DetailEvent {
  final String id;

  FetchDetailId({required this.id});
} 

class ResetEvent extends DetailEvent {}