# iOS Workshop Part III (Programatic UI Completed)
## Prerequisites
* A basic understanding of Swift
  * Ability to create a basic, single-view app
* Project enviornment set up, see below 
* At least 1 reading from the list below 

## Installing CocoaPods

### Without latest ruby installed (currently 2.3.1):
* Install rbenv if you do not have it already: `brew install rbenv`
* Install most recent, stable version of ruby: `rbenv install 2.3.1` 

### With Ruby already installed: 
* Install CocoaPods: `gem install cocoapods`

## Setting up Project
### Install Xcode
* Download Xcode from the Apple App Store

### Clone Repo 
* clone repo: `git@github.com:Cramsden/iOS.git`
* run `./RestExample/scripts/bootstrap`
* open the project: `open RestExample/HelloRest.xcworkspace` 

### Start the server
* From the main directory, `cd server`
* Install dependencies, `npm install`
* Start server, `npm start`

## Workshop Agenda
1. Walkthrough, build familiarity with existing code and functionality (Group)
2. Add the phone number of each contact as the cell description. Do this without refactoring the current service method  `getAllPeople()` but instead by building a new one for the `/listAll` endpoint. The code should look very similar to how the data for `/list` is fetched and displayed. (pairs)
3. Walkthrough transitioning to a new view by tapping on a cell (Group)
4. Build out service method that retreieves data from `/personByID` endpoint (Pairs)
5. Use ReactiveCocoa to build out a ViewController and ViewModel using signals (Group)
6. Display the data returned from `/personByID` on the UI using the signals implemented as a group (Pairs)

## Readings 
### MVVM
* https://www.objc.io/issues/13-architecture/mvvm/
* http://artsy.github.io/blog/2015/09/24/mvvm-in-swift/

### Quick/Nimble Testing
* https://github.com/Quick/Quick/blob/master/Documentation/en-us/TestingApps.md
* https://github.com/Quick/Nimble

### Reactive Cocoa
* http://ifnotapps.com/2013/07/25/reactivecocoa-from-the-ground-floor-part1/

# Next Branch: `add_new_person`


