import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hadeet/models/today/task_status_view.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'today_cubit.g.dart';
part 'today_state.dart';

class TodayCubit extends HydratedCubit<TodayState> {
  TodayCubit() : super(TodayState());

  TextEditingController textEditingController = TextEditingController();


  @override
  TodayState fromJson(Map<String, dynamic> json) => TodayState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(TodayState state) {
    return state.toJson();
  }
}
