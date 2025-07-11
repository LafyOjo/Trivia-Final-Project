import { doc, setDoc } from 'firebase/firestore';
import { db } from '../firebaseConfig';

export interface UserProfile {
  uid: string;
  email: string;
  xp: number;
  coins: number;
}

export const createUserProfile = async (profile: UserProfile) => {
  await setDoc(doc(db, 'users', profile.uid), profile);
};
