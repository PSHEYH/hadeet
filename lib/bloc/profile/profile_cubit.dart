import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'profile_cubit.g.dart';
part 'profile_state.dart';

class ProfileCubit extends HydratedCubit<ProfileState> {
  ProfileCubit() : super(ProfileState());



  @override
  ProfileState fromJson(Map<String, dynamic> json) => ProfileState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(ProfileState state) {
    return state.toJson();
  }
}
