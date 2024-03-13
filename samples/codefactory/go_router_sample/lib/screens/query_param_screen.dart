import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/layout/default_layout.dart';

class QueryParamScreen extends StatelessWidget {
  const QueryParamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          Text('qeury params: ${GoRouterState.of(context).queryParameters}'),
          ElevatedButton(
            onPressed: () {
              context.push(
                Uri(
                  path: '/query_param',
                  queryParameters: {
                    'name': 'AAA',
                    'age': '1',
                  },
                ).toString(),
              );
            },
            child: const Text('Query Params'),
          ),
        ],
      ),
    );
  }
}
