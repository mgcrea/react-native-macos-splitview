import React, {FunctionComponent} from 'react';
import {requireNativeComponent, ViewProps} from 'react-native';

export enum SplitViewDividerStyle {
  SplitViewDividerStyleThick,
  SplitViewDividerStyleThin,
  SplitViewDividerStylePaneSplitter,
}

type Props = ViewProps & {
  vertical?: boolean;
  dividerStyle?: SplitViewDividerStyle;
};

type NativeProps = Props;

const RNSplitView = requireNativeComponent<NativeProps>('RNSplitView');

const SplitView: FunctionComponent<Props> = ({...otherProps}) => {
  return <RNSplitView {...otherProps} />;
};

export default SplitView;
