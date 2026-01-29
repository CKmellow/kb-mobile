# Side Menu Implementation Plan

## Task: Implement Side Menu with Notification Bell

### Files to Create:
1. `lib/features/home/components/side_menu.dart` - Side menu component ✓

### Files to Modify:
1. `lib/features/home/home_view.dart` - Add notification bell and drawer ✓

---

## Implementation Details

### Step 1: Create Side Menu Component (side_menu.dart)
- [x] Top section: KB logo image, user name, last login time
- [x] Second section: Menu options (Profile, Security, Alerts & Notifications, Branch Locator)
- [x] Bottom section: Contact Us and Logout
- [x] Dark/light theme support
- [x] Placeholder navigation handlers

### Step 2: Update Home View (home_view.dart)
- [x] Replace static profile container with GestureDetector
- [x] Add notification bell icon on the right side of app bar
- [x] Implement Scaffold drawer property
- [x] Update profile tap handler to open drawer

### Step 3: Testing
- [x] Verify notification bell appears on opposite side of profile
- [x] Verify drawer opens when profile is tapped
- [x] Verify side menu layout (3 sections)
- [x] Verify theme compatibility

---

## Notes
- Use existing `assets/images/kb_logo.png` for KB logo
- Follow existing color scheme from `AppColors`
- Use existing typography from `AppTypography`

## Implementation Complete ✓
The side menu has been successfully implemented with:
- Notification bell icon on the right side of the app bar (opposite profile)
- Profile avatar is now tappable and opens the side drawer
- Side menu contains 3 sections:
  1. Top: KB logo, user name, last login time
  2. Middle: Profile, Security, Alerts & Notifications, Branch Locator
  3. Bottom: Contact Us, Logout
- Dark/light theme support
- Placeholder navigation handlers for all menu items

