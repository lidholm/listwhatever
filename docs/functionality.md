# Functionality

## Basic functionality

The basic functionality of the app is that the user can create different lists,
and each list can then contains multiple different items.  
Each item can have a name and some free text info, it can also contain dates, date and times,  
and/or map coordinates and addresses. Aside from those values, an item can also contain
a list of categories and for each category a number of values. These categories and values  
along with the dates can be filtered on.
As an example. a list can contain a number of restaurants, the categories can be something
like, `Vegan options` with values `Yes` and `No`, and `Open for lunch`.

### Maps

For a list with the `map option` enabled, there is besides the list view of items also
a map view, with each of the items location on the map. The location is typically found
by, when creating the item, inputting the address and then using a lookup to get the coordinates.

### Dates

## Sharing

A list can be shared with friends, for example, if a user is going on a trip with some friends,
they can collaborate on creating a list of things to see or do on the trip.
Once a user has created a list, that list can then be shared, which creates a link to send to
the person/people the user wants to share the lists with. Once clicking on the link (and possible logging in)
the list is addess to their list of lists with an icon indicating it is a shared list.
For a shared list, a user can add/change/delete items as usual and they can update information about
the list itself. Deleting the list, will actually not delete the list, but just indicate that
the user no longer wishes to collaborate on it.

## Filters

Some description about what filters are and how they can be used.

### How filtering is made

- If no filters are set, then all items will be visible.
- If date filters are set:
  - Items without a date will still be visible.
- If only start date filter is set, items with a date after the start date will be visible, others not. Dates are inclusive.
- If only end date filter is set, items with a date before the end date will be visible, others not. Dates are inclusive.
- If both start date and end date filters are set, items with a date between the start date and end date are visible, others not. Dates are inclusive.
- If category filters are set:
  - Items that doesn't have a value for the set category will still be visible.
  - For a category, a filter can be set for multiple values. An item can have also have multiple values for each category
    - For an item to be visible, the item either needs to have all of the values for each category, or no values for a category.

If multiple types of filters are set, e.g. category filters, and dates, then both criteria need to be met for the items to be visible.
