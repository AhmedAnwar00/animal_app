import 'package:animal_app/core/network/dio_client.dart';
import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/widgets/app_bottom_nav.dart';
import 'package:animal_app/features/animal/controller/animal_controller.dart';
import 'package:animal_app/features/animal/service/animal_service.dart';
import 'package:animal_app/features/animal/ui/animal_page.dart';
import 'package:animal_app/features/category/controller/category_controller.dart';
import 'package:animal_app/features/category/service/category_service.dart';
import 'package:animal_app/features/category/ui/category_page.dart';
import 'package:animal_app/features/home/ui/home_page.dart';
import 'package:animal_app/features/me/ui/me_page.dart';
import 'package:animal_app/features/search/ui/search_page.dart';
import 'package:animal_app/features/shell/controller/app_shell_controller.dart';
import 'package:flutter/material.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  late final AppShellController _controller;
  late final CategoryController _categoryController;
  late final AnimalController _animalController;

  @override
  void initState() {
    super.initState();
    _controller = AppShellController();
    _categoryController = CategoryController(CategoryService(DioClient()));
    _animalController = AnimalController(
      AnimalService(DioClient()),
      _categoryController,
    );
    _categoryController.loadCategories();
    _animalController.loadAnimals();
  }

  @override
  void dispose() {
    _animalController.dispose();
    _categoryController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: IndexedStack(
            index: _controller.selectedIndex,
            children: [
              HomePage(
                categoryController: _categoryController,
                animalController: _animalController,
              ),
              const SearchPage(),
              CategoryPage(controller: _categoryController),
              AnimalPage(controller: _animalController),
              const MePage(),
            ],
          ),
          bottomNavigationBar: AppBottomNav(
            currentIndex: _controller.selectedIndex,
            onTap: _controller.selectTab,
          ),
        );
      },
    );
  }
}
