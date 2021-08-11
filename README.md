# Heart Rate Tracker

This project was built with Xcode 12.5 and Swift 5 for iOS 14

### Using The App

Fairly straight forward, you'll need:

* Xcode (12.5 is recommended), 
* a device that is on iOS 14 or later (alternatively you can a simulator), 
* and an Apple Developer account to managing the signing.
   
All that's left is to build and run the app. Happy demoing!

### How To Capture Heart Rate

While tempted to build my own method of doing so, the undertaking would be quite large. In the future I'd hope to implement such a feature.

The most common and seemingly effective approach (without dedicated sensors) would be to have the user place their index finger on the camera lense and compare the sequential images for subtle variations. Averaging these the discrepancy between the changes would give you a basic heartbeat rhythym.  

## Testing Strategy

While not a large project there's still reason to test. Unit testing would be the foremost approach; being sure all validation and data is properly handled. Meeting requirements and being sure they work well together is a difficult task, so following would be integration tests to ensure all technical requirements are met.

## Author Note

While normally I prefer to stick with writing layouts programmatically, for the scale of this project I decided it would be overkill and quickly mocked up things with storyboards.
