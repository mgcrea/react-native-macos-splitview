import React, {FunctionComponent} from 'react';
import {requireNativeComponent, ViewProps} from 'react-native';

// export type Region = {
//   latitude: number;
//   longitude: number;
//   latitudeDelta: number;
//   longitudeDelta: number;
// };

// export interface RegionChangeEvent {
//   region: Region;
//   target: number;
// }

export enum SplitViewDividerStyle {
  SplitViewDividerStyleThick,
  SplitViewDividerStyleThin,
  SplitViewDividerStylePaneSplitter,
}

type Props = ViewProps & {
  vertical?: boolean;
  dividerStyle?: SplitViewDividerStyle;
  // zoomEnabled?: boolean;
  // scrollEnabled?: boolean;
  // pitchEnabled?: boolean;
  // rotateEnabled?: boolean;
  // onRegionChange?: (region: Region) => void;
};

type NativeProps = Props;

const RNSplitView = requireNativeComponent<NativeProps>('RNSplitView');

const SplitView: FunctionComponent<Props> = ({...otherProps}) => {
  // const onRegionChange = useCallback(
  //   (event: NativeSyntheticEvent<RegionChangeEvent>) => {
  //     const {region} = event.nativeEvent;
  //     if (propOnRegionChange) {
  //       propOnRegionChange(region);
  //     }
  //   },
  //   [propOnRegionChange],
  // );
  return <RNSplitView {...otherProps} />;
};

const RNSplitViewPane = requireNativeComponent<NativeProps>('RNSplitViewPane');

export default Object.assign(SplitView, {Pane: RNSplitViewPane});

export {RNSplitViewPane as SplitViewPane};
