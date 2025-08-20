import 'package:flutter/material.dart';
import 'package:flutter_primeiro_projeto/pages/botoes_rotacao_texto/botoes_rotacao_texto.dart';
import 'package:flutter_primeiro_projeto/pages/bottom_navigator_bar/bottom_navigator_bar_page.dart';
import 'package:flutter_primeiro_projeto/pages/cidades/cidades_page.dart';
import 'package:flutter_primeiro_projeto/pages/circle_avatar/circle_avatar_page.dart';
import 'package:flutter_primeiro_projeto/pages/colors/colors_page.dart';
import 'package:flutter_primeiro_projeto/pages/container/container_page.dart';
import 'package:flutter_primeiro_projeto/pages/dialogs/dialogs_page.dart';
import 'package:flutter_primeiro_projeto/pages/forms/forms_page.dart';
import 'package:flutter_primeiro_projeto/pages/home/home_page.dart.dart';
import 'package:flutter_primeiro_projeto/pages/layout_builder/layout_builder_page.dart';
import 'package:flutter_primeiro_projeto/pages/material_banner/material_banner_page.dart';
import 'package:flutter_primeiro_projeto/pages/media_query/media_query_page.dart';
import 'package:flutter_primeiro_projeto/pages/rows_columns/rows_column_page.dart';
import 'package:flutter_primeiro_projeto/pages/scrolls/listview_page.dart';
import 'package:flutter_primeiro_projeto/pages/scrolls/singlechildscrollviewpage.dart';
import 'package:flutter_primeiro_projeto/pages/sensor/sensor_page.dart';
import 'package:flutter_primeiro_projeto/pages/snackbar/snackbar_page.dart';
import 'package:flutter_primeiro_projeto/pages/stack/stack_page.dart';
import 'package:flutter_primeiro_projeto/pages/stack/stack_page2.dart';
import 'package:flutter_primeiro_projeto/pages/state_management/state_management_page.dart';

class AppRoutes {
  static const home = '/';
  static const container = '/container';
  static const rowsColumns = '/rows_columns';
  static const mediaQuery = '/media_query';
  static const layoutBuilder = '/layout_builder';
  static const botoesRotacaoTexto = '/botoes_rotacao_texto';
  static const scrollsSingleChild = '/scrolls_single_child';
  static const listView = '/list_view';
  static const dialogs = '/dialogs';
  static const snackbar = '/snackbar';
  static const forms = '/forms';
  static const cidades = '/cidades';
  static const stack = '/stack';
  static const stack2 = '/stack2';
  static const bottomNavigatorBar = '/bottom_navigator_bar';
  static const circleAvatar = '/circle_avatar';
  static const colors = '/colors';
  static const materialBanner = '/material_banner';
  static const sensor = '/sensor';
  static const stateManagement = '/state_management';

  static Map<String, WidgetBuilder> get routes {
    return {
      home: (_) => const HomePage(),
      container: (_) => const ContainerPage(),
      rowsColumns: (_) => const RowsColumnPage(),
      mediaQuery: (_) => const MediaQueryPage(),
      layoutBuilder: (_) => const LayoutBuilderPage(),
      botoesRotacaoTexto: (_) => const BotoesRotacaoTexto(),
      scrollsSingleChild: (_) => const SinglechildscrollviewPage(),
      listView: (_) => const ListviewPage(),
      dialogs: (_) => const DialogsPage(),
      snackbar: (_) => const SnackbarPage(),
      forms: (_) => const FormsPage(),
      cidades: (_) => const CidadesPage(),
      stack: (_) => const StackPage(),
      stack2: (_) => const StackPage2(),
      bottomNavigatorBar: (_) => const BottomNavigatorBarPage(),
      circleAvatar: (_) => const CircleAvatarPage(),
      colors: (_) => const ColorsPage(),
      materialBanner: (_) => const MaterialBannerPage(),
      sensor: (_) => const StepCounterApp(),
      stateManagement: (_) => const StateManagementPage(),
    };
  }
}
