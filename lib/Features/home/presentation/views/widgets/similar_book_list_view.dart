import 'package:bookly_app/Core/widgets/custom_error_widget.dart';
import 'package:bookly_app/Core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/Features/home/presentation/manager/similar_books_cubit/similar_book_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_book_image.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBookCubit, SimilarBookState>(
        builder: (context, state) {
      if (state is SimilarBookSuccess) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .15,
          child: ListView.builder(
            itemCount: state.books.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: CustomBookImage(
                  imageUrl:
                      state.books[index].volumeInfo.imageLinks?.thumbnail ?? "",
                ),
              );
            },
          ),
        );
      } else if (state is SimilarBookFailure) {
        return CustomErrorWidget(errMessage: state.errMessage);
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
