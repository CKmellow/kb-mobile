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
The side menu has been successfully implemented with modern, appealing styling:

### Design Features:
- **Gradient header** with KB logo glow effect
- **Section headers** (ACCOUNT, SERVICES) with proper typography
- **Styled menu items** with icon containers and hover effects
- **Notification badge** on Alerts & Notifications (3 unread)
- **Highlighted Branch Locator** with green accent
- **Custom styled Logout button** with red theme
- **Enhanced logout dialog** with icons and proper styling
- **Dark/Light theme support** throughout

### Side Menu Structure:
1. **Top Section**: KB logo with glow, user name, last login with icon
2. **Middle Section**: 
   - ACCOUNT: Profile, Security, Alerts & Notifications (with badge)
   - SERVICES: Branch Locator
3. **Bottom Section**: Contact Us, Logout

### Color Scheme:
- Primary green accents (`#13EC13`) consistent with app theme
- Light theme: Clean white background with soft green accents
- Dark theme: Dark background with subtle green highlights

