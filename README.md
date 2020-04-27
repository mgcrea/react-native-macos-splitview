# react-native-macos-splitview

NSSplitView component for react-native on macOS

## Installation

```sh
yarn add react-native-macos-splitview
```

## Usage

```tsx
import SplitView, {SplitViewDividerStyle} from 'react-native-macos-splitview';

type Props = {};

const MasterDetailView: FunctionComponent<Props> = () => {
  return (
    <SplitView
      dividerStyle={SplitViewDividerStyle.SplitViewDividerStylePaneSplitter}
      vertical={true}
      style={{flexGrow: 1, flexDirection: 'row'}}>
      <MasterView />
      <DetailView />
    </SplitView>
  );
};
```

## License

MIT

## Inspiration

https://github.com/malcommac/DMSplitView/blob/master/DMSplitViewExample/DMSplitView/DMSplitView.m
