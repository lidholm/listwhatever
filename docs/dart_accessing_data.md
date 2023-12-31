# Accessing data in Dart

## Services

### UserListsService

Getting data from `/users/:userId/lists/:listId`, which will contain some basic information
to list all lists for a user. Also contains the reference to the list in
`/lists/:listId`.

### ListsService

Getting data from `/lists/:listId`, which contains all the data for the list, and has
a subcollection for all the items for the list. It also contain information of how can 
access the data, 
* `ownerId`
* `shared` (boolean)
* `sharedWith` (dictionary of userIds as keys and `editor`/`viewer` as value)
* `shareCodeForEditor`
* `shareCodeForViewer`

### ListItemsService

Getting data from `/lists/:listId/listItems/:itemId`

## Blocs

Some info

