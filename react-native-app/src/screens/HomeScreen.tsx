import React from 'react';
import { View, Button, Text } from 'react-native';
import { NativeStackScreenProps } from '@react-navigation/native-stack';
import { RootStackParamList } from '../navigation/AppNavigator';

export default function HomeScreen({ navigation }: NativeStackScreenProps<RootStackParamList, 'Home'>) {
  return (
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
      <Text style={{ fontSize: 24, marginBottom: 20 }}>Welcome to Trivia!</Text>
      <Button title="Start Game" onPress={() => navigation.navigate('Game')} />
    </View>
  );
}
