// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import '../screens/home/home_viewmodel.dart' as _i5;
import '../services/file_manager_service.dart' as _i4;
import 'injection_module.dart' as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.ImagePicker>(() => injectableModule.picker);
  gh.lazySingleton<_i4.FileManager>(
      () => _i4.FileManager(get<_i3.ImagePicker>()));
  gh.lazySingleton<_i5.HomeViewModel>(
      () => _i5.HomeViewModel(get<_i4.FileManager>()));
  return get;
}

class _$InjectableModule extends _i6.InjectableModule {}
