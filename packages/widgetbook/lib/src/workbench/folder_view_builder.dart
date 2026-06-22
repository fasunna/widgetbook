import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../addons/addons.dart' hide WidgetbookTheme;
import '../fields/fields.dart';
import '../navigation/navigation.dart';
import '../state/state.dart';
import '../widgetbook_theme.dart';
import 'safe_boundaries.dart';
import 'use_case_builder.dart';

/// The [FolderViewBuilder] renders all use cases from a folder in a responsive layout.
///
/// Each use case is wrapped with the configured addons (viewport, device frame, etc.)
/// and displayed in a grid or column layout based on available space.
@internal
class FolderViewBuilder extends StatelessWidget {
  const FolderViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final state = WidgetbookState.of(context);
    final useCases = state.folderUseCases;

    if (useCases.isEmpty) {
      return state.home;
    }

    final theme = WidgetbookTheme.of(context);
    final size = MediaQuery.of(context).size;

    // Determine if we should split into columns
    // Split if width > height (landscape) and there's enough space
    final shouldSplitColumns = size.width > size.height && size.width > 900;
    final columnCount = shouldSplitColumns ? 2 : 1;

    return Scaffold(
      body: SafeBoundaries(
        child: state.appBuilder(
          context,
          ColoredBox(
            color: theme.scaffoldBackgroundColor,
            child: SingleChildScrollView(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return GridView.count(
                    crossAxisCount: columnCount,
                    childAspectRatio: _calculateAspectRatio(
                      constraints.maxWidth / columnCount,
                      constraints.maxHeight,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      for (final useCase in useCases)
                        _UseCaseCard(
                          useCase: useCase,
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Calculate aspect ratio for grid items.
  ///
  /// This attempts to create square-ish cards for each use case.
  /// The aspect ratio is based on viewport size if configured.
  double _calculateAspectRatio(double maxWidth, double maxHeight) {
    // Default to 1:1 aspect ratio (square)
    return 1.0;
  }
}

/// A single use case card that renders one use case with all addons applied.
class _UseCaseCard extends StatelessWidget {
  const _UseCaseCard({
    required this.useCase,
  });

  final WidgetbookUseCase useCase;

  @override
  Widget build(BuildContext context) {
    final state = WidgetbookState.of(context);

    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Use case title
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              useCase.name,
              style: Theme.of(context).textTheme.titleSmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // Use case content wrapped with addons
          Expanded(
            child: MultiAddonBuilder(
              addons: state.addons,
              builder: (context, addon, child) {
                final state = WidgetbookState.of(context);
                final groupMap = FieldCodec.decodeQueryGroup(
                  state.queryParams[addon.groupName],
                );

                final newSetting = addon.valueFromQueryGroup(groupMap);

                return addon.buildUseCase(
                  context,
                  child,
                  newSetting,
                );
              },
              child: UseCaseBuilder(
                key: ValueKey(useCase.path),
                builder: (context) {
                  return useCase.build(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
