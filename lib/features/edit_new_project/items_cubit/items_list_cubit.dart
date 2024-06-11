import 'package:flutter_bloc/flutter_bloc.dart';

enum ListViewType {
  base,
  list1,
  list2,
  list3,
  list4,
  list5,
  list6,
  list7,
  list8,
  list9,
  list10,
}

class ItemsListCubit extends Cubit<ListViewType> {
  ItemsListCubit() : super(ListViewType.base);

  void switchToBase() {
    emit(ListViewType.base);
  }

  void switchToList1() {
    emit(ListViewType.list1);
  }

  void switchToList2() {
    emit(ListViewType.list2);
  }

  void switchToList3() {
    emit(ListViewType.list3);
  }

  void switchToList4() {
    emit(ListViewType.list4);
  }

  void switchToList5() {
    emit(ListViewType.list5);
  }

  void switchToList6() {
    emit(ListViewType.list6);
  }

  void switchToList7() {
    emit(ListViewType.list7);
  }

  void switchToList8() {
    emit(ListViewType.list8);
  }

  void switchToList9() {
    emit(ListViewType.list9);
  }

  void switchToList10() {
    emit(ListViewType.list10);
  }
}
