// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:sandbox/navigation/expander_button.dart'
    as _sandbox_navigation_expander_button;
import 'package:sandbox/navigation/navigation_panel.dart'
    as _sandbox_navigation_navigation_panel;
import 'package:sandbox/navigation/navigation_tree_item.dart'
    as _sandbox_navigation_navigation_tree_item;
import 'package:sandbox/navigation/navigation_tree_node.dart'
    as _sandbox_navigation_navigation_tree_node;
import 'package:sandbox/navigation/search_field.dart'
    as _sandbox_navigation_search_field;
import 'package:sandbox/navigation/stats_banner.dart'
    as _sandbox_navigation_stats_banner;
import 'package:sandbox/settings/nullable_setting.dart'
    as _sandbox_settings_nullable_setting;
import 'package:sandbox/settings/settings_panel.dart'
    as _sandbox_settings_settings_panel;
import 'package:widgetbook/widgetbook.dart' as _widgetbook;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'navigation',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'ExpanderIcon',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Default',
            builder: _sandbox_navigation_expander_button.expanderButton,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'NavigationPanel',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Default',
            builder: _sandbox_navigation_navigation_panel
                .navigationPanelDefaultUseCase,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'NavigationTreeNode',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Default',
            builder: _sandbox_navigation_navigation_tree_node
                .navigationTreeNodeDefaultUseCase,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'NavigationTreeTile',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Default',
            builder: _sandbox_navigation_navigation_tree_item
                .navigationTreeItemWithout,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'SearchField',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Default',
            builder: _sandbox_navigation_search_field.searchFieldDefaultUseCase,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'StatsBanner',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Default',
            builder: _sandbox_navigation_stats_banner.searchFieldDefaultUseCase,
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'settings',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'NullableSetting',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Default',
            builder: _sandbox_settings_nullable_setting.nullableSettingUseCase,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'SettingsPanel',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Default',
            builder: _sandbox_settings_settings_panel.settingsPanel,
          ),
        ],
      ),
    ],
  ),
];
