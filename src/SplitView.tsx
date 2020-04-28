import React, {
  Children,
  FunctionComponent,
  ReactElement,
  useMemo,
  useRef,
} from 'react';
import {
  Animated,
  PanResponder,
  StyleSheet,
  View,
  ViewProps,
  ViewStyle,
} from 'react-native';
import AnimatedClamp from './utils/AnimatedClamp';

type RawAnimatedValue = {
  _value: number;
  _offset: number;
};

type Props = ViewProps & {
  vertical: boolean;
  dividerSize?: number;
  dividerStyle?: ViewStyle;
};

export const clamp = (value: number, min: number, max: number) =>
  Math.min(max, Math.max(min, value));

const SplitView: FunctionComponent<Props> = ({
  children,
  vertical = false,
  dividerSize = 10,
  dividerStyle,
  style,
  ...otherViewProps
}) => {
  const panes = Children.toArray(children) as ReactElement[];
  if (panes.length > 2) {
    throw new Error('<SplitView /> only supports at most two children for now');
  }

  const paneStyle = panes[0].props.style;
  const min = paneStyle[vertical ? 'minWidth' : 'minHeight'] || 0;
  const max = paneStyle[vertical ? 'maxWidth' : 'maxHeight'] || Infinity;
  const pan = useRef(
    new Animated.ValueXY({
      x: vertical ? paneStyle.flexBasis || 0 : 0,
      y: vertical ? 0 : paneStyle.flexBasis || 0,
    })
  ).current;
  const clampedValue = useRef(
    new AnimatedClamp(vertical ? pan.x : pan.y, min, max)
  ).current;
  const panResponder = useRef(
    PanResponder.create({
      onMoveShouldSetPanResponder: () => true,
      onPanResponderGrant: () => {
        pan.setOffset({
          x: ((pan.x as unknown) as RawAnimatedValue)._value,
          y: ((pan.y as unknown) as RawAnimatedValue)._value,
        });
      },
      onPanResponderMove: Animated.event([null, {dx: pan.x, dy: pan.y}]),
      onPanResponderRelease: () => {
        const axisValue = ((vertical
          ? pan.x
          : pan.y) as unknown) as RawAnimatedValue;
        axisValue._offset = clamp(
          axisValue._offset,
          min - axisValue._value,
          max - axisValue._value
        );
        clampedValue._lastValue = clamp(clampedValue._lastValue, min, max);
        pan.flattenOffset();
      },
    })
  ).current;

  const verticalStyle = useMemo<ViewStyle>(
    () => ({flexDirection: vertical ? 'row' : 'column'}),
    [vertical]
  );

  const dividerVerticalStyle = useMemo<ViewStyle>(
    () => ({[vertical ? 'width' : 'height']: dividerSize}),
    [vertical, dividerSize]
  );

  return (
    <View {...otherViewProps} style={[styles.splitView, verticalStyle, style]}>
      <Animated.View
        style={[
          styles.resizeablePan,
          // verticalStyle,
          {
            [vertical ? 'width' : 'height']: clampedValue,
          },
        ]}>
        {panes[0]}
      </Animated.View>
      <View
        style={[styles.divider, dividerVerticalStyle, dividerStyle]}
        {...panResponder.panHandlers}
      />
      {panes[1]}
    </View>
  );
};

export default SplitView;

const styles = StyleSheet.create({
  splitView: {
    backgroundColor: 'rgb(236, 236, 236)',
  },
  resizeablePan: {
    // flexGrow: 1,
    // alignItems: 'stretch',
  },
  divider: {
    // flexGrow: 0,
    // flexShrink: 0,
    // backgroundColor: 'darkgrey',
    // borderWidth: 1,
    // borderColor: 'black',
  },
});
