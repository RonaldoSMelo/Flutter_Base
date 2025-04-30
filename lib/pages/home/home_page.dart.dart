import 'package:flutter/material.dart';

enum PopupMenuPages {
  container,
  rows_columns,
  media_query,
  layout_builder,
  botoes_rotacao_texto,
  scrolls_single_child,
  list_view,
  dialogs,
  snackbar,
  forms,
  cidades,
  stack,
  stack2,
  bottom_navigator_bar,
  circle_avatar,
  colors,
  material_banner,
  sensor
}

class _MenuItem {
  final String label;
  final IconData icon;
  final String route;
  const _MenuItem(
      {required this.label, required this.icon, required this.route});
}

const List<_MenuItem> _menuItems = [
  _MenuItem(label: 'Container', icon: Icons.crop_square, route: '/container'),
  _MenuItem(
      label: 'Rows & Columns', icon: Icons.view_column, route: '/rows_columns'),
  _MenuItem(
      label: 'MediaQuery', icon: Icons.aspect_ratio, route: '/media_query'),
  _MenuItem(
      label: 'LayoutBuilder',
      icon: Icons.dashboard_customize,
      route: '/layout_builder'),
  _MenuItem(
      label: 'Botões e Rotação',
      icon: Icons.rotate_right,
      route: '/botoes_rotacao_texto'),
  _MenuItem(
      label: 'Scroll SingleChild',
      icon: Icons.swap_vert,
      route: '/scrolls_single_child'),
  _MenuItem(label: 'List View', icon: Icons.list, route: '/list_view'),
  _MenuItem(
      label: 'Dialogs', icon: Icons.chat_bubble_outline, route: '/dialogs'),
  _MenuItem(label: 'Snackbar', icon: Icons.message, route: '/snackbar'),
  _MenuItem(label: 'Forms', icon: Icons.assignment, route: '/forms'),
  _MenuItem(label: 'Cidades', icon: Icons.location_city, route: '/cidades'),
  _MenuItem(label: 'Stack', icon: Icons.layers, route: '/stack'),
  _MenuItem(label: 'Stack2', icon: Icons.layers_outlined, route: '/stack2'),
  _MenuItem(
      label: 'Bottom Nav Bar',
      icon: Icons.navigation,
      route: '/bottom_navigator_bar'),
  _MenuItem(
      label: 'Circle Avatar',
      icon: Icons.account_circle,
      route: '/circle_avatar'),
  _MenuItem(label: 'Cores', icon: Icons.color_lens, route: '/colors'),
  _MenuItem(
      label: 'Material Banner',
      icon: Icons.announcement,
      route: '/material_banner'),
  _MenuItem(label: 'Sensor', icon: Icons.directions_walk, route: '/sensor'),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          PopupMenuButton<PopupMenuPages>(
              tooltip: 'Selecione um Item do Menu',
              onSelected: (PopupMenuPages valueSelected) {
                switch (valueSelected) {
                  case PopupMenuPages.container:
                    Navigator.of(context).pushNamed('/container');
                    break;
                  case PopupMenuPages.rows_columns:
                    Navigator.of(context).pushNamed('/rows_columns');
                    break;
                  case PopupMenuPages.media_query:
                    Navigator.of(context).pushNamed('/media_query');
                    break;
                  case PopupMenuPages.layout_builder:
                    Navigator.of(context).pushNamed('/layout_builder');
                    break;
                  case PopupMenuPages.botoes_rotacao_texto:
                    Navigator.of(context).pushNamed('/botoes_rotacao_texto');
                    break;
                  case PopupMenuPages.scrolls_single_child:
                    Navigator.of(context).pushNamed('/scrolls_single_child');
                    break;
                  case PopupMenuPages.list_view:
                    Navigator.of(context).pushNamed('/list_view');
                    break;
                  case PopupMenuPages.dialogs:
                    Navigator.of(context).pushNamed('/dialogs');
                    break;
                  case PopupMenuPages.snackbar:
                    Navigator.of(context).pushNamed('/snackbar');
                    break;
                  case PopupMenuPages.forms:
                    Navigator.of(context).pushNamed('/forms');
                    break;
                  case PopupMenuPages.cidades:
                    Navigator.of(context).pushNamed('/cidades');
                    break;
                  case PopupMenuPages.stack:
                    Navigator.of(context).pushNamed('/stack');
                    break;
                  case PopupMenuPages.stack2:
                    Navigator.of(context).pushNamed('/stack2');
                    break;
                  case PopupMenuPages.bottom_navigator_bar:
                    Navigator.of(context).pushNamed('/bottom_navigator_bar');
                    break;
                  case PopupMenuPages.circle_avatar:
                    Navigator.of(context).pushNamed('/circle_avatar');
                    break;
                  case PopupMenuPages.colors:
                    Navigator.of(context).pushNamed('/colors');
                    break;
                  case PopupMenuPages.material_banner:
                    Navigator.of(context).pushNamed('/material_banner');
                    break;

                  case PopupMenuPages.sensor:
                    Navigator.of(context).pushNamed('/sensor');
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return const <PopupMenuItem<PopupMenuPages>>[
                  PopupMenuItem<PopupMenuPages>(
                    value: PopupMenuPages.container,
                    child: Text('Container'),
                  ),
                  PopupMenuItem<PopupMenuPages>(
                    value: PopupMenuPages.rows_columns,
                    child: Text('Rows & Columns'),
                  ),
                  PopupMenuItem<PopupMenuPages>(
                    value: PopupMenuPages.media_query,
                    child: Text('MediaQuery'),
                  ),
                  PopupMenuItem<PopupMenuPages>(
                    value: PopupMenuPages.layout_builder,
                    child: Text('LayoutBuilder'),
                  ),
                  PopupMenuItem<PopupMenuPages>(
                    value: PopupMenuPages.botoes_rotacao_texto,
                    child: Text('Botões e Rotação de texto'),
                  ),
                  PopupMenuItem<PopupMenuPages>(
                    value: PopupMenuPages.scrolls_single_child,
                    child: Text('Scroll SingleChild'),
                  ),
                  PopupMenuItem<PopupMenuPages>(
                    value: PopupMenuPages.list_view,
                    child: Text('List View'),
                  ),
                  PopupMenuItem<PopupMenuPages>(
                    value: PopupMenuPages.dialogs,
                    child: Text('Dialogs'),
                  ),
                  PopupMenuItem<PopupMenuPages>(
                    value: PopupMenuPages.snackbar,
                    child: Text('Snackbar'),
                  ),
                  PopupMenuItem<PopupMenuPages>(
                    value: PopupMenuPages.forms,
                    child: Text('Forms'),
                  ),
                  PopupMenuItem<PopupMenuPages>(
                    value: PopupMenuPages.cidades,
                    child: Text('Cidades'),
                  ),
                  PopupMenuItem<PopupMenuPages>(
                    value: PopupMenuPages.stack,
                    child: Text('Stack'),
                  ),
                  PopupMenuItem<PopupMenuPages>(
                    value: PopupMenuPages.stack2,
                    child: Text('Stack2'),
                  ),
                  PopupMenuItem<PopupMenuPages>(
                    value: PopupMenuPages.bottom_navigator_bar,
                    child: Text('Bottom Navigator Bar'),
                  ),
                  PopupMenuItem<PopupMenuPages>(
                    value: PopupMenuPages.circle_avatar,
                    child: Text('Circle Avatar'),
                  ),
                  PopupMenuItem<PopupMenuPages>(
                    value: PopupMenuPages.colors,
                    child: Text('Cores'),
                  ),
                  PopupMenuItem<PopupMenuPages>(
                    value: PopupMenuPages.material_banner,
                    child: Text('Material Banner'),
                  ),
                  PopupMenuItem<PopupMenuPages>(
                    value: PopupMenuPages.sensor,
                    child: Text('Sensor'),
                  ),
                ];
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.8,
          ),
          itemCount: _menuItems.length,
          itemBuilder: (context, index) {
            final item = _menuItems[index];
            return InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: () => Navigator.of(context).pushNamed(item.route),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(item.icon, size: 32, color: Colors.green[700]),
                      const SizedBox(height: 8),
                      Flexible(
                        child: Text(
                          item.label,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
