import axios from 'axios';

export interface Question {
  category: string;
  type: string;
  difficulty: string;
  question: string;
  correct_answer: string;
  incorrect_answers: string[];
}

export const fetchQuestions = async (amount = 10, category?: number, difficulty?: string) => {
  const params = new URLSearchParams({ amount: amount.toString() });
  if (category) params.append('category', category.toString());
  if (difficulty) params.append('difficulty', difficulty);
  const response = await axios.get(`https://opentdb.com/api.php?${params.toString()}`);
  return response.data.results as Question[];
};
