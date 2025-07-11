import React, { useState } from 'react';
import { View, TextInput, Button } from 'react-native';
import { signIn, signUp } from '../services/auth';
import { NativeStackScreenProps } from '@react-navigation/native-stack';
import { RootStackParamList } from '../navigation/AppNavigator';
import { createUserProfile } from '../services/userService';

export default function LoginScreen({ navigation }: NativeStackScreenProps<RootStackParamList, 'Login'>) {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const handleSignUp = async () => {
    const cred = await signUp(email, password);
    await createUserProfile({ uid: cred.user.uid, email, xp: 0, coins: 0 });
    navigation.replace('Home');
  };

  const handleSignIn = async () => {
    await signIn(email, password);
    navigation.replace('Home');
  };

  return (
    <View style={{ flex: 1, justifyContent: 'center', padding: 16 }}>
      <TextInput placeholder="Email" onChangeText={setEmail} value={email} style={{ marginBottom: 12 }} />
      <TextInput placeholder="Password" secureTextEntry onChangeText={setPassword} value={password} style={{ marginBottom: 12 }} />
      <Button title="Sign In" onPress={handleSignIn} />
      <Button title="Sign Up" onPress={handleSignUp} />
    </View>
  );
}
