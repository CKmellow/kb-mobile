# Task: Move floating arrows to middle section of cards

## Objective
Move the navigation arrows from outside the account cards to inside the cards as floating positioned arrows on the left and right edges, vertically centered on each card.

## Steps

### Step 1: Update _AccountCard widget
- Add new parameters: currentPage, pageController, onPreviousPage, onNextPage, totalPages
- Add Positioned left arrow with proper alignment
- Add Positioned right arrow with proper alignment
- Style arrows to look like floating elements on card edges

### Step 2: Update HomeView parent widget
- Remove external IconButton arrows from the Row
- Pass navigation parameters to each _AccountCard instance
- Update the card carousel structure to work with embedded arrows

### Step 3: Test the implementation
- Verify arrows are visible on each card
- Verify navigation works properly
- Verify arrows are vertically centered on the cards

## Status
- [x] Step 1: Update _AccountCard widget with arrow parameters and Positioned arrows
- [x] Step 2: Update HomeView parent widget to pass parameters and remove external arrows
- [x] Step 3: Test the implementation (flutter analyze passed)

