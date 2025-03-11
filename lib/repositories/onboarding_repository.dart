
import 'package:get_storage/get_storage.dart';

class OnboardingRepository{
    static final OnboardingRepository instance = OnboardingRepository._internal();

    OnboardingRepository._internal();

    final _box = GetStorage();

    bool fetchFirstEnter(){
        return _box.read('first_enter') ?? true;
    }

    void saveFirstEnter(bool value){
        _box.write('first_enter', value);
    }

}