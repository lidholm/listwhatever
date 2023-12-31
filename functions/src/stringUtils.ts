export function getRandomString(numberOfCharacters: number): string {
  var chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  var charLength = chars.length;
  var result = '';
  for ( var i = 0; i < numberOfCharacters; i++ ) {
    result += chars.charAt(Math.floor(Math.random() * charLength));
  }
  return result;
}
