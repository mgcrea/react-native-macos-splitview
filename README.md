# react-native-macos-splitview

NSSplitView component for react-native on macOS

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
