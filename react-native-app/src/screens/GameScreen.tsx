import React, { useEffect, useState } from 'react';
import { View, Text, Button } from 'react-native';
import { NativeStackScreenProps } from '@react-navigation/native-stack';
import { RootStackParamList } from '../navigation/AppNavigator';
import { fetchQuestions, Question } from '../services/questionService';

export default function GameScreen({ navigation }: NativeStackScreenProps<RootStackParamList, 'Game'>) {
  const [questions, setQuestions] = useState<Question[]>([]);
  const [current, setCurrent] = useState(0);
  const [score, setScore] = useState(0);

  useEffect(() => {
    (async () => {
      const data = await fetchQuestions(10);
      setQuestions(data);
    })();
  }, []);

  const handleAnswer = (answer: string) => {
    if (answer === questions[current].correct_answer) {
      setScore(score + 1);
    }
    if (current + 1 < questions.length) {
      setCurrent(current + 1);
    } else {
      navigation.navigate('Home');
    }
  };

  if (!questions.length) {
    return <View />;
  }

  const q = questions[current];
  const choices = [...q.incorrect_answers, q.correct_answer].sort();

  return (
    <View style={{ flex: 1, padding: 16, justifyContent: 'center' }}>
      <Text>{q.question}</Text>
      {choices.map(choice => (
        <Button key={choice} title={choice} onPress={() => handleAnswer(choice)} />
      ))}
      <Text>Score: {score}</Text>
    </View>
  );
}
