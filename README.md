#  FourScreens + MVVM
тестовое задание Four different screens

# Использованный стек
SwiftUI, URLSession, SharedDataModel, UserDefaults, GCD, Dependency Injection (custom @propertyWrapper)
![Запись экрана 2023-07-12 в 22 07 12](https://github.com/AlexShtandaruk/FourScreens/assets/125973696/0c1d13d4-1d7a-4e32-bc94-393b5130f2c7)
![Запись экрана 2023-07-12 в 22 08 44](https://github.com/AlexShtandaruk/FourScreens/assets/125973696/b6de0bf2-126d-4f89-93fc-d2518199e9a0)

так же:
- soa: Networking, Fetching, Datacaretaker;
- Локализация: english и русский;
- Кастомный шрифт;
- Кастомные цвета.

# Описание

*разделение на flow сделано через SharedDataModel, через Bool параметр launch. Изначально была мысль сделать навигацию через свою кастомную NavigationStack (custom NavStack [link](https://github.com/AlexShtandaruk/NavStackSwiftUI), пример использования в [этом](https://github.com/AlexShtandaruk/FoodApp) тестовом), с ее помощью тоже идет полный переход на свое flow в котором появляется понятие popToRoot и т.д., но по заданию нужно переход сделать на различные потоки не внутри TabBar, а в отдельную от него ветку, поэтому сделано так. Еще можно было бы сделать через .overlay, но тогда полным данный переход не назовешь, так как это просто покрытие сверху, ну как вариант.

*fetching вынесен в отдельный метод, на тот случай если мы захотим парсить данные не в одной viewModel, а в нескольких, и чтобы не повторять код.

*dipendency injection сделано через serviceLocator и configurator, обычный метод через init(...) и assemblyBuilder всем известен, а так вроде как интересней

*методы для networking и datacaretaker сделаны общими (для любой модели подписанной под codable) и выполнены через generic;

***P.S.
- в каком-то смысле аналогичное приложение (по роутингу), но на UIKit выполнено [здесь](https://github.com/AlexShtandaruk/astonMovieList)
- там где больше играл с UI на swiftUI [здесь](https://github.com/AlexShtandaruk/MovieListSwiftUI) 

