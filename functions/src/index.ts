
const {initializeApp} = require("firebase-admin/app");
initializeApp(); //functions.config().firebase);

// export {upperCase} from './uppercase';
export {setShareCodes} from './setSharedCode';
export {addUserToSharedList} from './addUserToSharedList';
