# Firestore structure

## Basic functionality

### `/users/:userId/` (User)

* `name`
* `email` ?

### `/users/:userId/lists/:listId` (UserList)

* `id`
* `listId`
* `listName`
* `listType` (`food`/`restaurant`/etc)
* `ownerId`

### `/lists/:listId` (List)

* `id`
* `name`
* `shareCodeForEditor`
* `shareCodeForViewer`
* `shared` (boolean)
* `sharedWith` (dictionary of userIds as keys and `editor`/`viewer` as value)
* `type`
* `withDates`
* `withMap`
* `withTimes`

### `/users/:userId/lists/:listId/listItems/:listItemId` (ListItem)

* `id`
* `name`
* `address`
* `categories`
* `datetime`
* `info`
* `latestUpdateUser`
* `latLong`
* `urls`

### `/shareCodes/:shareCode` (ShareCode)

* `listName`
* `listType`
* `listId`
* `ownerName`
* `ownerUserId`
* `shareType` (`viewer`/editor`)
