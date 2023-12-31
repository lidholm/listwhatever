export function getRandomString(numberOfCharacters: number): string {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  const charLength = chars.length;
  let result = '';
  for (let i = 0; i < numberOfCharacters; i++) {
    result += chars.charAt(Math.floor(Math.random() * charLength));
  }
  return result;
}
