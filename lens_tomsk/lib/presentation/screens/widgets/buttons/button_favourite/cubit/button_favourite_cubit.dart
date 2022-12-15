import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:lens_tomsk/data/repository/Favourite_product.dart';
import 'package:lens_tomsk/domain/models/Product.dart';
import 'package:lens_tomsk/presentation/common/constants.dart';
import 'package:lens_tomsk/presentation/common/local_notice_service.dart';
import 'package:lens_tomsk/presentation/screens/widgets/buttons/button_favourite/cubit/button_favourite_state.dart';

class ButtonFavouriteCubit extends Cubit<ButtonFavouriteState> {
  ButtonFavouriteCubit({required this.product})
      : super(favouriteProducts.contains(product)
            ? FavouriteState(favouriteColor: kWhiteBlueColor)
            : NotFavouriteState(notFavouriteColor: kBlueColor));
  final Product product;


  void makeFavourite(product) {
    LocalNoticeService().addNotification(
      'Notification Title',
      'Notification Body',
      DateTime.now().millisecondsSinceEpoch + 1000,
      channel: 'testing',
    );
    favouriteProducts.add(product);
    emit(FavouriteState(favouriteColor: kWhiteBlueColor));
  }

  void makeNotFavourite(product) {
    favouriteProducts.remove(product);
    emit(NotFavouriteState(notFavouriteColor: kBlueColor));
  }
}
