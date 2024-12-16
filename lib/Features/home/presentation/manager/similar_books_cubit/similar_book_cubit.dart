import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/book_model/book_model.dart';
import '../../../data/repos/home_repo.dart';
part 'similar_book_state.dart';

class SimilarBookCubit extends Cubit<SimilarBookState> {
  SimilarBookCubit(this.homeRepo) : super(SimilarBookInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBookLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);

    result.fold((failure) {
      emit(
        SimilarBookFailure(failure.errMessage),
      );
    }, (books) {
      emit(
        SimilarBookSuccess(books),
      );
    });
  }
}
