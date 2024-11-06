import 'package:shop_app/app/data/repositorites_impls/category_repository_impl.dart';
import 'package:shop_app/app/domain/entities/category.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';
import 'package:shop_app/core/base/usecases/usecase.dart';

class GetAllCategoriesUsecase extends UseCase<DataState<List<Category>>, void> {
  final CategoryRepositoryImpl _categoryRepository;

  GetAllCategoriesUsecase(this._categoryRepository);
  @override
  Future<DataState<List<Category>>> call({void params}) async {
    return await _categoryRepository.fetchAllCategories()
        as DataState<List<Category>>;
  }
}
