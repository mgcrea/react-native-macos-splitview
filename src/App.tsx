import React from 'react';
import {Button, StatusBar, StyleSheet, Text, View} from 'react-native';
// import SplitViewModule, {
//   NativeSplitView,
//   SplitViewDividerStyle,
// } from 'react-native-macos-splitview/src';
import {
  Colors,
  DebugInstructions,
  ReloadInstructions,
} from 'react-native/Libraries/NewAppScreen';
import SplitView from 'src/modules/SplitView';

console.disableYellowBox = true;

const App = () => {
  return (
    <>
      <StatusBar barStyle="dark-content" />
      <View style={{flex: 1}}>
        <SplitView vertical={true} style={styles.splitView}>
          <SplitView.Pane style={styles.masterContainer}>
            <View style={styles.masterContainerInner}>
              <Text style={styles.sectionTitle}>See Your Changes</Text>
              <Text style={styles.sectionDescription}>
                <ReloadInstructions />
              </Text>
              <Button
                title="Click me #1!"
                onPress={async () => {
                  console.warn('#1 Pressed');
                }}
              />
            </View>
          </SplitView.Pane>
          <SplitView.Pane style={styles.detailContainer}>
            <View style={styles.detailContainerInner}>
              <Text style={styles.sectionTitle}>Debug</Text>
              <Text style={styles.sectionDescription}>
                <DebugInstructions />
              </Text>
              <Button
                title="Click me #2!"
                onPress={() => console.warn('#2 Pressed')}
              />
            </View>
          </SplitView.Pane>
        </SplitView>
      </View>
    </>
  );
};

const styles = StyleSheet.create({
  splitView: {
    backgroundColor: 'orange',
    flexGrow: 1,
    alignItems: 'stretch',
    flexDirection: 'row',
  },
  masterContainer: {
    backgroundColor: 'darkgrey',
    alignItems: 'stretch',
    // maxWidth: '40%',
    flexGrow: 1,
    flexShrink: 1,
    // flexBasis: 200,
    // minWidth: 200,
    // maxWidth: 400,
  },
  masterContainerInner: {
    flexGrow: 1,
    alignSelf: 'stretch',
    width: '100%',
    alignItems: 'stretch',
    backgroundColor: 'lightgrey',
    // paddingRight: 10,
  },
  detailContainer: {
    alignItems: 'stretch',
    backgroundColor: 'darkgrey',
    // alignItems: 'flex-start',
    // flex: 0,
    // alignItems: 'stretch',
    flexGrow: 1,
    flexShrink: 1,
    // flexBasis: 400,
    // width: '100%',
    // minWidth: 50,
    // maxWidth: '50%',
  },
  detailContainerInner: {
    flex: 1,
    alignItems: 'stretch',
    backgroundColor: 'lightgrey',
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
