# Just Women Just Walk
## Video Demo

[![Demo Video](http://img.youtube.com/vi/jmj2JH0Iix4/0.jpg)](http://www.youtube.com/watch?v=jmj2JH0Iix4 "INF 172: JWJW Final Demo")

## Figma
- View Prototypes: [Link](https://www.figma.com/proto/xOiCJiKDoqYKzoDlFtjAek/Just-Women-Just-Walk?node-id=370%3A3556&scaling=scale-down&page-id=4%3A2&starting-point-node-id=370%3A3556&show-proto-sidebar=1)
- View Designs: [Link](https://www.figma.com/file/xOiCJiKDoqYKzoDlFtjAek/Just-Women-Just-Walk?node-id=4%3A2)

## Development Notes
### Tools
- Swift 5
- XCode 12 or 13.3
- SwiftUI Library
- Firebase
- HealthKit (add as capability)

### Completed
- Views for Splash Screen
- Views for Onboarding
- Views for Graph
- HealthKit set up and permissions ([Reference](https://developer.apple.com/documentation/healthkit/authorizing_access_to_health_data))
- HealthKit Data Pull
- Daily, Weekly, Month Steps Progress Graph
- Bar graph for daily steps for the week

### TODO
- Backend for user sign up and user log in
- Splash screen should only show up on first launch (Use a bool in `UserDefaults` to note if is first launch)
- Loading screen not implemented
- Polish (padding, positioning, sizing more closer to figma)

### Not implemented
- Notifications and messaging
- Progress Tracker
- Settings for user tuning
