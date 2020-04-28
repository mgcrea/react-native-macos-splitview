# react-native-macos-splitview

NSSplitView component for react-native on macOS.

Currently a work in progress, the native implementation is currently not working, howevever there is a functionnal pure js implementation.

## Installation

```sh
yarn add react-native-macos-splitview
```

- Add pod to your `macos/Podfile`, example:

```ruby
target 'MacOSSandbox-macOS' do
  platform :macos, '10.14'
  use_native_modules!
  # Pods specifically for macOS target
  pod 'RNSplitView', :path => "../node_modules/react-native-macos-splitview"
end
```

## Usage

From a `npx react-native init --template react-native-template-typescript Sandbox`:

```tsx
import React from 'react';
import {Button, StatusBar, StyleSheet, Text, View} from 'react-native';
import SplitView, {SplitViewDividerStyle} from 'react-native-macos-splitview';
import {
  Colors,
  DebugInstructions,
  ReloadInstructions,
} from 'react-native/Libraries/NewAppScreen';

const {SplitViewDividerStylePaneSplitter} = SplitViewDividerStyle;

const App = () => {
  return (
    <>
      <StatusBar barStyle="dark-content" />
      <SplitView
        dividerStyle={SplitViewDividerStylePaneSplitter}
        vertical={true}
        style={styles.splitView}>
        <View style={styles.masterContainer}>
          <Text style={styles.sectionTitle}>See Your Changes</Text>
          <Text style={styles.sectionDescription}>
            <ReloadInstructions />
          </Text>
          <Button
            title="Click me #1!"
            onPress={() => console.warn('#1 Pressed')}
          />
        </View>
        <View style={styles.detailContainer}>
          <Text style={styles.sectionTitle}>Debug</Text>
          <Text style={styles.sectionDescription}>
            <DebugInstructions />
          </Text>
          <Button
            title="Click me #2!"
            onPress={() => console.warn('#2 Pressed')}
          />
        </View>
      </SplitView>
    </>
  );
};

const styles = StyleSheet.create({
  splitView: {
    flexGrow: 1,
    flexDirection: 'row',
    alignItems: 'stretch',
  },
  masterContainer: {
    backgroundColor: 'darkgrey',
    alignItems: 'flex-start',
    flexGrow: 1,
    flexShrink: 1,
    flexBasis: 200,
  },
  detailContainer: {
    backgroundColor: 'lightgrey',
    alignItems: 'flex-start',
    flexGrow: 1,
    flexShrink: 1,
  },
  sectionTitle: {
    fontSize: 24,
    fontWeight: '600',
    color: Colors.black,
  },
  sectionDescription: {
    marginTop: 8,
    fontSize: 18,
    fontWeight: '400',
    color: Colors.dark,
  },
});

export default App;
```

## License

MIT

## Inspiration

https://github.com/malcommac/DMSplitView/blob/master/DMSplitViewExample/DMSplitView/DMSplitView.m
